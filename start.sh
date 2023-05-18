pip install -r requirements.txt
git lfs install
git clone https://huggingface.co/THUDM/chatglm-6b
git clone https://huggingface.co/datasets/anon8231489123/ShareGPT_Vicuna_unfiltered
pip install gradio
python web_demo.py