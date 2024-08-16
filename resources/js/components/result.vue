<script setup>
import { RouterLink } from 'vue-router';
const props = defineProps(['numOfCorrectQuestions','quizQuestionLength']);



</script>

<template>
    <div class="result">
        <p>Your result...</p>
        
       <h1>{{ numOfCorrectQuestions }} / {{ quizQuestionLength }} </h1> 
       <router-link to="/">Home</router-link>
    </div>
</template>

<style scoped>
.result{
    text-align: center;
    padding: 100px 0;
}

p{
    font-size: 25px;
}
</style>