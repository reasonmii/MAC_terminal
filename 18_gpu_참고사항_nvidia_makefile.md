### pycharm
- 서버에서 testing/구현 전 local에서 testing 해 볼 것
- 방법
  - 우측 상단 run, debug 등 버튼 옆 뭐 설정하는 빈칸 클릭
  - 'run and edit config' 설치
  - local 장비에서 epoch랑 dataset 작게 해서 한 번 돌려보기
    - 서버에서는 이렇게 작은 testing도 오래 걸림
  - 잘 돌아가면 서버에서 gpu로 들리기

### nvidia-smi
- GPU 확인
- 가끔 GPU를 먹고 있는데 % 안 올라가는 경우 있음
  - GPU를 잡기만 하고 사실 안 쓰고 있는 것
  - version이 달라 에러가 발생하는 것 : cuda version과 tensorflow version을 맞춰야 함

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

