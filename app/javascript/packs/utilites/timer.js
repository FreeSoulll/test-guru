document.addEventListener('turbolinks:load', function() {
  const timerDisplay = document.getElementById('timerDisplay');
  const timerInput = document.querySelector('.js-data-input');
  const endTime = new Date().getTime() + (getCookie('timer') * 60 * 1000);
  const resultLink = document.querySelector('[data-result-url]');

  if (!timerDisplay) {
    return;
  }
  
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

  function getCookie(name) {
    let matches = document.cookie.match(new RegExp(
      "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
  }
  
  // Обновляем таймер каждую секунду
  const timerInterval = setInterval(updateTimer, 1000);
});

window.addEventListener('beforeunload', function(event) {
  const timerInput = document.querySelector('.js-data-input');

  function updateCookieValue(cookieName, newValue) {
    document.cookie = cookieName + "=" + newValue;
  }

  function updateCookieValue(key, value, expirationDays) {
      var expirationDate = new Date();
      expirationDate.setDate(expirationDate.getDate() + expirationDays); // Устанавливаем срок действия cookie

      document.cookie = encodeURIComponent(key) + "=" + encodeURIComponent(value) +
          "; expires=" + expirationDate.toUTCString() +
          "; path=/"; // Устанавливаем путь к cookie
  }

  if (timerInput) {
    updateCookieValue("timer", timerInput.value / 60 / 1000, 1)
  }
})
