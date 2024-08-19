<script setup>
import { onMounted } from 'vue';
onMounted(() => {
  const currentTheme = document.documentElement.getAttribute('data-theme');
  if (!currentTheme) {
    const preferredTheme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', preferredTheme);
  }
});

</script>
<template>
    <div>
        <header>
            <h1>Quizzy</h1>
        </header>
        <div class="container">
            <h2>Highscores</h2>
        </div>
    </div>
</template>

<style scoped>
.container {
  max-width: 1000px;
  margin: 0 auto;
}

header {
  margin-bottom: 10px;
  margin-top: 30px;
  display: flex;
  align-items: center;
}

header h1 {
  font-weight: bold;
  margin-right: 30px;
}
</style>