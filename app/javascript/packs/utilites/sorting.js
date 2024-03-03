document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const table = document.querySelector('table')
  const tableHead = table.querySelector('thead')
  const rows = table.querySelectorAll('tbody tr')
  const sortedRows = []

  rows.forEach((item) => {
    sortedRows.push(item)
  })

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  // Создаем тапблицу
  const sortedTable = document.createElement('table')
  sortedTable.classList.add('table', 'table-striped', 'table-hover')

  // Создаем контейнер под строки
  const sortedTableBody = document.createElement('tbody')
  sortedTableBody.classList.add('table-group-divider')

  sortedTable.appendChild(tableHead)

  sortedRows.forEach((item) => {
    sortedTableBody.appendChild(item)
  })

  sortedTable.appendChild(sortedTableBody)
  table.parentNode.replaceChild(sortedTable, table)
}


function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return -1}
  if (testTitle1 > testTitle2) {return 1}
  return 0
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return 1}
  if (testTitle1 > testTitle2) {return -1}
  return 0
}


