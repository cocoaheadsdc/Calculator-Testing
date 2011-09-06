# Where to put the XML-files from your unit tests
TEST_REPORTS_FOLDER = "test-reports"

require 'time'
require 'FileUtils'
require 'socket'

class ReportParser

  attr_reader :exit_code
  
  def initialize(piped_input)
    
    @test_suite_level = 0
    @test_reports_subfolder = 1
    
    @piped_input = piped_input
    @exit_code = 0
    
    FileUtils.rm_rf(TEST_REPORTS_FOLDER)
    FileUtils.mkdir(TEST_REPORTS_FOLDER)
    parse_input
  end

  private
  
  def parse_input
    @piped_input.each do |piped_row|
      puts piped_row
      case piped_row
        
        when /Test Suite '(\S+)'.*started at\s+(.*)/
          puts $1
          t = Time.parse($2.to_s)
          handle_start_test_suite(t)

        when /Test Suite '(\S+)'.*finished at\s+(.*)./
          puts $1
          t = Time.parse($2.to_s)
          handle_end_test_suite($1,t)     

        when /Test Case '-\[\S+\s+(\S+)\]' started./
          test_case = $1

        when /Test Case '-\[\S+\s+(\S+)\]' passed \((.*) seconds\)/
          test_case = $1
          test_case_duration = $2.to_f
          handle_test_passed(test_case,test_case_duration)

        when /(.*): error: -\[(\S+) (\S+)\] : (.*)/
          error_location = $1
          test_suite = $2
          test_case = $3
          error_message = $4
          handle_test_error(test_suite,test_case,error_message,error_location)
    
        when /Test Case '-\[\S+ (\S+)\]' failed \((\S+) seconds\)/
          test_case = $1
          test_case_duration = $2.to_f
          handle_test_failed(test_case,test_case_duration)
    
        when /failed with exit code (\d+)/
          @exit_code = $1.to_i
          
        when
          /BUILD FAILED/
          @exit_code = -1;
      end
    end
  end
  
  def handle_start_test_suite(start_time)
    @test_suite_level += 1
    @total_failed_test_cases = 0
    @total_passed_test_cases = 0
    @tests_results = Hash.new # test_case -> duration
    @errors = Hash.new  # test_case -> error_msg
    @ended_current_test_suite = false
    @cur_start_time = start_time
  end

  def handle_end_test_suite(test_name,end_time)
        
    unless @ended_current_test_suite
      
      unless File.exists?("#{TEST_REPORTS_FOLDER}/"+@test_reports_subfolder.to_s)
        FileUtils.mkdir("#{TEST_REPORTS_FOLDER}/"+@test_reports_subfolder.to_s)
      end
      
      file_name = "#{TEST_REPORTS_FOLDER}/"+@test_reports_subfolder.to_s+"/TEST-#{test_name}.xml"
      
      puts file_name
      
      current_file = File.open(file_name, 'a')
      host_name = string_to_xml Socket.gethostname
      test_name = string_to_xml test_name
      test_duration = (end_time - @cur_start_time).to_s
      total_tests = @total_failed_test_cases + @total_passed_test_cases
      suite_info = '<testsuite errors="0" failures="'+@total_failed_test_cases.to_s+'" hostname="'+host_name+'" name="'+test_name+@test_reports_subfolder.to_s+'" tests="'+total_tests.to_s+'" time="'+test_duration.to_s+'" timestamp="'+end_time.to_s+'">'
      current_file << "<?xml version='1.0' encoding='UTF-8' ?>\n"
      current_file << suite_info
      @tests_results.each do |t|
        test_case = string_to_xml t[0]
        duration = @tests_results[test_case]
        current_file << "<testcase classname='#{test_name}' name='#{test_case}' time='#{duration.to_s}'"
        unless @errors[test_case].nil?
          # uh oh we got a failure
          puts "tests_errors[0]"
          puts @errors[test_case][0]
          puts "tests_errors[1]"
          puts @errors[test_case][1]
          
          message = string_to_xml @errors[test_case][0].to_s
          location = string_to_xml @errors[test_case][1].to_s
          current_file << ">\n"
          current_file << "<failure message='#{message}' type='Failure'>#{location}</failure>\n"
          current_file << "</testcase>\n"
        else
          current_file << " />\n"
        end
      end
      current_file << "</testsuite>\n"
      current_file.close
      @ended_current_test_suite = true
    end
    
    puts @test_suite_level.to_s
    puts @test_reports_subfolder.to_s
    
    @test_suite_level -= 1
    if @test_suite_level==0
      @test_reports_subfolder += 1
    end
    
    puts @test_suite_level.to_s
    puts @test_reports_subfolder.to_s
    
  end

  def string_to_xml(s)
    s.gsub(/&/, '&amp;').gsub(/'/, '&quot;').gsub(/</, '&lt;')
  end
  
  def handle_test_passed(test_case,test_case_duration)
    @total_passed_test_cases += 1
    @tests_results[test_case] = test_case_duration
  end

  def handle_test_error(test_suite,test_case,error_message,error_location)
#    error_message.tr!('<','').tr!('>','')
    @errors[test_case] = [ error_message, error_location ]
  end

  def handle_test_failed(test_case,test_case_duration) 
    @total_failed_test_cases +=1
    @tests_results[test_case] = test_case_duration
  end
 
end

#piped_input = File.open("tests_fail.txt") # for debugging
piped_input = ARGF.read

report = ReportParser.new(piped_input)

exit report.exit_code