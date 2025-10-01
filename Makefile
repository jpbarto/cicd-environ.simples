.phony: all

cicd_build:
	./cicd/build.sh

cicd_deliver:
	./cicd/deliver.sh

cicd_deploy:
	./cicd/deploy.sh