document.addEventListener('turbolinks:load', function() {
  const password_field = document.querySelector('.password-field')
  const confirmm_password_field = document.querySelector('.confirm-password-field')

  if (password_field && confirmm_password_field) { checkPasswords(password_field, confirmm_password_field) }
})

function checkPasswords(password, confirm_password) {
  const iconSuccess = document.querySelector('.octicon.text-success')
  const iconDanger = document.querySelector('.octicon.text-danger')

  confirm_password.oninput = () => {
    const isMatch = confirm_password.value === password.value;
    const isEmpty = confirm_password.value.length === 0;
  
    iconSuccess.classList.toggle('hide', !isMatch);
    iconDanger.classList.toggle('hide', isMatch || isEmpty);
  }
}
