var tag = document.createElement('script');
tag.src = "https://www.youtube.com/player_api?showinfo=0&enablejsapi=1&origin=https://localhost:8090'";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var videoId = document.querySelector(".js_user_youtube").value;
videoId = videoId.split('/');
videoId = videoId[videoId.length - 1];

// 플레이어변수 설정
var youTubePlayer;

function onYouTubeIframeAPIReady() {
    youTubePlayer = new YT.Player('youTubePlayer', {
        width: '850',
        height: '520',
        videoId,
        playerVars: {rel: 0},//추천영상 안보여주게 설정
        events: {
          'onReady': onPlayerReady, //로딩할때 이벤트 실행
          'onStateChange': onPlayerStateChange //플레이어 상태 변화시 이벤트실행
        }
    });//youTubePlayer셋팅
}

function onPlayerReady(event) {
    event.target.playVideo();//자동재생
    //로딩할때 실행될 동작을 작성한다.
}

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING) {
        //플레이어가 재생중일때 작성한 동작이 실행된다.
    }
  }
 
$(document).ready(function () {
    $(".btn_play").on("click", function () {
        youTubePlayer.playVideo();//재생
    });
    $(".btn_stop").on("click", function () {
        youTubePlayer.stopVideo();//정지
    });
    $(".btn_pause").on("click", function () {
        youTubePlayer.pauseVideo();//일시정지
    });
});