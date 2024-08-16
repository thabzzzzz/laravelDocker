<script setup>
import { useRouter } from 'vue-router';

const {quiz}= defineProps(['quiz']);
const router=useRouter();

const navigateToQuiz = ()=>{
  router.push(`/quizes/${quiz.id}`)
}

</script>


<template>
    <div class="card" @click="navigateToQuiz()" >
      <div class="image-container">
        <img :src="quiz.img" alt="">
      </div>
        <div class="card-text">
            <h2>{{quiz.name}}</h2>
            <p>{{quiz.questions.length}} Questions</p>
        </div>
    </div >
</template>

<style scoped>
 .card {
    width: 310px;
    overflow: hidden;
    border-radius: 2%;
    box-shadow: 1px 1px 10px rgba(0,0,0,0.1);
    margin-bottom: 35px;
    margin-right: 20px;
    cursor: pointer;
  }

  .card img {
    width: 100%;
    height: 190px;
    margin: 0
  }

  .card .card-text {
    padding: 0 5px
  }

  .card .card-text h2 {
    font-weight: bold;
  }

  .image-container {
    overflow: hidden; /* Ensures the image doesn't overflow the container */
}

.image-container img {
    transition: transform 0.3s ease-in-out;
    transform-origin: center center; /* Sets the origin of the scale effect */
}

.image-container img:hover {
    transform: scale(1.2); /* Scales the image up */
}

</style>