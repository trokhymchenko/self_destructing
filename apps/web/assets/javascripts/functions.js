function encode()
{
  var secret = document.getElementById('message-password').value;
  var message = document.getElementById('message-text').value;
  var encrypted = CryptoJS.AES.encrypt(message, secret);
  document.getElementById("message-text").value = encrypted;
  document.getElementById("message-encrypted").value = 'true';
}

function decode()
{
  var secret = document.getElementById('password').value;
  var message = document.getElementById('message').value;
  var decrypted = CryptoJS.AES.decrypt(message, secret);
  decrypted = decrypted.toString(CryptoJS.enc.Utf8);
  document.getElementById("message").innerHTML = decrypted;
}
