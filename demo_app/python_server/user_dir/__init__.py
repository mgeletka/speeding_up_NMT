from fairseq.models import register_model_architecture
from fairseq.models.transformer import transformer_wmt_en_de_big, base_architecture
from fairseq.models.nat.levenshtein_transformer import levenshtein_base_architecture


@register_model_architecture("transformer", "transformer_wmt_wide_model")
def transformer_wmt_wide_architecture(args):
    args.encoder_embed_dim = getattr(args, "encoder_embed_dim", 2048)
    args.encoder_ffn_embed_dim = getattr(args, "encoder_ffn_embed_dim", 8192)
    args.decoder_embed_dim = getattr(args, "decoder_embed_dim", 2048)
    args.decoder_ffn_embed_dim = getattr(args, "decoder_ffn_embed_dim", 8192)
    transformer_wmt_en_de_big(args)

@register_model_architecture("transformer", "transformer_wmt_small_model")
def transformer_wmt_deep_architecture(args):
    args.encoder_layers = getattr(args, "encoder_layers", 3)
    args.decoder_layers = getattr(args, "decoder_layers", 3)
    transformer_wmt_en_de_big(args)


@register_model_architecture("transformer", "transformer_wmt_tiny_model")
def transformer_wmt_deep_architecture(args):
    args.encoder_layers = getattr(args, "encoder_layers", 3)
    args.decoder_layers = getattr(args, "decoder_layers", 3)
    base_architecture(args)


@register_model_architecture("transformer", "transformer_wmt_deep_model")
def transformer_wmt_deep_architecture(args):
    args.encoder_layers = getattr(args, "encoder_layers", 12)
    args.decoder_layers = getattr(args, "decoder_layers", 12)
    transformer_wmt_en_de_big(args)


@register_model_architecture("levenshtein_transformer", "levenshtein_small_transformer")
def transformer_wmt_wide_architecture(args):
    args.encoder_layers = getattr(args, "encoder_layers", 3)
    args.decoder_layers = getattr(args, "decoder_layers", 3)
    levenshtein_base_architecture(args)

@register_model_architecture("levenshtein_transformer", "levenshtein_wide_transformer")
def transformer_wmt_wide_architecture(args):
    args.encoder_embed_dim = getattr(args, "encoder_embed_dim", 2048)
    args.encoder_ffn_embed_dim = getattr(args, "encoder_ffn_embed_dim", 8192)
    args.decoder_embed_dim = getattr(args, "decoder_embed_dim", 2048)
    args.decoder_ffn_embed_dim = getattr(args, "decoder_ffn_embed_dim", 8192)
    args.encoder_attention_heads = getattr(args, "encoder_attention_heads", 16)
    args.decoder_attention_heads = getattr(args, "decoder_attention_heads", 16)
    levenshtein_base_architecture(args)

@register_model_architecture("transformer", "transformer_wmt_base_large_encoder_model")
def transformer_wmt_wide_architecture(args):
    args.encoder_layers = getattr(args, "encoder_layers", 11)
    args.decoder_layers = getattr(args, "decoder_layers", 1)

    transformer_wmt_en_de_big(args)

@register_model_architecture("transformer", "transformer_wmt_tiny_large_encoder_model")
def transformer_wmt_deep_architecture(args):
    args.encoder_layers = getattr(args, "encoder_layers", 5)
    args.decoder_layers = getattr(args, "decoder_layers", 1)
    base_architecture(args)

