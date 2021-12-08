const axios = require('axios');
const config = require('./config')
const https = require('https');


const agent = new https.Agent({
    rejectUnauthorized: false
});


module.exports = {
    async get_translation(params) {
        try {
            const uri = encodeURI(`${config.nmt_service.host}:${config.nmt_service.port}/translate`)
            console.log(uri)
            const response = await axios.get(uri, {httpsAgent: agent, params: params});
            return response && response.data
                ? response.data
                : 'ERROR';
        } catch (error) {
            console.log(`Error when trying to translate ${params.text_to_translate}, \n Error: ${error}`);
            return 'ERROR';
        }
    },

    async get_paraphrases(params) {
        try {
            const uri = encodeURI(`${config.nmt_service.host}:${config.nmt_service.port}/paraphrase`)
            const response = await axios.get(uri, {httpsAgent: agent, params: params});
            return response && response.data
                ? response.data
                : 'ERROR';
        } catch (error) {
            console.log(`Error when trying to translate ${params.text_to_translate}, \n Error: ${error}`);
            return 'ERROR';
        }
    },

    async correct_spelling(params) {
        try {
            const uri = encodeURI(`${config.nmt_service.host}:${config.nmt_service.port}//spell-correction`)
            const response = await axios.get(uri, {httpsAgent: agent, params: params});
            return response && response.data
                ? response.data
                : 'ERROR';
        } catch (error) {
            console.log(`Error when trying to translate ${params.text_to_translate}, \n Error: ${error}`);
            return 'ERROR';
        }
    },
}
