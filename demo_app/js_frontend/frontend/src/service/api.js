import {http} from "./http";


export default {

    async translate(params) {
        console.log('IN API SERVICE (translate)')
        return (await http.get('/translate', {
            params: params,
        })).data;
    },

    async paraphrase(params) {
        return (await http.get('/paraphrase', {
            params: params,
        })).data;
    },

    async correct_spelling(params) {
        return (await http.get('/spell-correction', {
            params: params,
        })).data;
    },
};
