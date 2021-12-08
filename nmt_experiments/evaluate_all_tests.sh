TOKENIZER='tokenizer/bpe.cs-en.32000.model'


echo '------------------BASE MODEL-------------------------'
USER_DIR='deep-model'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-base32/checkpoint_best.pt
echo 'BEST_CHECKPONIT'
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'

echo 'CHECKPOINT AVERAGING'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-base32/checkpoint_average_5_updates_before_last.pt
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'




echo '------------------SMAL MODEL-------------------------'
USER_DIR='small-model'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-small/checkpoint_best.pt
echo 'BEST_CHECKPONIT'
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'

echo 'CHECKPOINT AVERAGING'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-small/checkpoint_average5.pt
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'







echo '------------------DEEP MODEL-------------------------'
USER_DIR='deep-model'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-deep/checkpoint_best.pt
echo 'BEST_CHECKPONIT'
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'

echo 'CHECKPOINT AVERAGING'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-deep/checkpoint_average5.pt
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'







echo '------------------WIDE MODEL-------------------------'
USER_DIR='wide-model'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-wide/checkpoint_23_300000.pt
echo 'BEST_CHECKPONIT'
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'

echo 'CHECKPOINT AVERAGING'
CHECKPOINT=/home/geletka/experiments/experiments-nmt-en2cs/nmt-experiments/checkpoints-wide/checkpoint_average_8_before_last.pt
echo 'CZENG'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test
echo '-------------------------------'
echo 'newstest2019'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test1
echo '--------------------------------'
echo 'tedtalks'
bash evaluate_test.sh --model-path=$CHECKPOINT --user-dir=$USER_DIR --tokenizer-model=$TOKENIZER --test-set=test2
echo '--------------------------------'

