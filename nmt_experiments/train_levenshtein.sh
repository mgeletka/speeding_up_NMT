#!/bin/bash

LOGS_DIRECTORY=outputs-levenshthein.log
DATA_PATH='data-bin'
CHECKPOINTS_DIRECTORY=checkpoints-levenshthein
TENSORBOARD_LOGDIR=tensorboard-levenshthein

fairseq-train $DATA_PATH \
    --save-dir $CHECKPOINTS_DIRECTORY \
    --ddp-backend=legacy_ddp \
    --task translation_lev \
    --criterion nat_loss \
    --arch levenshtein_transformer \
    --noise random_delete \
    --share-all-embeddings \
    --optimizer adam --adam-betas '(0.9,0.98)' \
    --lr 0.0005 --lr-scheduler inverse_sqrt \
    --stop-min-lr '1e-09' --warmup-updates 10000 \
    --warmup-init-lr '1e-07' --label-smoothing 0.1 \
    --dropout 0.3 --weight-decay 0.01 \
    --log-format 'simple' --log-interval 100 \
    --fixed-validation-seed 7 \
    --max-tokens 8000 \
    --save-interval-updates 5000 \
    --max-update 300000 \
    --wandb-project nmt-en-cs \
    --valid-subset=valid,valid1 \
    --eval-bleu \
    --no-epoch-checkpoints
    --update-freq=4 \
    --save-dir $CHECKPOINTS_DIRECTORY &>>$LOGS_DIRECTORY &


