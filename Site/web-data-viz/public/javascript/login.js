function switchInputMode() {
  var input = input_password;

  input.type = input.type == "password" ? "text" : "password";
}

function checkLogin() {
    var username = input_username.value;
    var password = input_password.value;

    if (username == 'admin' && password == '1234') {
        window.location.href = './dashboard.html';
    } else {
        alert('Usuário ou senha estão incorretos')
        
        document.getElementById('input_username').value = "";
        document.getElementById('input_password').value = "";
    }
}