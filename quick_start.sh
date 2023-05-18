
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

pip install -r requirements.txt
git lfs install
git clone https://huggingface.co/THUDM/chatglm-6b
git clone https://huggingface.co/datasets/anon8231489123/ShareGPT_Vicuna_unfiltered
pip install gradio
python web_demo.py