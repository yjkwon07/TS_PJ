flatpickr(".js_flatpickr_basic");
const URL = "/user/register";
const user_id = document.querySelector(".js_user_id");
const PW = document.querySelector(".js_user_pw");
const PW_REPEAT = document.querySelector(".js_user_pw_repeat");
const SEX = document.querySelector(".js_user_sex");
const AUTH = document.querySelector(".js_user_auth");
const REPEAT_CHECK = document.querySelector(".js_user_repeat_check");
const USER_BIRTH = document.querySelector(".js_user_birth");
let user_repeat = document.querySelector(".js_user_repeat");

REPEAT_CHECK.addEventListener("click" , () => {
    if(user_id.value !== undefined && user_id.value !== "") {
        return isuserCheck(user_id.value);
    } else {
        return alert("아이디를 입력해 주세요");
    }
}, {passive: false});

function isuserCheck(query) {
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    user_repeat.value = 0;
    if (xhr.readyState === xhr.DONE) {
      if (xhr.status === 200) {
        let userCheck = JSON.parse(xhr.responseText);
        user_repeat.value = 1;
        return alert(userCheck.message);
      }
      else {
        const error = JSON.parse(xhr.responseText);
        console.error(error.message);
        return alert(error.message)
      }
    }
  };
  xhr.open("GET", "/user/check?user_id=" + query);
  xhr.send();
}

const submit = document.querySelector(".js_submit").addEventListener("click", (event) => {
    event.preventDefault();

    if(parseInt(user_repeat.value) == 0) {
        return alert("아이디 중복 확인해 주세요");
    }
    
    if (!PW.value || !PW_REPEAT.value) {
        return alert("비밀번호 모두 기입해 주세요");
    }   

    if (PW.value !== PW_REPEAT.value) {
        return alert("비밀번호가 일치 하지 않습니다");
    }

    if (parseInt(SEX.value) !== 1 && parseInt(SEX.value) !== 2) {
        return alert("성별오직 1 또는 2 입니다");
    }

    if (parseInt(AUTH.value) !== 1 && parseInt(AUTH.value) !== 2) {
        return alert("튜티는 1, 튜터는 2 입니다");
    }

    if(!USER_BIRTH.value || USER_BIRTH.value === undefined || USER_BIRTH.value === null) {
        return alert("출생일을 입력해 주세요")
    }

    let user_name = document.querySelector(".js_user_name").value;
    let user_youtube = document.querySelector(".js_user_youtube").value;
    let user_status = document.querySelector(".js_user_status").value;

    const formData = new FormData();
    formData.append("user_id", user_id.value);
    formData.append("user_pw", PW.value);
    formData.append("user_name", user_name);
    formData.append("user_birth", USER_BIRTH.value);
    formData.append("user_sex", parseInt(SEX.value));
    formData.append("user_status", user_status);
    formData.append("user_youtube", user_youtube);
    formData.append("user_auth", parseInt(AUTH.value));
    userInsert(formData);

}, { passive: false });


function userInsert(formData) {
    fetch(URL, {
        method: 'POST',
        body: formData,
    }).then((res) => {
        if ([200, 201].includes(res.status)) {
            res.json().then(json => {
                alert(json.message);    
            });
            window.location.href = `/main`;
        } else {
            res.json().then(json => {
                alert(json.message);    
                window.location.href = `/main`;
            });
            console.error(res.message);
        }
    }).catch(err => console.error(err));
}