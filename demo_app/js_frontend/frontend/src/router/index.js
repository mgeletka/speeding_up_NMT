import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from "@/components/Home";
import Translate from "../components/Translate";
import Paraphrase from "../components/Paraphrase";
import SpellCorrection from "../components/SpellCorrection";

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'home',
        component: Home,
    },
    {
        path: '/translate',
        name: 'translate',
        component: Translate,
    },
    {
        path: '/spell-correction',
        name: 'spell-correction',
        component: SpellCorrection,
    },
    {
        path: '/paraphrase',
        name: 'paraphrase',
        component: Paraphrase,
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router
