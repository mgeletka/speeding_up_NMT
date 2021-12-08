import sentencepiece as spm


def translate_to_n_hypothesis(model, sentences, n):
    tokenized_sentences = [model.encode(sentence) for sentence in sentences]
    batched_hypos = model.generate(tokenized_sentences, beam=4, verbose=False)
    return [[model.decode(hypos[i]["tokens"])] for hypos in batched_hypos for i in range(n)]


def paraphrase_sentence_with_given_models(text_to_paraphrase,
                                          source_model, target_model,
                                          source_sentencepiece_model, target_sentencepiece_model,
                                          take_n_best=2):
    sp_source = spm.SentencePieceProcessor(model_file=source_sentencepiece_model)
    sp_target = spm.SentencePieceProcessor(model_file=target_sentencepiece_model)

    encoded_tokens = sp_source.encode(text_to_paraphrase, out_type=str)
    encoded_string = ' '.join(encoded_tokens)
    translated_strings = translate_to_n_hypothesis(model=source_model,
                                                   sentences=[encoded_string],
                                                   n=take_n_best)

    print(translated_strings)

    translated_strings = [''.join(sp_source.decode(t[0].split())) for t in translated_strings]

    print(translated_strings)

    encoded_tokens_translation = [sp_target.encode(t, out_type=str) for t in translated_strings]
    encoded_translations = [' '.join(et) for et in encoded_tokens_translation]
    translated_strings_back = translate_to_n_hypothesis(sentences=encoded_translations,
                                                        model=target_model,
                                                        n=take_n_best)

    paraphrases = [''.join(sp_target.decode(translation.split()))
                   for translation_list in translated_strings_back
                   for translation in translation_list]

    return {
        'paraphrases': [p for p in set(paraphrases) if p != text_to_paraphrase]
    }

