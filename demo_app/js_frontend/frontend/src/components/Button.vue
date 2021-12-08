<template>
  <div class="button_div">
    <el-button type="primary" round @click="add">
      <div>
        <span class="add-label">{{label}}</span>
      </div>
    </el-button>
  </div>
</template>

<script>
export default {
  name: "Button",
  props:{
    label: {
      type: String,
      default: "Přidat"
    }
  },
  methods:{
    add(){
      this.$emit('clicked');
    }
  }
}
</script>

<style scoped>
/*.button-container{*/
/*  display: flex;*/
/*  justify-content: flex-start;*/
/*  !*height: 100%;*!*/
/*}*/
.add-label{
  margin-top: auto;
  margin-bottom: auto;
}

.button_div{
  margin: auto;
}

</style>
