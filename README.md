# TS_PJ 
<p>
    <img src="https://img.shields.io/badge/version-1.0.0-rgb(26, 188, 156).svg" />
    <img src="https://img.shields.io/badge/Apache-8.5-green.svg" />
    <img src="https://img.shields.io/badge/spring-4.3.7-green.svg" />
    <img src="https://img.shields.io/badge/node->= 10.16.0-green.svg" />
    <img src="https://img.shields.io/badge/java-1.8-blue.svg" />  
    <img src="https://img.shields.io/badge/bootstrap-4-blue.svg" />  
    <img src="https://img.shields.io/badge/javascript-ES6-blue.svg" />
    <img src="https://img.shields.io/badge/Mybatis-3.4.6-rgb(243, 156, 18).svg" />
    <img src="https://img.shields.io/badge/MySQL-<= 6-rgb(243, 156, 18).svg" />
    <img alt="License" src="https://img.shields.io/badge/License-Apache_Lisense_2.0-yellow.svg"/>
</p>

- **Ver. 1.0.0**
  - 현재 재능 공유 기능만 가능 
  - 추후 커뮤니티 기능 구현 계획
  
## 재능 공유 및 판매 커뮤니티 사이트
1. 늘 똑같은 일상생활이 지루하다? 
   - **TS_PJ** 애플리케이션을 이용하여 다양한 여가생활로 지루한 삶을 탈피하길 바란다.

2. 편리하게 재능 공유 서비스를 이용하고 싶다? 
   - 현 위치 주변 여가생활 정보를 검색 서비스 제공 
 

# 설치방법 👷


# 개발환경 👨‍🏭
- Front
  - HTML/CSS (bootstrap & 외부 커스텀)
  - Javascript (ES6) chrom 권장

- Back
  - Java 1.8
  - Spring 4.3.7
  - Node 10.16.0
  - MyBatis 3.4.6
- DB
  - MySQL 6

# API & Module 📝
- [Google Maps API](https://developers.google.com/maps/documentation/javascript/tutorial)
- [Youtube API](https://developers.google.com/youtube/v3/getting-started?hl=ko)
- [timepicker.js](http://www.daterangepicker.com/#examples)
- [Dropzone.js](https://www.dropzonejs.com/#usage)
- [slick.js](http://kenwheeler.github.io/slick/)
  
# git
- **전략** 
  - [Feature Branch Workflow](https://gmlwjd9405.github.io/2017/10/27/how-to-collaborate-on-GitHub-1.html)
  - [커밋 메시지](https://djkeh.github.io/articles/How-to-write-a-git-commit-message-kor/)
 
# Page
## Main Page
![main_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page.png)
### 지도
  1. 마커들이 반경 (50/50)px 모여있으면 **클러스터링**으로 하나의 마커로 변경
  2. 지도에 매핑된 강의 메인 이미지를 클릭 시 **`강의상세페이지`** 로 이동
  3. 강의 검색 **`REST API`** 요청
     - 자동 완성 강의 검색
     - 현재위치를 기준으로 개설된 강의 검색
       - 데이터 규모가 커짐에 따라 렌더링 속도 저하 방지를 위해 현재 보이는 lat, lng 기준으로 강의를 검색 
  4. 길찾기
      - 강의 검색 후 자신의 위치에서 길찾기 **Google API** 요청

#### 자동완성 검색 및 길찾기 
![main_page_map VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page_map.gif)

#### 현재위치를 기준으로 개설된 강의 검색
![main_page_map2 VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page_map2.gif)

### 최신 강의 (비 로그인/로그인 VIEW)
  - **`(slick.js 적용)`** 최신 등록된 강의 순으로 슬라이드 형식으로 보여준다.

### 등록한 강의 (로그인 VIEW)
  - **`(slick.js 적용)`** 로그인시 자신이 등록한 강의목록을 슬라이드 형식으로 보여준다.
    - 강의 이미지 우측 상단 빨간 리본에 강의 **마감일을** 보이도록 한다.

#### slick 적용
![main_page_slick](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page_slick.gif)


## 로그인 기능
![loginpop_page_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/loginpop.PNG)

![loginpage_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/login.PNG)

#### 자동로그인 기능
```
Spring Intercepter를 이용해서 구현(아이디어: 세션 + 쿠키)

브라우저가 서버에 접속할 때 특정한 쿠키를 같이 전송하고, 이를 이용해서 로그인을 처리하는 방식, HttpSession에서 제공하는 cookie와 달리 개발자가 만든 쿠키는 ‘만료기한’을 정할 수 있기 때문에 오랜기간 보관 가능!
쿠키는 보안이 취약해서 세션을 자주 사용했지만 요즘엔 모바일에서 매번 로그인 하는 귀찮은 문제 때문에 쿠기가 다시 유행하고 있다.
```


## 강의 상세페이지(강의 등록)
![classinfo_page_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/classinfo.jpg)
### 강의정보 및 등록기능
![classinfo_video_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/classinfoVideo.gif)
  1. 강의이미지 파일 **slick**적용하여 여러가지 이미지 view
  2. 강의위치 main view이용하여 **`현재 위치에서 길찾기 기능 제공`**기능
  3. 강의영상 -> Youtube API 사용 및 커스텀
  4. 튜터의 다른 강의들 -> **slick** 적용
  5. 강의신청 -> 비로그인 시 로그인page로 이동, 로그인 시 DB에 등록되어짐 만약 등록되어 있는 강의면 **이미등록된 강의입니다.** alert알림

## 마이페이지
![userprofile_page_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/userprofile.jpg)
### 회원정보 및 등록강의목록
![userprofile_video_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/userprofileVideo.gif)

 Map형식으로 여러 DB table의 값을 저장하여 view에 전달

  1. 회원정보 
  2. 강의신청목록
  3. 강의개설목록(튜터)

#### Controller
 URL -> /profile/{user_id}, 다른 유저가 접근하려고 할 때 session을 이용해서 로그인 된 id와 다른 시 접근불가
 ```
 	@GetMapping("/profile/{user_id}")
	public ModelAndView getUserprofile(@PathVariable String user_id, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) {
		ModelAndView mv = new ModelAndView(VIEW_USER_PROFILE_FORM);
		UserVO userVO = (UserVO) request.getSession().getAttribute(LOGIN);
		try {
			Map<String, Object> map = userService.getUserprofile(user_id);
			if (map != null && user_id.equals(userVO.getUser_id())) {
				mv.addObject("userprofileVO", map);
				return mv;
			} else {
				rttr.addFlashAttribute("msg", "등록된 사용자가 없습니다");
				mv.setViewName("redirect:/main");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "등록된 사용자가 없습니다");
			mv.setViewName("redirect:/main");
			return mv;
		}
	}
 ```

## 회원가입 페이지
![register_page_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/register.jpg)

### 비동기처리를 통한 아이디 중복확인 및 회원가입
![register_video_view](https://github.com/yjkwon07/TS_PJ/blob/jh%2FREADME/image/registerVideo.gif)

#### Controller
```
	@GetMapping("/check")
	@ResponseBody
	public ResponseEntity<Map<String, String>> isUser(String user_id) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			UserVO userVO = userService.getUserInfoFromTutorId(user_id);
			if(userVO == null){
				map.put("message", "사용 가능한 아이디 입니다");
				return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
			}else {
				map.put("message", "이미 사용중인 아이디 입니다");
				return new ResponseEntity<Map<String, String>>(map, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			e.getStackTrace();
			e.getMessage();
			map.clear();
			map.put("message", "아이디를 만들수 없습니다");
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.BAD_REQUEST);
		}
	}
```
#### register.js
```
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
```

# 기획 📆
**Google Document**을 활용하여 기획 구성

- 프로젝트 관리 
  - 2019.09.03 ~ 2019.10.27

[프로젝트 기획](https://docs.google.com/document/d/15NszXOKZhiLjBO2Q62rTcVrHN8yIdE9OAlUQAfEcGiE/edit?usp=sharing)

![flow](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/flow.png)

# Mindmup🤔
**Google Mindmup**을 활용하여 아이디어 확장

[mindmup](https://drive.mindmup.com/map/1EwfCe1HodFb2d6O-Y9zePkc0dbcALPMT)

![mindmup](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/mindmup.png)

# DataBase 🖥
- work **(MySQL workbench 6.3 CE)**
  - [DB Design](./info/DB.md)
  - [DB Query](./DB/dgs.sql)


