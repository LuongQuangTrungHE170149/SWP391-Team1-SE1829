<%-- 
    Document   : consultation
    Created on : May 20, 2024, 3:05:43 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    #openFormBtn {
        position: fixed;
        top: 70%;
        right: 0;
        transform: translateY(-50%);
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px 0 0 5px;
        z-index: 1000;
    }

    .form-container {
        position: fixed;
        top: 70%;
        right: -350px;
        transform: translateY(-50%);
        width: 300px;
        padding: 20px;
        background-color: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        transition: right 0.3s;
        z-index: 1001;
    }

    .form-container form {
        display: flex;
        flex-direction: column;
    }

    .form-container h2 {
        margin-bottom: 10px;
    }

    .form-container label {
        margin-bottom: 5px;
    }

    .form-container input,
    .form-container textarea {
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .form-container button {
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }

    .form-container.show {
        right: 0;
    }
    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background: none;
        border: none;
        font-size: 20px;
        cursor: pointer;
    }
</style>

<button id="openFormBtn">Đăng ký tư vấn</button>
<div id="consultationForm" class="form-container">
    <button id="closeFormBtn" class="close-btn">&times;</button>
    <form id="form" action="addConsultation" method="post" >
        <h2>Đăng ký tư vấn</h2>
        <label for="name">Họ và Tên</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="content">Thông tin hỗ trợ</label>
        <textarea id="content" name="content" rows="4" required></textarea>

        <button type="submit">Gửi</button>
    </form>
    <div id="responseMessage"></div>
</div>

<script>
    
  

    document.getElementById('openFormBtn').addEventListener('click', function () {
        document.getElementById('consultationForm').classList.add('show');
    });

    document.getElementById('closeFormBtn').addEventListener('click', function () {
        document.getElementById('consultationForm').classList.remove('show');
    });

    document.getElementById('form').addEventListener('subnit', function (event) {
        event.preventDefault();
        var form = event.target;
        var formData = new FormData(form);

        fetch(form.action, {
            method: form.method,
            body: formData
        })
                .then(response => {
                    if (response.ok) {
                        alert('Đăng ký thành công, chúng tôi sẽ sớm liên lạc qua email của bạn');
                        form.reset();
                        document.getElementById('consultationForm').classList.remove('show');
                    } else {
                        alert('Có lỗi xảy ra, vui lòng thử lại sau.');
                    }
                }).catch(error => {
            console.error('Error:', error);
        });
    });


</script>
