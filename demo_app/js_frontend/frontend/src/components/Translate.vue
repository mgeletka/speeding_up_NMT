<template>
  <div class="page_container">
    <div class="container-item headline">
      <h2>Translate</h2>
      <p> Please choose model, inference hyper-parameters and translate your text</p>
    </div>

    <div class="container-item">
      <span>Beam value (for auto-regressive models):</span>
      <br>
      <el-input-number v-model="beam_search_value" :min="1" :max="5"></el-input-number>
    </div>

    <div class="container-item">
      <span>Max iteration value (for NAT models):</span>
      <br>
      <el-input-number v-model="max_iteration_value" :min="1" :max="20"></el-input-number>
    </div>


    <div class="container-item">
      <span>Tranformer model to use:</span>
      <br>
      <el-select class="model_select" filterable v-model="selected_model">
        <el-option-group
            v-for="group in model_options"
            :key="group.label"
            :label="group.label">
          <el-option
              v-for="item in group.options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
          </el-option>
        </el-option-group>
      </el-select>
    </div>
    <div class="container-item">
      <span>Input text:</span>
      <el-input type="textarea" rows="2"
                placeholder="Please input"
                v-model="text_to_translate"
                maxlength="256"
                show-word-limit
      >
      </el-input>

    </div>

    <Button class="container-item" label="Translate" @clicked="translate_text"></Button>


    <div class="container-item">
      <h2>Translated text</h2>
      <Spinner v-show="nmt_model_translating"></Spinner>
      <el-input v-show="!nmt_model_translating" type="textarea" rows="2"
                v-model="translated_text"
                maxlength="256"
                show-word-limit
      ></el-input>
    </div>

<!--    <div  class="container-item">-->
<!--          <br>-->
<!--          <span>Please rate the translation</span>-->
<!--          <el-rate  v-model="translation_rating"></el-rate>-->
<!--    </div>-->

  </div>
</template>

<script>
import Button from "./Button";
import api from "../service/api"
import Spinner from 'vue-simple-spinner'


export default {
  name: "Translate",
  components: {Button, Spinner},
  data() {
    return {
      translation_rating: 0,
      text_to_translate: '',
      beam_search_value: 4,
      max_iteration_value: 10,
      translated_text: '',
      model_options: [{
        label: 'Auto-regressive models',
        options: [
          {
            value: 'auto_regressive_tiny',
            label: 'Auto-regressive tiny'
          },{
            value: 'auto_regressive_small',
            label: 'Auto-regressive small'
          },{
          value: 'auto_regressive_base',
          label: 'Auto-regressive base'
        }, {
            value: 'auto_regressive_deep',
            label: 'Auto-regressive deep'
          },
          {
            value: 'auto_regressive_wide',
            label: 'Auto-regressive wide'
          }]
      }, {
        label: 'Levenshtein models',
        options: [{
          value: 'levenshtein_tiny',
          label: 'Levenshtein tiny'
        },{
          value: 'levenshtein_small',
          label: 'Levenshtein small'
        },
          {
          value: 'levenshtein_base',
          label: 'Levenshtein base'
        },
          {
            value: 'levenshtein_wide',
            label: 'Levenshtein wide'
          }
        ]
      },
        {
          label: 'Levenshtein distill models',
          options: [
            {
              value: 'levenshtein_distill_tiny',
              label: 'Levenshtein distill tiny'
            },
            {
              value: 'levenshtein_distill_small',
              label: 'Levenshtein distill small'
            },{
            value: 'levenshtein_distill_base',
            label: 'Levenshtein distill base'
          }
          ]
        },
        {
          label: 'Large Encoder, Shallow Decoder models',
          options: [
            {
              value: 'large_encoder_shallow_decoder_tiny',
              label: 'Large Decoder, Shallow Decoder tiny'
            },
            {
              value: 'large_encoder_shallow_decoder_base',
              label: 'Large Decoder, Shallow Decoder base'
            },
          ]
        }
      ],
      selected_model: 'auto_regressive_base',
      nmt_model_translating: false
    }
  },
  methods: {
    async translate_text() {
      console.log(this.max_iteration_value)
      console.log(this.beam_search_value)
      this.nmt_model_translating = true
      this.translated_text = ''
      this.translated_text = await api.translate({
        'text_to_translate': this.text_to_translate,
        'model': this.selected_model,
        'beam_value': this.beam_search_value,
        'max_iteration_value': this.max_iteration_value
      })
      this.nmt_model_translating = false
      this.translation_rating = 0
    }
  }
}
</script>

<style scoped>

/*.model_select {*/
/*  margin-top: 10px;*/
/*}*/

.translated_text {
  /*margin-top: 30px;*/
}

.container-item {
  /*display: flex;*/
  /*flex-direction: column;*/
  /*justify-content: flex-start;*/
  /*margin-top: 30px;*/
  /*margin-bottom: 30px;*/
  margin-left: 20px;
  height: 100%;
  width: 50%;


}

/*.headline{*/
/*  margin-bottom: 50px;*/
/*}*/

.page_container{
  display: flex;
  justify-content: space-around;
  /*align-items: flex-start;*/
  flex-direction: column;
  height: 95%;
}

</style>
