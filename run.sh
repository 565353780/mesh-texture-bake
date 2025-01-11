rgb_path=./demos/example_000.png
save_folder=./outputs/test

use_lite=false
do_texture_mapping=true
max_faces_num=90000

mkdir -p $save_folder

python infer/removebg.py \
  --rgb_path $rgb_path \
  --output_rgba_path $save_folder/img_nobg.png &&
  python infer/image_to_views.py \
    --rgba_path $save_folder/img_nobg.png \
    --output_views_path $save_folder/views.jpg \
    --output_cond_path $save_folder/cond.jpg \
    --seed 0 \
    --steps 50 \
    --device "cuda:0" \
    --use_lite $use_lite &&
  python infer/views_to_mesh.py \
    --views_path $save_folder/views.jpg \
    --cond_path $save_folder/cond.jpg \
    --save_folder $save_folder \
    --max_faces_num $max_faces_num \
    --mv23d_cfg_path ./svrm/configs/svrm.yaml \
    --mv23d_ckt_path ./weights/svrm/svrm.safetensors \
    --device "cuda:0" \
    --use_lite $use_lite \
    --do_texture_mapping ${do_texture_mapping} &&
  python infer/gif_render.py \
    --mesh_path $save_folder/mesh.obj \
    --output_gif_path $save_folder/output.gif
