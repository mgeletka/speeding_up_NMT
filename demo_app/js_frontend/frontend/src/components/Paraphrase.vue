<template>
  <div class="page_container">
    <div class="container-item">
      <h2>Parahprase</h2>
      <p> Please choose language and paraphrase your text</p>
    </div>

    <div class="container-item">
      <span>Choose language of your text:</span>
      <br>
      <el-select v-model="selected_language" placeholder="Select">
        <el-option
            v-for="item in language_options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
        </el-option>
      </el-select>
    </div>
    <div class="container-item">
      <span>Take n-best hypothesis (for each model):</span>
      <br>
      <el-input-number v-model="take_n_best" :min="1" :max="4"></el-input-number>
    </div>

    <div class="container-item">
      <span>Input text:</span>
      <el-input type="textarea" rows="2"
                placeholder="Please input"
                v-model="text_to_paraphrase"
                maxlength="256"
                show-word-limit
      >
      </el-input>

    </div>

    <Button class="container-item" label="Paraphrase" @clicked="paraphrase_text"></Button>


    <div class="container-item">
      <h3>Paraphrases:</h3>
      <Spinner v-if="nmt_model_paraphrasing"></Spinner>
      <div v-else class="page_container">
        <span class="container-item" v-for="paraphrase in paraphrases">{{paraphrase}}</span>
      </div>
<!--      <el-input v-show="!nmt_model_translating" type="textarea" rows="2"-->
<!--                v-model="translated_text"-->
<!--                maxlength="256"-->
<!--                show-word-limit-->
<!--      ></el-input>-->
    </div>


<!--    <div class="translated_text">-->
<!--      <h2>Translated text</h2>-->
<!--      <Spinner v-if="nmt_model_translating"></Spinner>-->
<!--      <span v-else>{{translated_text}}</span>-->
<!--    </div>-->

  </div>
</template>

<script>
import Button from "@/components/Button";
import Spinner from "vue-simple-spinner";
import api from "@/service/api";

export default {
  name: "Paraphrase",
  components: {Button, Spinner},
  data() {
    return {
      text_to_paraphrase: '',
      selected_language: 'cs',
      nmt_model_paraphrasing: false,
      take_n_best: 2,
      paraphrases: [],
      language_options: [{
        value: 'cs',
        label: 'Czech'
      }, {
        value: 'en',
        label: 'English'
      }],

    }
  },
  methods: {
    async paraphrase_text() {
      this.nmt_model_paraphrasing = true
      this.paraphrases = []
      const response = await api.paraphrase({
        'language_of_text': this.selected_language,
        'text_to_paraphrase': this.text_to_paraphrase,
        'take_n_best': this.take_n_best
      })
      console.log(response)
      this.paraphrases = response['paraphrases']
      this.nmt_model_paraphrasing = false
    }
  }
}
</script>

<style scoped>
.page_container{
  display: flex;
  justify-content: space-around;
  /*align-items: flex-start;*/
  flex-direction: column;
  height: 80%;
}

.container-item {
  margin-left: 20px;
  height: 100%;
  width: 50%;
}

</style>
