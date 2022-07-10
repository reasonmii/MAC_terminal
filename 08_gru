gru:
   TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES="4" \
   nohup poetry run samsung_fit_model --max_epochs 1000 --dataset mimic3_mortality --balance --log_dir gru \
    --early_stopping 30 GRUModel > gru.log &

gru_simple:
   TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES="5" \
   nohup poetry run samsung_fit_model --max_epochs 1000 --dataset mimic3_mortality --balance --log_dir gru_simple \
    --early_stopping 30 GRUSimpleModel > gru_simple.log &

gru_mean:
   TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES="6" \
   nohup poetry run samsung_fit_model --max_epochs 1000 --dataset mimic3_mortality --balance --log_dir gru_mean \
    --early_stopping 30 GRUMeanModel > gru_mean.log &

transformer:
   TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES="7" \
   nohup poetry run samsung_fit_model --max_epochs 1000 --dataset mimic3_mortality --balance --log_dir transformer \
    --early_stopping 30 TransformerModel > transformer.log &

gru_d:
   TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES="0" \
   nohup poetry run samsung_fit_model --max_epochs 1000 --dataset mimic3_mortality --balance --log_dir gru_d \
    --early_stopping 30 GRUDModel > gru_d.log &
