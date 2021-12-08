TOKENIZER='tokenizer/bpe.cs-en.32000.model'
MAX_ITER=10


USER_DIR='levenshthein-small-model'
DATA_BIN='data-bin'

echo '****************TINY*********************'
echo '===============BEST===================='
CHECKPOINT='checkpoints-small-levenshtein/checkpoint_best.pt'
bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-small-levenshtein/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER



echo '****************TINY-NO-DISCRIMINATOR*********************'
echo '===============BEST===================='
CHECKPOINT='checkpoints-small-no-discriminator-levenshtein/checkpoint_best.pt'
bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-small-no-discriminator-levenshtein/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER



echo '********************TINY-DISTILL****************'
DATA_BIN='data-distill-bin'

echo '===============BEST===================='
CHECKPOINT='checkpoints-distill-small-levenshtein/checkpoint_best.pt'
bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-distill-small-levenshtein/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER




echo '****************REALL_SMALL*********************'
echo '===============BEST===================='
CHECKPOINT='checkpoints-levenshthein-really-small/checkpoint_best.pt'

bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-levenshthein-really-small/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER



echo '********************REALLY SMALL -DISTILL****************'
DATA_BIN='data-distill-bin'

echo '===============BEST===================='
CHECKPOINT='checkpoints-levenshthein-really-small-distill/checkpoint_best.pt'
bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-levenshthein-really-small-distill/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER




echo '********************BASE****************'
DATA_BIN='data-bin'

echo '===============BEST===================='
CHECKPOINT='checkpoints-base-levenshtein/checkpoint_best.pt'
bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-base-levenshtein/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER



echo '********************BASE DISTILL****************'
DATA_BIN='data-distill-bin'

echo '===============BEST===================='
CHECKPOINT='checkpoints-distill-base-levenshtein/checkpoint_best.pt'
bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-distill-base-levenshtein/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER



echo '********************WIDE****************'
DATA_BIN='data-bin'
USER_DIR='levenshthein-wide-model'
          
echo '===============BEST===================='
CHECKPOINT='checkpoints-wide-levenshtein/checkpoint_best.pt'
bash generete_lev.sh  --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER


echo '==============CH. AVERAGING==============='
CHECKPOINT='checkpoints-wide-levenshtein/checkpoint_average5.pt'
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test1 --max-iter=$MAX_ITER
bash generete_lev.sh --data-bin=$DATA_BIN --user-dir=$USER_DIR --model-path=$CHECKPOINT --tokenizer-model=$TOKENIZER --test-set=test2 --max-iter=$MAX_ITER

