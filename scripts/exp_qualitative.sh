#!/bin/bash

. /home/server25/anaconda3/etc/profile.d/conda.sh


home_dir='/home/server25/minyeong_workspace'
root_dir="${home_dir}/Experiment"
src_list=data/qualitative_source_wild
drv_list=data/qualitative_speech_mead
# ignore_list=data/qualitative_ignore

src_list=$(cat $src_list)
drv_list=$(cat $drv_list)
# ignore_list=$(cat ignore_list)

conda deactivate
###################################### models ##########################################\\

### Ours ###
# model_label=Ours
# timestamp=`date +%Y%m%d%H%M`
# model_dir="/home/ubuntu/workspace/BFv2v"
# res_dir="/home/ubuntu/workspace/Experiment/qualitative/${model_label}/${timestamp}"

# checkpoint="${home_dir}/BFv2v/ckpt/00000037-checkpoint.pth.tar"
# checkpoint_headmodel="${home_dir}/BFv2v/log_headmodel/v4.2/best.tar"

# mkdir -p qualitative/$model_label
# rm -rf $res_dir
# mkdir $res_dir

# cd $model_dir

# ckpt_list="
# wo_mask_ft.tar
# "

# for ckpt in $ckpt_list
# do
#     for src_path in $src_list
#     do
#         for drv_path in $drv_list
#         do
            # src_path=${home_dir}/$src_path
            # drv_path=${home_dir}/$drv_path
#             src=$(basename $src_path .png)
#             drv=$(basename $drv_path .mp4)
#             checkpoint=$checkpoint_dir/$ckpt
#             source_image=$src_path
#             driving_video=$drv_path
#             label=${src}_${drv}
#             vid=${label}.mp4
#             conda activate fom
#             python drive_mesh.py --checkpoint $checkpoint_headmodel --src_img $source_image --drv_vid $driving_video

#             python demo.py --config config/vox-256-renderer_v9.yaml --checkpoint "${checkpoint}" --source_image $source_image --checkpoint_headmodel $checkpoint_headmodel --result_dir $res_dir --result_vid mute_$vid --driven_dir log_headmodel/v4.2 --driving_video $driving_video

#             conda deactivate

#             # ffmpeg -y -i ${res_dir}/mute_$vid -i $driving_video -map 0:v:0 -map 1:a:0 -filter:v fps=25 ${res_dir}/${vid}
#             # rm -rf ${res_dir}/mute_${vid}

#             # shot_dir=${res_dir}/${vid}_shot
#             # rm -rf $shot_dir
#             # mkdir $shot_dir 
#             # ffmpeg -y -i ${res_dir}/${vid} -r 25 ${shot_dir}/%05d.png

#             # conda activate gpen
#             # cd ../GPEN
#             # CUDA_VISIBLE_DEVICES=1 python demo.py --task FaceEnhancement --model GPEN-BFR-256 --in_size 256 --channel_multiplier 1 --narrow 0.5 --use_sr --sr_scale 4 --use_cuda --save_face --indir $shot_dir --outdir ${shot_dir}_SR
#             # cd $model_dir
#             # conda deactivate
#             # ffmpeg -y -r 25 -i ${shot_dir}_SR/%05d_GPEN.jpg -vf fps=25 ${res_dir}/SR_mute_${vid}
#             # ffmpeg -y -i ${res_dir}/SR_mute_${vid} -i $driving_video -map 0:v:0 -map 1:a:0 ${res_dir}/SR_${vid}
#             # rm -rf $shot_dir
#             # rm -rf ${shot_dir}_SR
#             # rm -rf ${res_dir}/SR_mute_${vid}

#             # ffmpeg -i $source_image -i $driving_video -i ${res_dir}/SR_${vid} -filter_complex \
#             # "[0:v]scale=-1:256[v1]; \
#             # [1:v]scale=-1:256,crop=trunc(iw/2)*2:trunc(ih/2)*2[v2];\
#             # [2:v]scale=-1:256,crop=trunc(iw/2)*2:trunc(ih/2)*2[v3]; \
#             # [v1][v2][v3]hstack=inputs=3[v]" -map "[v]" -map 1:a ${res_dir}/compare_${vid}

#         done
#     done
# done




### Nvidia Face Vid2Vid ###
# model_label=NFv2v
# timestamp=`date +%Y%m%d%H%M`
# model_dir="${home_dir}/fv2v"
# res_dir="${home_dir}/Experiment/qualitative/${model_label}/${timestamp}"

# checkpoint="${home_dir}/fv2v/ckpt/00000189-checkpoint.pth.tar"

# mkdir -p qualitative/$model_label
# rm -rf $res_dir
# mkdir $res_dir

# cd $model_dir

# for src_path in $src_list
# do
#     for drv_path in $drv_list
#     do
        # src_path=${home_dir}/$src_path
        # drv_path=${home_dir}/$drv_path
#         src=$(basename $src_path .png)
#         drv=$(basename $drv_path .mp4)
#         source_image=$src_path
#         driving_video=$drv_path
#         label=${src}_${drv}
#         vid=${label}.mp4
#         conda activate fom

#         python demo.py --config config/vox-256.yaml --checkpoint $checkpoint --source_image $source_image --driving_video $driving_video --adapt_scale --find_best_frame --result_video ${res_dir}/mute_${vid}
#         conda deactivate

#         ffmpeg -y -i ${res_dir}/mute_$vid -i $driving_video -map 0:v:0 -map 1:a:0 -filter:v fps=25 ${res_dir}/${vid}
#         rm -rf ${res_dir}/mute_${vid}

#         shot_dir=${res_dir}/${vid}_shot
#         rm -rf $shot_dir
#         mkdir $shot_dir 
#         ffmpeg -y -i ${res_dir}/${vid} -r 25 ${shot_dir}/%05d.png

#         conda activate gpen
#         cd ../GPEN
#         CUDA_VISIBLE_DEVICES=1 python demo.py --task FaceEnhancement --model GPEN-BFR-256 --in_size 256 --channel_multiplier 1 --narrow 0.5 --use_sr --sr_scale 4 --use_cuda --save_face --indir $shot_dir --outdir ${shot_dir}_SR
#         cd $model_dir
#         conda deactivate
#         ffmpeg -y -r 25 -i ${shot_dir}_SR/%05d_GPEN.jpg -vf fps=25 ${res_dir}/SR_mute_${vid}
#         ffmpeg -y -i ${res_dir}/SR_mute_${vid} -i $driving_video -map 0:v:0 -map 1:a:0 ${res_dir}/SR_${vid}
#         rm -rf $shot_dir
#         rm -rf ${shot_dir}_SR
#         rm -rf ${res_dir}/SR_mute_${vid}

#         ffmpeg -i $source_image -i $driving_video -i ${res_dir}/SR_${vid} -filter_complex \
#         "[0:v]scale=-1:256[v1]; \
#         [1:v]scale=-1:256,crop=trunc(iw/2)*2:trunc(ih/2)*2[v2];\
#         [2:v]scale=-1:256,crop=trunc(iw/2)*2:trunc(ih/2)*2[v3]; \
#         [v1][v2][v3]hstack=inputs=3[v]" -map "[v]" -map 1:a ${res_dir}/compare_${vid}
#     done
# done


### Thin Plate Spline Motion Model ###
model_label=TPSMM
timestamp=`date +%Y%m%d%H%M`
model_dir="${home_dir}/TPSMM"
res_dir="${home_dir}/Experiment/qualitative/${model_label}/${timestamp}"

checkpoint="${home_dir}/TPSMM/ckpt/vox.pth.tar"

mkdir -p qualitative/$model_label
rm -rf $res_dir
mkdir $res_dir

cd $model_dir

for src_path in $src_list
do
    for drv_path in $drv_list
    do
        src_path=${home_dir}/$src_path
        drv_path=${home_dir}/$drv_path
        src=$(basename $src_path .png)
        drv=$(basename $drv_path .mp4)
        source_image=$src_path
        driving_video=$drv_path
        label=${src}_${drv}
        vid=${label}.mp4
        conda activate fom

        python demo.py --config config/vox-256.yaml --checkpoint $checkpoint --source_image $source_image --driving_video $driving_video --result_video ${res_dir}/mute_${vid} --find_best_frame
        conda deactivate

        ffmpeg -y -i ${res_dir}/mute_$vid -i $driving_video -map 0:v:0 -map 1:a:0 -filter:v fps=25 ${res_dir}/${vid}
        rm -rf ${res_dir}/mute_${vid}

        # shot_dir=${res_dir}/${vid}_shot
        # rm -rf $shot_dir
        # mkdir $shot_dir 
        # ffmpeg -y -i ${res_dir}/${vid} -r 25 ${shot_dir}/%05d.png

        # conda activate gpen
        # cd ../GPEN
        # CUDA_VISIBLE_DEVICES=1 python demo.py --task FaceEnhancement --model GPEN-BFR-256 --in_size 256 --channel_multiplier 1 --narrow 0.5 --use_sr --sr_scale 4 --use_cuda --save_face --indir $shot_dir --outdir ${shot_dir}_SR
        # cd $model_dir
        # conda deactivate
        # ffmpeg -y -r 25 -i ${shot_dir}_SR/%05d_GPEN.jpg -vf fps=25 ${res_dir}/SR_mute_${vid}
        # ffmpeg -y -i ${res_dir}/SR_mute_${vid} -i $driving_video -map 0:v:0 -map 1:a:0 ${res_dir}/SR_${vid}
        # rm -rf $shot_dir
        # rm -rf ${shot_dir}_SR
        # rm -rf ${res_dir}/SR_mute_${vid}

        # ffmpeg -i $source_image -i $driving_video -i ${res_dir}/SR_${vid} -filter_complex \
        # "[0:v]scale=-1:256[v1]; \
        # [1:v]scale=-1:256,crop=trunc(iw/2)*2:trunc(ih/2)*2[v2];\
        # [2:v]scale=-1:256,crop=trunc(iw/2)*2:trunc(ih/2)*2[v3]; \
        # [v1][v2][v3]hstack=inputs=3[v]" -map "[v]" -map 1:a ${res_dir}/compare_${vid}
    done
done

### FOM ###


### X2Face ###







