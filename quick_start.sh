wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O ~/miniconda.sh

bash ~/miniconda.sh -b -p $HOME/miniconda
~/miniconda/bin/conda init $(echo $SHELL | awk -F '/' '{print $NF}')
echo 'Successfully installed miniconda...'
echo -n 'Conda version: '
~/miniconda/bin/conda --version
echo -e '\n'
exec bash

##install lfs
apt install git-lfs

pip install -r requirements.txt
git lfs install
git clone https://huggingface.co/THUDM/chatglm-6b
pip install gradio
python web_demo.py