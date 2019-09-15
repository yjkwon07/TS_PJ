var timer;
document.querySelector("#search").addEventListener("keyup", function(e) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === xhr.DONE) {
      if (xhr.status === 200) {
        var predictions = JSON.parse(xhr.responseText);
        var ul = document.querySelector("#search-list");
        ul.innerHTML = "";
        predictions.forEach(function(pred) {
          var li = document.createElement("li");
          li.textContent = pred.terms[0].value;
          li.onclick = function() {
            location.href = "/search/" + pred.terms[0].value;
          };
          ul.appendChild(li);
        });
      } else {
        console.error(xhr.responseText);
      }
    }
  };
  var query = this.value.trim();
  if (timer) {
    clearTimeout(timer);
  }
  timer = setTimeout(function() {
    if (query) {
      xhr.open("GET", "http://localhost:8015/autocomplete/" + query);
      xhr.send();
    }
  }, 200);
});

document.querySelector("#search-form").addEventListener("submit", function(e) {
  e.preventDefault();
  if (!this.search.value || !this.search.value.trim()) {
    this.search.focus();
    return false;
  }
  this.action = "/search/" + this.search.value.trim();
  return this.submit();
});
