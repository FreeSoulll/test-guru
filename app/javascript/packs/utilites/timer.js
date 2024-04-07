document.addEventListener('turbolinks:load', function() {
  const timerDisplay = document.getElementById('timerDisplay');
  if (!timerDisplay) { return }

  const timerInput = document.querySelector('.js-data-input');
  const timeLeft = document.querySelector('[data-time-left]').dataset.timeLeft;
  const endTime = new Date().getTime() + (timeLeft * 60 * 1000);
  const resultLink = document.querySelector('[data-result-url]');
  
  function updateTimer() {
    var currentTime = new Date().getTime();
    var timeLeft = endTime - currentTime;

    
    if (timeLeft <= 0 && resultLink) {
      window.location.href = resultLink.dataset.resultUrl;
      return;
    }
    
    var hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);
    
    // Добавляем ведущие нули к значениям, если нужно
    hours = (hours < 10) ? '0' + hours : hours;
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    seconds = (seconds < 10) ? '0' + seconds : seconds;
    
    timerDisplay.textContent = hours + ':' + minutes + ':' + seconds;
    timerInput.value = timeLeft;
  }
  
  // Обновляем таймер каждую секунду
  const timerInterval = setInterval(updateTimer, 1000);
});
