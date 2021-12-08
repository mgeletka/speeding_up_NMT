# flask_web/app.py
import yaml

from flask import Flask
from flask import request
from translate import translate_sentence_with_model, load_nmt_model
from paraphrase import paraphrase_sentence_with_given_models


def load_config():
    print('LOADING CONGIG')
    with open('config.yaml') as yaml_file:
        return yaml.safe_load(yaml_file)


def load_all_models(cfg):
    loaded_models = {'translation': {}, 'spell_correction': {}}

    for td in cfg['models']['translation'].keys():
        loaded_models['translation'][td] = {}
        for model_name, model_definition in cfg['models']['translation'][td].items():
            loaded_models['translation'][td][model_name] = load_nmt_model(model_definition)

    for lang in cfg['models']['spell_correction'].keys():
        loaded_models['spell_correction'][lang] = {}
        for model_name, model_definition in cfg['models']['spell_correction'][lang].items():
            loaded_models['spell_correction'][lang][model_name] = load_nmt_model(model_definition)

    # for task, model_list in cfg['models'].items():
    #     loaded_models['task'] = {}
    #     for model_name, model_definition in model_list.items()
    # for model_name, model_definition in cfg['models'].items():
    #     loaded_models[model_name] = load_nmt_model(model_definition)

    return loaded_models


app = Flask(__name__)


# global config
# config = None
# loaded_transformer_models = None


@app.route('/translate')
def translate():
    source_sentence = request.args.get('text_to_translate')
    translation_direction = request.args.get('translation_direction', default='en2cs')
    model_name = request.args.get('model')
    beam_value = request.args.get('beam_value', default=4, type=int)
    max_iteration_value = request.args.get('max_iteration_value', default=10, type=int)

    available_models = loaded_nmt_models['translation'][translation_direction]
    model = available_models[model_name] if model_name in available_models else None
    if not model:
        return 'NOT SUPPORTED MODEL'

    sentencepiece_model = config['models']['translation'][translation_direction][model_name]['sentencepiece_model']
    return translate_sentence_with_model(sentence=source_sentence,
                                         beam=beam_value,
                                         sentencepiece_model=sentencepiece_model,
                                         iter_decode_max_iter=max_iteration_value,
                                         loaded_model=model)


@app.route('/paraphrase')
def paraphrase():
    source_lang = request.args.get('language_of_text', 'cs')
    text_to_paraphrase = request.args.get('text_to_paraphrase')
    take_n_best = request.args.get('take_n_best', default=2, type=int)

    target_lang = 'en' if source_lang == 'cs' else 'cs'
    model_source2target = loaded_nmt_models['translation'][f'{source_lang}2{target_lang}']['auto_regressive_base']
    model_target2source = loaded_nmt_models['translation'][f'{target_lang}2{source_lang}']['auto_regressive_base']

    sentencepiece_source = config['models']['translation'][f'{source_lang}2{target_lang}']['auto_regressive_base'][
        'sentencepiece_model']
    sentencepiece_target = config['models']['translation'][f'{target_lang}2{source_lang}']['auto_regressive_base'][
        'sentencepiece_model']

    return paraphrase_sentence_with_given_models(text_to_paraphrase=text_to_paraphrase,
                      source_model=model_source2target, target_model=model_target2source,
                      source_sentencepiece_model=sentencepiece_source, target_sentencepiece_model=sentencepiece_target,
                      take_n_best=take_n_best)


@app.route('/spell-correction')
def spell_correction():
    text_to_correct = request.args.get('text_to_correct').lower()

    language_of_text = request.args.get('language_of_text', default='cs')
    model_name = request.args.get('model', default='auto_regressive_base')
    beam_value = request.args.get('beam_value', default=4, type=int)
    max_iteration_value = request.args.get('max_iteration_value', default=20, type=int)

    if language_of_text not in loaded_nmt_models['spell_correction']:
        return 'NOT SUPPORTED LANGUAGE'

    model = loaded_nmt_models['spell_correction'][language_of_text][model_name]
    sentencepiece_model = config['models']['spell_correction'][language_of_text][model_name]['sentencepiece_model']

    return translate_sentence_with_model(sentence=text_to_correct,
                                         beam=beam_value,
                                         sentencepiece_model=sentencepiece_model,
                                         iter_decode_max_iter=max_iteration_value,
                                         loaded_model=model)


if __name__ == '__main__':
    config = load_config()
    print(config)
    loaded_nmt_models = load_all_models(config)
    app.run(port=5001)

