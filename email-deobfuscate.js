document.addEventListener('DOMContentLoaded', function ()
{
let enc_email = document.getElementById('email').textContent;
let email = '';
for (let i = 0; i < enc_email.length; i += 2) {
	const hexInput = parseInt(enc_email.substr(i, 2), 16);
	const hexOutput = hexInput ^ 0x14;
	email += String.fromCharCode(hexOutput);
}
document.getElementById('email').innerHTML = email;
document.getElementById('email').href = 'mailto:' + email;
});
