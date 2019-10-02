var timer;
document.querySelector(".js_PlaceName").addEventListener("keyup", function(e) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === xhr.DONE) {
      if (xhr.status === 200) {
        var place = JSON.parse(xhr.responseText);
        var ul = document.querySelector("#search-list");
        ul.innerHTML = "";
        place['results'].forEach(function(pred) {
          var li = document.createElement("li");
          li.textContent = pred.terms[0]['value'];
          li.onclick = function() {
            var placename = li.textContent;
            searchPlace(placename);
            document.querySelectorAll("#search-list li").forEach(tag => tag.remove());
          };
          ul.appendChild(li);
        });
      } else {
        var error = JSON.parse(xhr.responseText);
        alert(error.message)
        console.error(error.message);
      }
    }
  };
  var query = this.value.trim();
  if (timer) {
    clearTimeout(timer);
  }
  timer = setTimeout(function() {
    if (query) {
      xhr.open("GET", "http://localhost:8015/V1_Maps_API/searchMap/autocomplete/" + query);
      xhr.send();
    }
  }, 200);
});

function searchPlace(query){
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if(xhr.readyState === xhr.DONE) {
      if(xhr.status === 200) {
        var place = JSON.parse(xhr.responseText);
        var lat = place['results'][0]['geometry']['location']['lat'];
        var lng = place['results'][0]['geometry']['location']['lng'];
        var lectureImg=document.querySelector(".js_main_imgae").src;
        var teacher_name = document.querySelector(".js_class_teacher_name").value;
        var lectureTitle = document.querySelector(".js_class_name").value;
        
        var customMap = {
          lectureURL: '#',
          teacher_name,
          lectureImg,
          lat,
          lng,
          lectureTitle,
          lectureRating: 0,
          lectureReviewCounter: 0,
          pinImg:"im-icon-Street-View",
          mapZoom : 17
        }
        searchMap(customMap);
        var latElement = document.createElement("input");
        latElement.type="hidden";
        latElement.classList.add("js_class_lat");
        latElement.value=lat;
        var lngElement = document.createElement("input");
        lngElement.type="hidden";
        lngElement.classList.add("js_class_lng");
        lngElement.value=lng;
        var js_maps = document.querySelector(".js_maps");
        js_maps.appendChild(latElement);
        js_maps.appendChild(lngElement);
      }
      else {
        var error = JSON.parse(xhr.responseText);
        alert(error.message)
        console.error(error.message);
      }
    }
  };

  xhr.open("GET", "http://localhost:8015/V1_Maps_API/searchMap/" + query);
  xhr.send();
}
