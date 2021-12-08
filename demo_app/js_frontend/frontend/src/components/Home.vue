<template>
    <div class="button-container">
      <div class="menu-item">
          <h2 style="margin-left: auto; margin-right: auto" >Welcome to our  NMT website</h2>
<!--          <p style="margin-left: auto; margin-right: auto">-->
<!--            Please select one of the services bellow and try different applications of NMT models</p>-->
        <p style="margin-left: auto; margin-right: auto">
          This application was developed as part of the Master Thesis
        </p>
        <p style="margin-left: auto; margin-right: auto">
          <b>Speeding up inference time of Neural Machine Translation</b>
        </p>
        <p style="margin-left: auto; margin-right: auto">

          <a href="https://is.muni.cz/auth/osoba/456576">Bc. Martin Geletka, 456576</a>

        </p>
      </div>
      <div class="menu-item button-div-menu" >
          <Button label="Translate" @clicked="goto_translate()" ></Button>
          <p style="margin: auto">Translate service offer translation from English to Czech</p>
      </div>
      <div class="menu-item button-div-menu">
        <Button class="menu-button" label="Paraphrase" @clicked="goto_paraphrase()"></Button>
        <p style="margin: auto">Paraphrase your sentence from Czech or English</p>

      </div>
      <div class="menu-item button-div-menu">
        <Button class="menu-button" label="NMT spell correction" @clicked="goto_spell_correction()"></Button>
        <p style="margin: auto"> Quickly correct your spelling in Czech with our model</p>

      </div>
    </div>




</template>

<script>
import Button from "./Button";
import router from "@/router";


export default {
  name: "Home",
  components: {Button},
  computed: {
    async goto_translate(){
      await router.push({name: 'translate', params: {} });
      console.log("CLICKED")
    },

    async goto_paraphrase(){
      await router.push({name: 'paraphrase', params: {} });
      console.log("CLICKED")
    },

    async goto_spell_correction(){
      await router.push({name: 'spell-correction', params: {} });
      console.log("CLICKED")
    }

  }
}
</script>

<style scoped>
.button-container{
  display: flex;
  /*align-content: center;*/
  /*justify-content: center;*/
  flex-direction: column;
  width: 100%;
  height: 100%;
  margin-top: auto;
  margin-bottom: auto;
}

.menu-item {
  display: flex;
  align-content: center;
  justify-content: center;
  flex-direction: column;
  height: 99%;
  width: 50%;
  margin: auto;
  border:solid #ffffff;
}

.button-div-menu{

}

.button-div-menu:hover{
  background-color: #efefef;
  border:solid #838181;
  border-radius: 25px;
}

</style>
