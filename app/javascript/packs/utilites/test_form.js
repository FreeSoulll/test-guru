document.addEventListener('turbolinks:load', function() {
  const checkboxField = document.querySelector('.js-show-timer');
  const dynamicField = document.querySelector('.js-timer-block');

  if (checkboxField) {
    if (checkboxField.checked) {
      dynamicField.style.display = 'block';
    }
    checkboxField.addEventListener('change', function() {
      if (this.checked) {
        dynamicField.style.display = 'block';
      } else {
        dynamicField.style.display = 'none';
      }
    });
  }
})
