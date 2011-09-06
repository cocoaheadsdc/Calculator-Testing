all:
	. ./automated_scripts/DevBuild.sh
clean:
	. ./automated_scripts/Clean.sh
deploy:	distribution
	. ./automated_scripts/PrepareIPA.sh
	. ./automated_scripts/DeployToAppStore.sh
distribution:
	. ./automated_scripts/DistributionBuild.sh
frank:
	. ./automated_scripts/FrankBuild.sh
	. ./automated_scripts/RunFrankTests.sh
