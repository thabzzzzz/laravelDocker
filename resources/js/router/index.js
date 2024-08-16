import { createRouter, createWebHistory } from "vue-router";

import HomePage from '../../views/home.vue';
import quizPage from '../../views/quizePage.vue'
import NotFoundPage from "../components/NotFoundPage.vue";

const routes=[
    {
        path:'/',
        component:HomePage
    } ,
        {
        path:"/quizes/:id",
   
        name:'quizes',
    
        component:quizPage
        },
        {
        path: '/:pathMatch(.*)*',
        component:NotFoundPage
    },

]

const router = createRouter({
    history:createWebHistory(),
    linkExactActiveClass:'active',
    routes,
})

export default router