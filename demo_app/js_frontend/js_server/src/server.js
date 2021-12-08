const express  = require("express");
const history = require('connect-history-api-fallback');
const app = express();

const flash = require('express-flash');
const bodyParser = require('body-parser');
const nmt_service = require('./nmt_service')
const port = process.env.PORT || 3333;
const router = express.Router();

app.use(bodyParser.json({ limit: '1mb' }));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(flash())
app.set('port', port);



router.get('/api/translate', async (req, res) => {
    console.log(req.query)
    res.send(await nmt_service.get_translation(req.query));
});

router.get('/api/paraphrase', async (req, res) => {
    console.log(req.query)
    res.send(await nmt_service.get_paraphrases(req.query));
});

router.get('/api/spell-correction', async (req, res) => {
    console.log(req.query)
    res.send(await nmt_service.correct_spelling(req.query));
});

app.use(router)

app.listen(port, () => {
    console.log(`App is listening on port ${port}`);
});

app.use(history());


if (process.env.NODE_ENV === 'production') {
    console.log('Using production config');

    app.get('/', function (req, res) {
        res.sendFile('../frontend/dist/index.html');
    });

    app.use(express.static('../frontend/dist/'));
}

