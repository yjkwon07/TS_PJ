var CLASS_ID = document.querySelector(".js_class_id").value;
var URL = "/test/regist";

var submitButton = document.querySelector(".js_submit");
submitButton.addEventListener("click", function (event) {
    event.preventDefault();
    // Thank you open the class 
    var class_name = document.querySelector(".js_class_name").value;
    if (!class_name || class_name === undefined) {
        return alert("강의 명을 입력해 주세요.");
    }
    var class_maincategories = document.querySelector(".js_mainCateoreies_Litener").value;
    var class_subcategories = document.querySelector(".js_subCateoreies_Litener").value;
    var class_teacher_name = document.querySelector(".js_class_teacher_name").value;
    var user_id = document.querySelector(".js_user_id").value;
    var class_summary = document.querySelector(".js_class_summary").value;
    if (!class_summary || class_summary === undefined) {
        return alert("전반적인 강의 내용을 적어주세요");
    }
    var class_youtube = document.querySelector(".js_class_youtube").value;
    var class_student_cnt = document.querySelector(".js_class_student_cnt").value;
    if (class_student_cnt <= 0) {
        return alert("수강 인원은 0보다 커야 합니다.");
    } else if (class_student_cnt.includes('e')) {
        return alert("숫자로만 기입해 주세요.");
    }
    // Thank you open the class / end 

    // 강의 사진 
    var class_image = document.querySelector(".js_class_image").value;
    var class_content = document.querySelector(".js_class_content").value;
    if (!class_image || class_image === undefined) {
        return alert("대표 강의 사진을 검색해 주세요");
    }

    // 강의 장소
    var class_lat = document.querySelector(".js_class_lat").value;
    var class_lng = document.querySelector(".js_class_lng").value;
    if (!class_lat || class_lat === undefined || class_lat === null) {
        return alert("강의 장소를 검색해 주세요");
    }
    else if (!class_lng || class_lng === undefined || class_lng === null) {
        return alert("강의 장소를 검색해 주세요");
    }

    // 강의 시작일 / 종료일 
    var class_startday = document.querySelector(".js_class_startday").value;
    var class_endday = document.querySelector(".js_class_endday").value;
    if (!class_startday || class_startday === undefined) {
        return alert("강의 시작일을 선택해 주세요");
    }
    else if (!class_endday || class_endday === undefined) {
        return alert("강의 종료일을 선택해 주세요");
    }

    // 강의 날짜
    var calendar = {
        Monday: "js_class_MON",
        Tuesday: "js_class_TUE",
        Wednesday: "js_class_WED",
        Thursday: "js_class_THU",
        Friday: "js_class_FRI",
        Saturday: "js_class_SAT",
        Sunday: "js_class_SUN"
    };
    var calendarKey = Object.keys(calendar);
    for (var index = 0; index < calendarKey.length; index++) {
        calendar[calendarKey[index]] = document.querySelectorAll(`.${calendar[calendarKey[index]]}`);
        calendar[calendarKey[index]] = calendar[calendarKey[index]][0].value + " ~ " + calendar[calendarKey[index]][1].value;
    }

    // 가격
    var class_price = document.querySelector(".js_class_price").value;
    if (class_price <= 0) {
        alert("가격은 0보다 커야 합니다.");
    } else if (class_price.includes('e')) {
        alert("숫자로만 기입해 주세요.");
    }

    var formData = new FormData();
    formData.append("class_id", CLASS_ID);
    formData.append("user_id", user_id);
    formData.append("class_name", class_name);
    formData.append("class_student_cnt", class_student_cnt);
    formData.append("class_image", class_image);
    formData.append("class_price", class_price);
    formData.append("class_summary", class_summary);
    formData.append("class_content", class_content);
    formData.append("class_MON", calendar.Monday);
    formData.append("class_TUE", calendar.Tuesday);
    formData.append("class_WED", calendar.Wednesday);
    formData.append("class_THU", calendar.Thursday);
    formData.append("class_FRI", calendar.Friday);
    formData.append("class_SAT", calendar.Saturday);
    formData.append("class_SUN", calendar.Sunday);
    formData.append("class_lat", class_lat);
    formData.append("class_lng", class_lng);
    formData.append("class_maincategories", class_maincategories);
    formData.append("class_endday", class_endday);
    formData.append("class_subcategories", class_subcategories);
    formData.append("class_teacher_name", class_teacher_name);
    formData.append("class_startday", class_startday);
    formData.append("class_youtube", class_youtube);
    lectureInsert(formData);

}, { passive: false });

function lectureInsert(formData) {
    fetch(URL, {
        method: 'POST',
        body: formData,
    }).then((res) => {
        if ([200, 201].includes(res.status)) {
            res.json().then(json => {
                alert(json.message);    
            });
            window.location.href = `/lecture/${CLASS_ID}`;
        } else {
            res.json().then(json => {
                alert(json.message);    
            });
            console.error(res.message);
        }
    }).catch(err => console.error(err));
}