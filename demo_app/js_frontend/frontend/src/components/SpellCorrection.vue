<template>
  <div class="page_container">
    <div class="container-item">
      <h2>Spell-correction</h2>
      <p> Try our spell-correction model (currently only in czech)</p>
    </div>

    <div class="container-item">
      <span>Input text:</span>
      <el-input type="textarea" rows="2"
                placeholder="Please input"
                v-model="text_to_correct"
                maxlength="256"
                show-word-limit
      >
      </el-input>

    </div>

    <Button class="container-item" label="Correct text" @clicked="correct_text"></Button>


    <div class="container-item">
      <h3>Corrected text:</h3>
      <Spinner v-if="nmt_model_correcting"></Spinner>
      <el-input v-else type="textarea" rows="2"
                v-model="corrected_text"
                maxlength="256"
                show-word-limit
      ></el-input>
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
      text_to_correct: '',
      nmt_model_correcting: false,
      corrected_text: ''
    }
  },
  methods: {
    async correct_text() {
      this.nmt_model_correcting = true
      this.corrected_text = ''
      this.corrected_text = await api.correct_spelling({
        'text_to_correct': this.text_to_correct
      })
      this.nmt_model_correcting = false
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
  height: 50%;
}

.container-item {
  margin-left: 20px;
  height: 100%;
  width: 50%;
}

</style>
