document.addEventListener('turbolinks:load', function() {

    let input1 = document.getElementById('user_password')
    let input2 = document.getElementById('user_password_confirmation')

    if (input1) { input1.addEventListener('keyup', checkPasswords) }
    if (input2) { input2.addEventListener('keyup', checkPasswords) }
})

function checkPasswords () {
    let password = document.getElementById('user_password')
    let password_confirmation = document.getElementById('user_password_confirmation')

    if (!password_confirmation.value) {
        password_confirmation.classList.remove('bg-success')
        password_confirmation.classList.remove('bg-danger')
        return
    }

    if (password.value === password_confirmation.value) {
        password_confirmation.classList.remove('bg-danger')
        password_confirmation.classList.add('bg-success')
    } else {
        password_confirmation.classList.remove('bg-success')
        password_confirmation.classList.add('bg-danger')
    }
}
