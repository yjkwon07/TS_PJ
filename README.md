# TS_PJ 
<p>
    <img src="https://img.shields.io/badge/version-1.0.0-rgb(26, 188, 156).svg" />
    <img alt="IDE" src="https://img.shields.io/badge/IDE-VSCode/Eclipse-rgb(26, 188, 156).svg" />
    <img src="https://img.shields.io/badge/Pritter-2.3.0-rgb(26, 188, 156).svg" />
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
  
## 재능 공유 사이트
1. 늘 똑같은 일상생활이 지루하다? 
   - **TS_PJ** 애플리케이션을 이용하여 다양한 여가생활로 지루한 삶을 탈피하길 바란다.

2. 편리하게 재능 공유 서비스를 이용하고 싶다? 
   - 현 위치 주변 여가생활 정보를 검색 서비스 제공 

# 설치방법 
1. Server
2. DB
3. folder
4. Spring
5. Node 

# 개발환경
- Front
  - HTML/CSS (bootstrap4 & 외부 커스텀)
  - Javascript (ES6) chrom 권장

- Back
  - Java 1.8
  - Spring 4.3.7
  - Node 10.16.0
  - MyBatis 3.4.6
- DB
  - MySQL 6


# DataBase
- work **(MySQL workbench 6.3 CE)**
  - [DB Design](./info/DB.md)
  - [DB Query](./DB/dgs.sql)

# API & Module 
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
- **[Main Page](https://github.com/yjkwon07/TS_PJ/tree/yj/userprofile#1-main-page)**
- **[LectureInsert Page](https://github.com/yjkwon07/TS_PJ/tree/yj/userprofile#2-lectureinsert-page-%EA%B0%95%EC%9D%98%EB%93%B1%EB%A1%9D)**
- **[Login Page](https://github.com/yjkwon07/TS_PJ/tree/yj/userprofile#3-login-page)**
- **[LectureInfo Page](https://github.com/yjkwon07/TS_PJ/tree/yj/userprofile#4-lectureinfo-page-강의상세-조회)**
- **[My Page](https://github.com/yjkwon07/TS_PJ/tree/yj/userprofile#5-my-page-%EC%9C%A0%EC%A0%80-%ED%94%84%EB%A1%9C%ED%95%84)**
- **[Join Us Page](https://github.com/yjkwon07/TS_PJ/tree/yj/userprofile#6-join-us-page-%ED%9A%8C%EC%9B%90-%EA%B0%80%EC%9E%85)**

## 1. Main Page
![main_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page.png)

### 지도
  - **`(Google Maps API 적용)`**
  - **[`GoogleMap Object Custom`](https://github.com/yjkwon07/TS_PJ/blob/master/ts/src/main/webapp/resources/scripts/maps/googleMap.js)**
    - **[`GoogleMap Object Document`](https://github.com/yjkwon07/TS_PJ/pull/34)**
  1. 마커들이 반경 (50/50)px 모여있으면 **클러스터링**으로 하나의 마커로 변경
  2. 지도에 매핑된 강의 메인 이미지를 클릭 시 **`강의상세페이지`** 로 이동
  3. 강의 검색 **`REST API`** 요청
     - 자동 완성 강의 검색
     - 현재위치를 기준으로 개설된 강의 검색
       - 데이터 규모가 커짐에 따라 렌더링 속도 저하 방지를 위해 현재 보이는 lat, lng 기준으로 강의를 검색 
  4. 길찾기
      - 강의 검색 후 해당 유저의 현재 위치에서 길찾기 **Google API** 요청
#### 자동완성 검색 및 길찾기 
![main_page_map VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page_map.gif)

#### 현재위치를 기준으로 개설된 강의 검색
![main_page_map2 VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page_map2.gif)

### 최신 강의 (비 로그인/로그인 VIEW)
  - **`(slick.js 적용)`** 최신 등록된 강의 순으로 슬라이드 형식으로 보여준다.

### 등록한 강의 (로그인 VIEW)
  - **`(slick.js 적용)`** 로그인시 유저가 등록한 강의목록을 슬라이드 형식으로 보여준다.
    - 강의 이미지 우측 상단 빨간 리본에 강의 **마감일을** 보이도록 한다.
#### slick 적용
![main_page_slick](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/main_page_slick.gif)

## 2. LectureInsert Page (강의등록)
![lecuterInsert_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/LectureInsert_page.png)

### 튜터/튜티 VIEW
#### 튜터 권한 Check 
- 튜터는 header 페이지에 강의개설 버튼이 보인다.
  
![튜터 권한 VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/LectureInsert_page_TutorCheck.gif)

- 튜티는 header 페이지에 강의개설 버튼이 안 보인다.

![튜티 권한 VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/LectureInsert_page_TuteeCheck.gif)

### Categories DTO 
  - 메인 카테고리와 서브 카테고리의 데이터는 수정사항이 많이 생길것을 대비해 서버에서 **[`CategoriesDTO`](https://github.com/yjkwon07/TS_PJ/blob/master/ts/src/main/java/com/duojj/dto/CategoriesDTO.java)** 를 만들어 데이터를 받아온다.
  
### DropZone Custom 
- **[`DropZone Object Custom`](https://github.com/yjkwon07/TS_PJ/blob/master/ts/src/main/webapp/resources/scripts/dropzone/dropzoneCustom.js)**
- 모든 이미지를 드래그&드롭으로 업로드가 가능
- 페이지 업로드 후 원하는 사진 삭제 기능 
- 메인 이미지 선택 기능
  - 지도에 있는 마커를 클릭 시 나타나는 **`InfoBox`** 의 이미지 선택
#### DropZone
![DropZone](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/LectureInsert_page_DropZone.gif)

### 장소 검색 
장소 검색 후 **`Main Page`** 지도에 렌더링이될 마커 표시 뷰를 미리 볼 수 있다. 
- **`(Google Maps API 적용)`**
  - **[`GoogleMap Object Custom`](https://github.com/yjkwon07/TS_PJ/blob/master/ts/src/main/webapp/resources/scripts/maps/googleMap.js)**
    - **[`GoogleMap Object Document`](https://github.com/yjkwon07/TS_PJ/pull/34)**
- 장소 검색 **`REST API`** 요청
    - 자동 완성 강의 검색
#### Marker Create
![Marker Create](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/LectureInsert_page_MarkerCreate.gif)

## 3. Login Page 
1. 페이지 header 부분 **sign in** 버튼 클릭시 페이지를 유지하고 **`Login Page`** **팝업**

![loginpop_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/LoginPopup_page.png)

1. 튜터 권한 접근 페이지 접근 시 **[`TutorAuthCheckInterceptor`](https://github.com/yjkwon07/TS_PJ/blob/master/ts/src/main/java/com/duojj/interceptor/TutorAuthCheckInterceptor.java)** 로 확인하여 로그인 안되어있다면 로그인 페이지 이동 

![login_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/Login_page.png)

### 자동로그인
**[`UserController`](https://github.com/yjkwon07/TS_PJ/blob/master/ts/src/main/java/com/duojj/controller/UserController.java)**

**[`LoginFormInterceptor`](https://github.com/yjkwon07/TS_PJ/blob/master/ts/src/main/java/com/duojj/interceptor/LoginCheckInterceptor.java)** 

- 로그인시 **`Remember Me`** 버튼을 클릭하게 된다면 **`tbl_user`** 테이블의 해당 유저의 **`user_sessionlimit`** 값을 갱신한다. 즉, user_sessionlimit값이 곧 로그인 유지 시간을 뜻한다. 
- **`user_sessionlimit`** 값을 갱신후 **`LoginFormInterceptor`** 에서 **`Cookie`** 값으로 아이디 정보를 저장한다. Cookie 유지 시간은  **`user_sessionlimit`** 과 동일하다. 
- 모든 페이지는 Cookie값을 가져와서 LOGIN 유무를 판단하여 로그인을 유지할 수 있다.

## 4. LectureInfo Page (강의상세 조회)
![Lectureinfo_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/Lectureinfo_page.png)

### 강의이미지 
  - **`(slick.js 적용)`** 강의이미지 파일을 메인, 서브 이미지 순으로 볼 수있다.

### 강의 장소
  - 길찾기
    - 현재 위치에서 해당 강의 길찾기 **Google API** 요청

### 강의 영상 
  - **`Youtube API`** 요청 
    - **`LectureInsert Page`** 에서 YouTube Link 기입 시 VIEW 
    - **`LectureInsert Page`** 에서 YouTube Link 기입을 안할 시 VIEW에서 제외

### 튜터의 다른 강의들
  - **`(slick.js 적용)`** 해당 튜터가 개설한 다른 강의들을 볼 수 있다.

## 5. My Page (유저 프로필)
![userprofile_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/userprofile_page.png)

### 유저 프로필
  - 유저의 아이디, 이미지, 상태메시지를 볼 수 있다.

### 등록된 강의 목록 (튜터/튜티 VIEW)
  - 유저가 등록한 강의 목록을 보여준다.
### 강의개설 목록 (튜터 VIEW)
  - **`(slick.js 적용)`**  해당 유저가 개설한 다른 강의들을 볼 수 있다.

## 6. Join Us Page (회원 가입)
**`아이디 중복확인`** 버튼으로 유저 회원 중복 방지 

![register_page VIEW](https://github.com/yjkwon07/TS_PJ/blob/yj/userprofile/image/register_page.png)

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