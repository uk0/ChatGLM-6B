
apt update
apt install vim git  git-lfs wget gcc g++ -y

wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O ~/miniconda.sh

bash ~/miniconda.sh -b -p $HOME/miniconda
~/miniconda/bin/conda init $(echo $SHELL | awk -F '/' '{print $NF}')
echo 'Successfully installed miniconda...'
echo -n 'Conda version: '
~/miniconda/bin/conda --version
echo -e '\n'
exec bash
