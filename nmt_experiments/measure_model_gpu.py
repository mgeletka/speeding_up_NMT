from fairseq.models.transformer import TransformerModel
import sentencepiece as spm
import time
import statistics
import argparse

MAX_SENTECES=1000

def measure_single_translate(model, filename, sentencepiece_model='tokenizer/bpe.cs-en.32000.model', beam=4):
    sp = spm.SentencePieceProcessor(model_file=sentencepiece_model)

    with open(filename) as file:
        lines = file.readlines()
        runtimes = []
        runtimes_per_token = []
        tokens_per_sentence = []
        counter=0
        for line in lines:
            encoded_tokens = sp.encode(line, out_type=str)
            if encoded_tokens:
                encoded_string = ' '.join(encoded_tokens)
                start = time.time()
                translated_string = model.translate(encoded_string, beam=beam)
                end = time.time()
                total_time = end - start
                runtimes.append(total_time)
                runtimes_per_token.append(total_time / len(encoded_tokens))
                tokens_per_sentence.append((len(encoded_tokens)))
                #print(f'{line} => {sp.decode(translated_string.split())}')
                counter +=1
            if counter >= MAX_SENTECES:
                break

    print('NUMBER OF TOKENS PER SENTENCE')
    print(f'MEAN: {statistics.mean(tokens_per_sentence)}')
    print(f'STDEV: {statistics.stdev(tokens_per_sentence)}')
    print(f'MAX: {max(tokens_per_sentence)}')
    print(f'MIN: {min(tokens_per_sentence)}')
    print('=====================================================')

    print('TOTAL RUNTIME PER SENTENCE')
    print(f'MEAN: {statistics.mean(runtimes)}')
    print(f'STDEV: {statistics.stdev(runtimes)}')
    print(f'MAX: {max(runtimes)}')
    print(f'MIN: {min(runtimes)}')
    print('=====================================================')

    print('TOTAL RUNTIME PER TOKENS')
    print(f'MEAN: {statistics.mean(runtimes_per_token)}')
    print(f'STDEV: {statistics.stdev(runtimes_per_token)}')
    print(f'MAX: {max(runtimes_per_token)}')
    print(f'MIN: {min(runtimes_per_token)}')



def load_model(checkpoint_dir,
               user_dir=None,
               checkpoint_file='checkpoint_last.pt',
               data_name_or_path='data-mono-bin',
               sentencepiece_model='tokenizer/bpe.cs-en.32000.model'):
    model = TransformerModel.from_pretrained(
        checkpoint_dir,
        user_dir=user_dir,
        checkpoint_file=checkpoint_file,
        data_name_or_path=data_name_or_path,
        sentencepiece_model=sentencepiece_model
    )

    pytorch_total_params = sum(p.numel() for p in model.parameters())
    print(f'Total number of parameters is {pytorch_total_params}')

    pytorch_trainable_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    print(f'Number of  trainable parameters is {pytorch_trainable_params}')

    return model


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Preprocess raw data to obtain format supported in fairseq (2 files with paralel data)')

    parser.add_argument('--file2translate',
                        help='File to translate (measure translate time)',
                        required=True)
    parser.add_argument('--checkpoint-dir',
                        help='Path to checkpoint directory',
                        required=True)
    parser.add_argument('--user-dir',
                        help='user directory with defined model')

    parser.add_argument('--beam',
                        help='user directory with defined model')

    args = parser.parse_args()
    model = load_model(checkpoint_dir=args.checkpoint_dir, user_dir=args.user_dir).cuda()
    #print(f'BEAM VALUE {int(args.beam)}')
    for b in range(1,6):
        print(f'BEAM VALUE {b}')
        measure_single_translate(filename=args.file2translate, model=model, beam=b)


