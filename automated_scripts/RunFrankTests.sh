#!/bin/bash

rm -rf cuke-results;
mkdir cuke-results;
cucumber -f html --o cuke-results/index.html -f junit --o ./cuke-results/test-reports;
