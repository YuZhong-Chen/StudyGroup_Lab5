##### This script will be executed after the container-building process. #####

sudo apt update

git clone git@github.com:YuZhong-Chen/.setup_env.git ~/.setup_env
cd ~/.setup_env && ./install.sh