# NMT experiments
This part of the reposotory serves as base for all experiments done in the Master thesis and for replication of obtained results/

## Data description
Data used :
* TRAINING:
    * czeng_train (data desscription [here](https://ufal.mff.cuni.cz/czeng))
* VALIDATION:
    * newstest 2018 (downloaded from [here](http://matrix.statmt.org/test_sets/newstest2018.tgz?1527073980))
    * tedtalk ( first 10k sentences) (data desciption [here](https://opus.nlpl.eu/TED2020-v1.php))
* TEST
    * newstest 2019 (downloaded from [here](https://opus.nlpl.eu/download.php?f=TED2020/v1/tmx/cs-en.tmx.gz))
    * czeng test 
    * tedtalk (without first 10k sentences)

## Data downloading
For simple of use we provided script for downloading all required data
##### Example of usage
```bash
bash download_data.sh --ufal-user=ufal_username --ufal-password=ufal_password -d=data/raw-data
```

## Data preprocessing
#### Converting to format supported by fairseq
* Firstly we had to convert data from all sources to one format supported by fairseq
* This format is one file per language only with data (no metada) with file ending with shortcut of language (cs, en)
* we implemented this functionality in python script   `preprocess_data.py`
* we wrapped preprocessing of all required files in one shell script


##### Example of usage
```bash
bash preprocess_data.sh -i=data/raw-data -o=data/preprocessed-data
```

#### Tokenization
For tokenization of data we used sentence piece library (documantation [here](https://github.com/google/sentencepiece))
In this experiment we used single dictionary for both language of size 32000 and BPE tokenization algorithm
##### Example of usage (training of tokenizer)
```bash
spm_train --input=first-file-to-train,second-file-to-train  --model_prefix=model-name --vocab_size=32000 --model_type=bpe
```

##### Example of usage (tokenize data)
```bash
spm_encode --model=model-path filename-to-encode > .file-with-tokenized-data
```

#### Binarize data by fairseq
To used our data with fairseq we have preprocess data by fairseq CLI tool fairseq-preprocess.
This tool binarize data and build frequency dictionaries to be used in the training
For detail information refer to [fairseq CLI documentation] (https://fairseq.readthedocs.io/en/latest/command_line_tools.html)


## Train data
To train we used fairseq CLI command `fairseq-train`. For detail hyperparam refer to `train.sh` file.
