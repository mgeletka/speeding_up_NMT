const config = {};

config.nmt_service = {
    host: process.env.NMT_HOST || '127.0.0.1',
    port: process.env.NMT_PORT || 5000,
};

module.exports = config;
