all:
	. automated_build_scripts/DevBuild.sh
clean:
	. automated_build_scripts/Clean.sh
deploy:	distribution
	. automated_build_scripts/PrepareIPA.sh
	. automated_build_scripts/DeployToAppStore.sh
distribution:
	. automated_build_scripts/DistributionBuild.sh
frank:
	. automated_build_scripts/FrankBuild.sh
	. automated_build_scripts/RunFrankTests.sh
