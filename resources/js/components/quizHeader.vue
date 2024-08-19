<script setup>

const props = defineProps(['questionStatus','barPercentage']);

</script>

<template>
   <header>
            <h4>Question {{questionStatus}}</h4>
            
            <div class="bar">
                <div class="completion" :style="{width:barPercentage}"></div>
                
               
            </div>
        </header>
</template>

<style scoped>

header {
    margin-top: 20px;
}

header h4 {
    font-size: 30px;
}

.bar {
    display: flex; /* Flex container */
    align-items: center; /* Center items vertically */
    width: 300px; /* Fixed width for the bar */
    height: 50px;
    border: 3px solid rgb(250, 192, 121);
    position: relative; 
}

.completion {
    height: 100%;
    background-color: rgb(250, 192, 121);
    width: auto; /* Width will be set dynamically by the barPercentage */
    flex-shrink: 0; /* Prevent shrinking */
}


</style>