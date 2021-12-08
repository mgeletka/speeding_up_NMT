import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Element from 'element-ui'
import Unicon from 'vue-unicons'
import './plugins/lodash'

import { uniBagAlt, uniRobot, uniUsersAlt, uniUser, uniTrashAlt, uniEditAlt, uniPlus, uniSave, uniSignInAlt, uniSignOutAlt, uniBuilding, uniSetting, uniFilter} from 'vue-unicons/src/icons'

Unicon.add([uniBagAlt, uniRobot, uniUsersAlt, uniUser, uniTrashAlt, uniEditAlt, uniPlus, uniSave, uniSignInAlt, uniSignOutAlt, uniBuilding, uniSetting, uniFilter])

Vue.use(Unicon)
Vue.use(Element)

Vue.config.productionTip = false

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')
