let timer;
const placeElement = document.querySelector(".js_PlaceName");
const lectureElement = document.querySelector(".js_LectureName");

const DEFAULT_IMG = "/resources/images/slider-bg-02.jpg";

// It makes the preview lecture InfoBox that using the lectureInsert page
// It serach the place 
if (placeElement) {
  placeElement.addEventListener("keyup", function (_e) {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
      if (xhr.readyState === xhr.DONE) {
        if (xhr.status === 200) {
          let place = JSON.parse(xhr.responseText);
          let ul = document.querySelector("#search-list");
          ul.innerHTML = "";
          place['results'].forEach(function (pred) {
            let li = document.createElement("li");
            li.textContent = pred.terms[0]['value'];
            li.onclick = function () {
              const placename = li.textContent;
              searchPlace(placename);
              document.querySelectorAll("#search-list li").forEach(tag => tag.remove());
            };
            ul.appendChild(li);
          });
        } else {
          const error = JSON.parse(xhr.responseText);
          alert(error.message)
          console.error(error.message);
        }
      }
    };
    const query = this.value.trim();
    if (timer) {
      clearTimeout(timer);
    }
    timer = setTimeout(function () {
      if (query) {
        xhr.open("GET", "http://localhost:8015/V1_Maps_API/searchMap/autocomplete/" + query);
        xhr.send();
      }
    }, 200);
  });
}

// It makes the lecture InfoBox that using the Main page
// Gps, streetView vsibile
// It search the lecture
if (lectureElement) {
  lectureElement.addEventListener("keyup", function (_e) {
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
      if (xhr.readyState === xhr.DONE) {
        if (xhr.status === 200) {
          let place = JSON.parse(xhr.responseText);
          let ul = document.querySelector("#search-list");
          ul.innerHTML = "";
          place['results'].forEach(function (pred) {
            let li = document.createElement("li");
            li.textContent = pred['class_name'];
            li.onclick = function () {
              const placename = li.textContent;
              searchLecture(placename);
              document.querySelectorAll("#search-list li").forEach(tag => tag.remove());
            };
            ul.appendChild(li);
          });
        } else {
          const error = JSON.parse(xhr.responseText);
          alert(error.message)
          console.error(error.message);
        }
      }
    };
    const query = this.value.trim();
    if (timer) {
      clearTimeout(timer);
    }
    timer = setTimeout(function () {
      if (query) {
        xhr.open("GET", "http://localhost:8015/V1_Maps_API/searchClass/autocomplete/" + query);
        xhr.send();
      }
    }, 200);
  });
}

// search bounds lecture (lat, lng)
// prevent the traffic data jam
function getLecture(startLat, startLng, endLat, endLng) {
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === xhr.DONE) {
      if (xhr.status === 200) {
        let place = JSON.parse(xhr.responseText);
        let customMap = [];
        place['results'].forEach((lecture) => {
          let lat = lecture['class_lat'];
          let lng = lecture['class_lng'];
          lat = parseFloat(lat);
          lng = parseFloat(lng);
          let lectureId = lecture['class_id'];
          let lectureImg = lecture['class_image'];
          if (lectureImg !== null && lectureImg === 'local') {
            lectureImg = DEFAULT_IMG;
          }
          else {
              lectureImg = `/file/download?image_name=${lectureImg}&class_id=${lectureId}`;
          }
          let teacher_name = lecture['class_teacher_name'];
          let lectureTitle = lecture['class_summary'];
          let class_id = lecture['class_id'];
          let customMapOption = {
            lectureURL: `/lecture/${class_id}`,
            teacher_name,
            lectureImg,
            lat,
            lng,
            lectureTitle,
            lectureRating: 0,
            lectureReviewCounter: 0,
            pinImg: "im-icon-Street-View",
          }
          customMap.push(customMapOption);
        });
        if (customMap.length > 1) {
          searchLectureBoundsMap(customMap);
        }
      }
    }
    else {
      // const error = JSON.parse(xhr.responseText);
      // alert(error.message);
      // console.error(error.message);
    }
  };
  xhr.open("GET", "http://localhost:8015/V1_Maps_API/searchBoundsLecture" + `?startLat=${startLat}&startLng=${startLng}&endLat=${endLat}&endLng=${endLng}`);
  xhr.send();
}

function searchPlace(query) {
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === xhr.DONE) {
      if (xhr.status === 200) {
        let place = JSON.parse(xhr.responseText);
        let lat = place['results'][0]['geometry']['location']['lat'];
        let lng = place['results'][0]['geometry']['location']['lng'];
        lat = parseFloat(lat);
        lng = parseFloat(lng);
        let lectureImg = document.querySelector(".js_main_imgae").src;
        let teacher_name = document.querySelector(".js_class_teacher_name").value;
        let lectureTitle = document.querySelector(".js_class_name").value;

        let customMap = {
          lectureURL: '#search',
          teacher_name,
          lectureImg,
          lat,
          lng,
          lectureTitle,
          lectureRating: 0,
          lectureReviewCounter: 0,
          pinImg: "im-icon-Street-View",
        }
        searchPlaceMap(customMap);
        let latElement = document.createElement("input");
        latElement.type = "hidden";
        latElement.classList.add("js_class_lat");
        latElement.value = lat;
        let lngElement = document.createElement("input");
        lngElement.type = "hidden";
        lngElement.classList.add("js_class_lng");
        lngElement.value = lng;
        let js_maps = document.querySelector(".js_maps");
        js_maps.appendChild(latElement);
        js_maps.appendChild(lngElement);
      }
      else {
        const error = JSON.parse(xhr.responseText);
        alert(error.message)
        console.error(error.message);
      }
    }
  };

  xhr.open("GET", "http://localhost:8015/V1_Maps_API/searchMap/" + query);
  xhr.send();
}

function searchPlaceMap(customMap) {
  const locationData = [
    {},
    {
      html: googleMap.locationData(customMap),
      lat: parseFloat(customMap.lat),
      lng: parseFloat(customMap.lng),
      pinMarkerId: 1,
      pinImg: `<i class="im ${customMap.pinImg}"></i>`
    },
  ];
  googleMap.removePinMarker();
  googleMap.position.lat = parseFloat(customMap.lat);
  googleMap.position.lng = parseFloat(customMap.lng);
  const postion = new google.maps.LatLng(googleMap.position.lat, googleMap.position.lng);
  googleMap.map.setCenter(postion);
  googleMap.setMapZoom(14);
  googleMap.setInfoBox(locationData);
}

function searchLecture(query) {
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === xhr.DONE) {
      if (xhr.status === 200) {
        let place = JSON.parse(xhr.responseText);
        let lat = place['results'][0]['class_lat'];
        let lng = place['results'][0]['class_lng'];
        lat = parseFloat(lat);
        lng = parseFloat(lng);
        let lectureImg = place['results'][0]['class_image'];
        if (lectureImg === 'local') {
          lectureImg = DEFAULT_IMG;
        }
        else {
          lectureImg = "/resources/images/" + lectureImg;
        }
        let teacher_name = place['results'][0]['class_teacher_name'];
        let lectureTitle = place['results'][0]['class_summary'];
        let class_id = place['results'][0]['class_id'];
        let customMap = {
          lectureURL: `/lecture/${class_id}`,
          teacher_name,
          lectureImg,
          lat,
          lng,
          lectureTitle,
          lectureRating: 0,
          lectureReviewCounter: 0,
          pinImg: "im-icon-Street-View",
        }
        searchLectureMap(customMap);

        if (GPS) {
          GPS.style.visibility = "visible";
        }
        if (STREETELEMENT) {
          STREETELEMENT.style.visibility = "visible";
        }
      }
      else {
        const error = JSON.parse(xhr.responseText);
        alert(error.message)
        console.error(error.message);
      }
    }
  };
  xhr.open("GET", "http://localhost:8015/V1_Maps_API/searchClass/" + query);
  xhr.send();
}

function searchLectureMap(customMap) {
  const locationData = [
    {},
    {
      html: googleMap.locationData(customMap),
      lat: parseFloat(customMap.lat),
      lng: parseFloat(customMap.lng),
      pinMarkerId: 1,
      pinImg: `<i class="im ${customMap.pinImg}"></i>`
    },
  ];
  googleMap.removePinMarker();
  LECTURE_LAT = parseFloat(customMap.lat);
  LECTURE_LNG = parseFloat(customMap.lng);
  googleMap.position.lat = parseFloat(customMap.lat);
  googleMap.position.lng = parseFloat(customMap.lng);
  const postion = new google.maps.LatLng(googleMap.position.lat, googleMap.position.lng);
  googleMap.map.setCenter(postion);
  googleMap.setMapZoom(14);
  googleMap.setInfoBox(locationData);
}

function searchLectureBoundsMap(customMap) {
  googleMap.removePinMarker();
  let locationData = [{},];
  customMap.forEach((custom, number) => {
    let location = {
      html: googleMap.locationData(custom),
      lat: parseFloat(custom.lat),
      lng: parseFloat(custom.lng),
      pinMarkerId: number + 1,
      pinImg: `<i class="im ${custom.pinImg}"></i>`
    }
    locationData.push(location);
  });
  googleMap.setInfoBox(locationData);
  googleMap.setClusterStyles();
}