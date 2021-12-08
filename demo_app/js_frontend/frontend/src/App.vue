<template>
  <div id="app">
    <router-view />
  </div>
</template>


<script>

export default {
  name: 'app',
}
</script>

<style>
@import url("//unpkg.com/element-ui@2.13.2/lib/theme-chalk/index.css");

#app {
  font-family: "Helvetica Neue",Helvetica,"PingFang SC","Hiragino Sans GB","Microsoft YaHei",Arial,sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  width: 100%;
  height: 100%;
  min-height: 100%;

  /*display: flex;*/
  /*align-content: center;*/
  /*justify-content: space-between;*/
  /*flex-direction: column;*/
}

/*body {*/
/*  width: 100%;*/
/*  height: 100%;*/
/*}*/
html, body {
  height: 100%;
  width: 100%;
  margin: 0;
}

h2{
  color: #212121;
}

p{
  color: #333333;
}

/*span p {*/
/*  color: #605f5f;*/
/*}*/

#wrapper {
}
/*h1, h2,h3, h4, h5, h6 {*/
/*  font-variant: small-caps;*/
/*}*/



</style>
