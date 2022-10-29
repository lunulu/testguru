document.addEventListener('turbolinks:load', function() {
    let control = document.querySelector('.timer')

    if (control) {
        setInterval(decreaseTimer, 1000)
    }
})

function decreaseTimer() {
    let control = document.querySelector('.timer')

    if (control.textContent <= 0) {
        document.forms[0].submit()
    }

    control.textContent -= 1
}
