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