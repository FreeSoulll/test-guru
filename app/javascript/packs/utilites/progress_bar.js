document.addEventListener('turbolinks:load', function() {
  const progress = document.querySelector('.progress')

  if (progress) {
    const progressBar = progress.querySelector('.progress-bar')
    const countQuestions = progress.dataset.count
    const currenQuestion = progress.dataset.current == 1 || progress.dataset.current == countQuestions ? progress.dataset.current -1 : progress.dataset.current
    const progressCount = (currenQuestion / countQuestions) * 100
    
    progressBar.style.width = `${progressCount}%`
  }
})
