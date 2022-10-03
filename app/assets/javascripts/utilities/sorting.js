document.addEventListener('turbolinks:load', function() {
	let control = document.querySelector('.sort-by-title')

	if (control) { control.addEventListener('click', sortRowsByTitle) }
})


function sortRowsByTitle() {
	let table = document.querySelector('table')

	// NodeList
	// https://developer.mozilla.org/en-US/docs/Web/API/NodeList
	let rows = table.querySelectorAll('tr')
	let sortedRows = []

	// Select all table rows except the first one which is the header
	for (let i = 1; i < rows.length; i++) {
		sortedRows.push(rows[i])
	}

	let arrowUp = this.querySelector('.octicon-arrow-up')
	let arrowDown = this.querySelector('.octicon-arrow-down')

	if (arrowUp.classList.contains('hide')) {
		sortedRows.sort(compareRowsAsc)
		arrowUp.classList.remove('hide')
		arrowDown.classList.add('hide')
	} else {
		sortedRows.sort(compareRowsDesc)
		arrowUp.classList.add('hide')
		arrowDown.classList.remove('hide')
	}

	let sortedTable = document.createElement('table')
	let thead = document.createElement('thead')
	let tbody = document.createElement('tbody')

	sortedTable.appendChild(thead)
	sortedTable.appendChild(tbody)

	sortedTable.classList.add('table', 'table-hover',  'align-middle')
	tbody.classList.add('table-group-divider')

	thead.appendChild(rows[0])

	for (let i = 0; i < sortedRows.length; i++) {
		tbody.appendChild(sortedRows[i])
	}

	table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
	let testTitle1 = row1.querySelector('td').textContent
	let testTitle2 = row2.querySelector('td').textContent

	if (testTitle1 < testTitle2) { return -1 }
	if (testTitle1 > testTitle2) { return 1 }
	return 0
}

function compareRowsDesc(row1, row2) {
	let testTitle1 = row1.querySelector('td').textContent
	let testTitle2 = row2.querySelector('td').textContent

	if (testTitle1 < testTitle2) { return 1 }
	if (testTitle1 > testTitle2) { return -1 }
	return 0
}
