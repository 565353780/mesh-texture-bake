# Mesh Texture Bake

## Source

```bash
https://github.com/Tencent/Hunyuan3D-1
```

## Download

```bash
# necessary
mkdir weights
huggingface-cli download tencent/Hunyuan3D-1 --local-dir ./weights

# for text2image
mkdir weights/hunyuanDiT
huggingface-cli download Tencent-Hunyuan/HunyuanDiT-v1.1-Diffusers-Distilled --local-dir ./weights/hunyuanDiT

# for texture baking
mkdir -p ./third_party/weights/DUSt3R_ViTLarge_BaseDecoder_512_dpt
huggingface-cli download naver/DUSt3R_ViTLarge_BaseDecoder_512_dpt \
    --local-dir ./third_party/weights/DUSt3R_ViTLarge_BaseDecoder_512_dpt

cd ./third_party
git clone --recursive https://github.com/naver/dust3r.git

cd ..
```

## Setup

```bash
conda create -n mtb python=3.10
conda activate mtb
./setup.sh
```

## Run

```bash
python demo.py
```

## Enjoy it~
