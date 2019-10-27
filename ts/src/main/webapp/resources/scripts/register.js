flatpickr(".js_flatpickr_basic");

const PW = document.querySelector("js_user_pw");
const PW_REPEAT = document.querySelector("js_user_pw_repeat");
const SEX = document.querySelector("js_user_sex");
const AUTH = document.querySelector("js_user_auth");
const submit = document.querySelector("button").addEventListener("click", (event) => {
    event.preventDefault();
    if (SEX) {
        if (SEX.value !== 1 && SEX.value == 2) {
            return alert("성별오직 1 또는 2 입니다.");
        }
        else {
            return alert("성별을 기입해 주세요.");
        }
    } 

    if (AUTH) {
        if (AUTH.value !== 1 && AUTH.value == 2) {
            return alert("튜티는 1, 튜터는 2 입니다.");
        }
        else {
            return alert("튜터/튜티 기입해 주세요.");
        }
    } 

    if (PW && PW_REPEAT) {
        if (PW.value !== PW_REPEAT.value) {
            return alert("비밀번호가 일치 하지 않습니다.");
        }
        else {
            return alert("비밀번호 모두 기입해 주세요.");
        }   
    } 
    
}, { passive: false });

