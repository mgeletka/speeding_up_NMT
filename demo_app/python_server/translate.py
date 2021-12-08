import sentencepiece as spm
from fairseq.models.transformer import TransformerModel
from fairseq.models.nat.levenshtein_transformer import LevenshteinTransformerModel


def load_transformer_model(cfg):
#    print(f'LOADING TRANSFORMER MODEL WITH CFG {cfg}')
 #   if 'user_dir' in cfg and cfg['user_dir']:
     model = TransformerModel.from_pretrained(
            cfg['checkpoint_directory'],
            checkpoint_file=cfg['checkpoint_filename'],
            data_name_or_path=cfg['data_bin'],
            sentencepiece_model=cfg['sentencepiece_model'],
            user_dir='user_dir'
        )
     return model
  #  else:
   #     model = TransformerModel.from_pretrained(
    #        cfg['checkpoint_directory'],
     #       checkpoint_file=cfg['checkpoint_filename'],
      #      data_name_or_path=cfg['data_bin'],
       #     sentencepiece_model=cfg['sentencepiece_model'],
       # )

  #  return model


def load_levenshtein_model(cfg):
    print(f'LOADING LEVENSHTEIN MODEL WITH CFG {cfg}')
    if 'user_dir' in cfg and cfg['user_dir']:
        model = LevenshteinTransformerModel.from_pretrained(
            cfg['checkpoint_directory'],
            checkpoint_file=cfg['checkpoint_filename'],
            data_name_or_path=cfg['data_bin'],
            sentencepiece_model=cfg['sentencepiece_model'],
            user_dir=cfg['user_dir']
        )
    else:
        model = LevenshteinTransformerModel.from_pretrained(
            cfg['checkpoint_directory'],
            checkpoint_file=cfg['checkpoint_filename'],
            data_name_or_path=cfg['data_bin'],
            sentencepiece_model=cfg['sentencepiece_model'],
        )

    return model


def load_nmt_model(cfg):
    if cfg['type'] == 'levenshtein':
        return load_levenshtein_model(cfg)
    return load_transformer_model(cfg)


def translate_sentence_with_model(sentence, loaded_model, sentencepiece_model, beam=4, iter_decode_max_iter=10):
    print(f'TRANSLATING SENTENCE {sentence}'
          f' beam {beam} '
          f' iter_decode_max_iter {iter_decode_max_iter}')

    sp = spm.SentencePieceProcessor(model_file=sentencepiece_model)
    encoded_tokens = sp.encode(sentence, out_type=str)
    print(f'ENCODED TOKENS: {encoded_tokens}')
    encoded_string = ' '.join(encoded_tokens)
    print(f'ENCODED STRING: {encoded_string}')
    translated_string = loaded_model.translate(encoded_string, beam=beam, iter_decode_max_iter=iter_decode_max_iter)
    print(f'TRANSLATED STRING {translated_string}')
    return sp.decode(translated_string.split())

