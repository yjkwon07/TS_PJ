var calendar = {
    Monday: "class_MON",
    Tuesday: "class_TUE",
    Wednesday: "class_WED",
    Thursday: "class_THU",
    Friday: "class_FRI",
    Saturday: "class_SAT",
    Sunday: "class_SUN"
};
var calendarKey = Object.keys(calendar);
var day = document.querySelector(".js_day");
for (var index = 0; index < calendarKey.length; index++) {
    var dayElement = `
                <div class="row opening-day js-demo-hours">
                    <div class="col-md-2">
                        <h5>${calendarKey[index]}</h5>
                    </div>
                    <div class="col-md-5">
                        <input class="flatpickr ${calendar[calendarKey[index]]}" data-placeholder="Opening Time" type="text" placeholder="Select Time"/>
                    </div>
                    <div class="col-md-5">
                        <input class="flatpickr ${calendar[calendarKey[index]]}" data-placeholder="Closing Time" type="text" placeholder="Select Time"/>
                    </div>
                </div>
    `;
    
    day.innerHTML += dayElement;
}
flatpickr(".flatpickr", 
    {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true
    }
);
flatpickr(".js_flatpickr_basic");