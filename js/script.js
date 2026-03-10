// script.js

// เลือกฟอร์มสมัคร
const form = document.getElementById("registerForm");

// เมื่อผู้ใช้กดส่งฟอร์ม
form.addEventListener("submit", function(event){

    // ป้องกันไม่ให้หน้าเว็บรีโหลด
    event.preventDefault();

    // แสดงข้อความแจ้งเตือน
    alert("ส่งใบสมัครเรียบร้อยแล้ว เจ้าหน้าที่จะติดต่อกลับทางอีเมล");

});