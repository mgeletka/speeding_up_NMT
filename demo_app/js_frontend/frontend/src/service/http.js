import axios from 'axios';
import router from "@/router";

const http = axios.create({
    baseURL: '/api',
    headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json'
    }
});

// http.interceptors.response.use(
//     response => response,
//     async error => {
//         if (error && error.response && error.response.status && error.response.status === 401) {
//             if (router.currentRoute.name !== 'login'){
//                 router.push({name: 'login', params: {returnUrl: router.currentRoute.path}}).catch(() => {});
//             }
//
//         }
//         // return Promise.reject(error.response);
//     }
// );

export {http}
