import _ from 'lodash';
import Vue from "vue";

const VueLodash = {
    install(Vue) {
        Vue.prototype.$_ = _;

        Vue.mixin({
            mounted() { }
        });

        if (typeof window !== 'undefined' && window.Vue) {
            window.Vue.use(VueLodash)
        }
    }
};

Vue.use(VueLodash)
