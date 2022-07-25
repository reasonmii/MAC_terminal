### pycharm

### makefile
- `TF_FORCE_GPU_ALLOW_GROWTH` : 이거 설정 안 하면 tensorflow가 GPU를 다 가져가기 때문에 이를 막고 필요한 정도만 가져가도록 설정
- `CUDA_VISIBLE_DEVICES="4"` : 몇 번째 cuda 사용할 지
- `> gru.log &`
  - `> gru.log` : 모든 log를 gru.log에 기록
  - `&` : 내가 exit을 해도 서버는 계속 켜져서 background에서 돌아가도록 설정

```
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
```

