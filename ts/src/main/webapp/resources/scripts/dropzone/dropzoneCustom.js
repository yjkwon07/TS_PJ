/*
    The most important aspect, is that there are data-dz-* markers in the markup, so that Dropzone can update the elements automatically.
   
    브라우저 지원
    크롬 7 이상
    Firefox 4 이상
    IE 10 이상
    Opera 12+ (API버그가 있기 때문에 MacOS 용 버전 12는 비활성화 됨)
    사파리 6+

    참고: https://www.dropzonejs.com/bootstrap.html
*/

var previewTemplate = `
    <div id="template" class="list-box-listing">
        <!-- This is used as the file preview template -->
        <!-- image -->
        <div class="list-box-listing-img">
            <span class="preview"><img data-dz-thumbnail /></span>
        </div>

        <!-- content -->
        <div class="list-box-listing-content">
            <div class="inner">
                <p class="name" data-dz-name></p>
                <strong class="error text-danger" data-dz-errormessage></strong>
                <p class="size" data-dz-size></p>
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                    <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
                </div>
            </div>
        </div>

        <!-- button -->
        <div class="buttons-to-right">

            <a href="#" role="button" role="buuton" class="start button medium border">
                <i class="fa fa-cloud-upload"></i>
                <span>Start</span>
            </a>

            <a href="#" role="button" data-dz-remove class="cancel button medium border">
                <i class="fa fa-trash-o"></i>
                <span>Cancel</span>
            </a>
            
            <button data-dz-remove class="delete button gray">
                <i class="fa fa-trash-o"></i>
                <span>Delete</span>
            </button>
        </div>
    </div>
`;

// Disabling autoDiscover, otherwise Dropzone will try to attach twice.
Dropzone.autoDiscover = false;
var CLASS_ID = document.querySelector(".js_class_id").value;
var URL_UPLOAD ="/file/upload";
var URL_DELETE = "/file/delete";

// Dropzone class
var myDropzone = new Dropzone("#dropzoneFrom", {
    url: URL_UPLOAD, // set the url
    acceptedFiles: "image/*", // MIME TYPE
    thumbnailWidth: 250, 
    thumbnailHeight: 250,
    maxFilesize: 2, // MB
    autoQueue: false, // Make sure the files aren't queued until manually added
    parallelUploads: 20, // 병렬로 처리 할 파일 업로드 수
    previewTemplate, // previewTemplate setting
    previewsContainer: ".js_previews-template", // Define the container to display the previews
    init : function() {
        // To use the information sent back from the server, use the success event
        this.on("success", function(file, resJson) {
            var progressbar = file.previewTemplate.querySelector(".progress-bar");
            var progress =progressbar.style['width'];
            xhrAfterButton(file.previewTemplate);
            if(progress !== "100%") {
                xhrAfterError(file.previewTemplate);
            }else{
                xhrAftertag(file.previewTemplate)
            }
            file.previewTemplate.appendChild(document.createTextNode(resJson.message));
        });

        this.on("error", function(file, resJson) {
            xhrAfterButton(file.previewTemplate);
            xhrAfterError(file.previewTemplate);
            var error = file.previewTemplate.querySelector(".error");
            error.innerHTML=resJson.message;
            file.previewTemplate.appendChild(document.createTextNode(resJson.message));
        });
    }
});

myDropzone.on("addedfile", function(file) {
    if(file.size > 20000 * 1000) {
        alert("이미지크기는 2MB 넘지 않게 업로드 해주세요.");
          file.previewTemplate.remove();
    }
    else {
        addfileButton(file.previewElement);
        var uploadButton = file.previewElement.querySelector(".start");
        uploadButton.addEventListener('click', function (event) {
            event.preventDefault();
            myDropzone.processFile(file);
            xhrdelete(file);
        }, { passive: false });
    }
});

// Setup the buttons for all transfers
// The "add files" button doesn't need to be setup because the config
document.querySelector(".js_allUpload").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
};

document.querySelector(".js_allDelete").onclick = function() {
    myDropzone.removeAllFiles(true);
};

// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
    var progress = document.querySelector(".progress-bar");
    if(progress){
        progress.style.width = progress + "%";
    }
});

// 폴더 이름을 class_id로 만들어서 저장하기
myDropzone.on("sending", function(file , xhr, formData) {
    formData.append("class_id", CLASS_ID);
});

function addfileButton(file){
    // button hidden
    file.querySelector(".buttons-to-right").style.opacity = 1;
    file.querySelector(".delete").style.visibility= "hidden";
}

function xhrAfterButton(file) {
    file.querySelector(".start").style.display = "none";
    file.querySelector(".cancel").style.display = "none";
    file.querySelector(".delete").style.visibility = "visible";
}

function xhrAfterError(file) {
    var progressbar = file.querySelector(".progress-bar");
    progressbar.classList.remove("progress-bar-success");
    progressbar.classList.add("progress-bar-danger");
}

function xhrAftertag(file){
    file.addEventListener("click", function() {
        var name = file.querySelector(".name").innerHTML;
        var thumbnail = file.querySelector(".preview img").src;
        var mainImage = document.querySelector(".js_main_imgae");    
        var class_image = document.querySelector(".js_class_image");
        mainImage.src=thumbnail;
        class_image.value=name;
    });
}

function xhrdelete(file) {
    file.previewElement.querySelector(".delete").addEventListener("click", function (event) {
        event.preventDefault();
        var formData = new FormData();
        formData.append('file_name', file.name);
        formData.append('class_id', CLASS_ID);
        fetch(URL_DELETE, {
            method: 'DELETE', 
            body: formData, 
        }).then((res) => {
            if ([200, 201].includes(res.status)) {
                res.json().then(json => {
                    alert(json.message);    
                });
            } else {
                res.json().then(json => {
                    alert(json.message);
                    document.querySelector(".js_previews-template").appendChild(file.previewElement);
                    console.error(json.message);
                });
            }
        }).catch(err => console.error(err));
    }, { passive: false });

}
