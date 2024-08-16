<script setup>
import question from '../js/components/question.vue';
import quizHeader from '../js/components/quizHeader.vue';
import { useRoute } from 'vue-router';
import { ref, watch, computed } from 'vue';
import quizes from '../data/quizes.json';
import result from '../js/components/result.vue';





//get the quiz ID
const route = useRoute();
const quizID = parseInt(route.params.id);

//assign current quiz to the quiz in the fetched list ie, the one from the json
const quiz = quizes.find(q => q.id === quizID);

const currentQuestionIndex = ref(0);



const showResult= ref(false)


/* const questionStatus =ref(`${currentQuestionIndex.value}/${quiz.questions.length}`)

watch(()=>currentQuestionIndex.value, ()=>{
    questionStatus.value = `${currentQuestionIndex.value}/${quiz.questions.length}`;
}) */

const questionStatus = computed(() => {
    return `${currentQuestionIndex.value}/${quiz.questions.length}`
})

const barPercentage = computed(() => {
    return `${Math.floor((currentQuestionIndex.value / quiz.questions.length) * 100)}%`;
})


const numOfCorrectQuestions = ref(0);
const onOptionSelected = (isCorrect) => {
    if(isCorrect==true){
        numOfCorrectQuestions.value++;
       
    } 
   
    if (quiz.questions.length - 1 === currentQuestionIndex.value){
    showResult.value=true;
   }
   currentQuestionIndex.value++
}
</script>

<template>
    <div>

        <quizHeader :questionStatus="questionStatus" :barPercentage="barPercentage" />
        <question v-if="!showResult" :question="quiz.questions[currentQuestionIndex]" @SelectedOption="onOptionSelected" />
        <result v-else :numOfCorrectQuestions="numOfCorrectQuestions" :quizQuestionLength="quiz.questions.length"/>

    </div>
    <div >
    </div>
</template>

<style scoped></style>