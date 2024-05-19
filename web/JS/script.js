



document.getElementById('openFormBtn').addEventListener('click', function() {
    document.getElementById('consultationForm').classList.add('show');
});

document.getElementById('closeFormBtn').addEventListener('click', function() {
    document.getElementById('consultationForm').classList.remove('show');
});

function handleSubmit(event) {
    event.preventDefault();
    alert('Đăng ký thành công, chúng tôi sẽ sớm liên lạc qua email của bạn');
    document.getElementById('form').reset();
    document.getElementById('consultationForm').classList.remove('show');
}
