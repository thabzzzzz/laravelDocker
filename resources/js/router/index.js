import { createRouter, createWebHistory } from "vue-router";

import HomePage from "../components/HomePage.vue";
import AboutPage from "../components/AboutPage.vue";
import NotFoundPage from "../components/NotFoundPage.vue";

const routes=[
    {
        path:'/',
        component:HomePage
    },
    {
        path:'/about',
        component:AboutPage
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