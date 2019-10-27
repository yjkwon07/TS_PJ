<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <form method="POST" action="/user/register">

        <div class="row">

            <div class="col-lg-12">

                <div id="add-listing" class="separated-form">

                    <!--  Thank you Register -->
                    <div class="add-listing-section">
                        <!-- Headline -->
                        <div class="add-listing-headline">
                            <h3> <i class="sl sl-icon-doc"></i> Thank you for Register </h3>
                        </div>

                        <!-- user info -->
                        <div class="row with-forms">
                            <!-- UserID -->
                            <div class="col-md-6">
                                <h5>
                                    UserID
                                    <i class="tip" data-tip-content='아이디를 입력해주세요.'></i>
                                </h5>
                                <input type="text" name="user_id" />
                            </div>
                            
                            <!-- Username -->
                            <div class="col-md-6">
                                <h5>
                                    UserName
                                    <i class="tip" data-tip-content='본인 이름을 입력해주세요.'></i>
                                </h5>
                                <input type="text" name="user_name" />
                            </div>

                            <!-- Password -->
                            <div class="col-md-6">
                                <h5>
                                    Password
                                    <i class="tip" data-tip-content='비밀번호를 입력해 주세요.'></i>
                                </h5>
                                <input type="text" name="user_pw" class="js_user_pw">
                            </div>

                            <!-- Password repeat -->
                            <div class="col-md-6">
                                <h5>
                                    Password
                                    <i class="tip" data-tip-content='비밀번호를 입력해 주세요.'></i>
                                </h5>
                                <input type="password" class="js_user_pw_repeat">
                            </div>

                            <!-- 성별 -->
                            <div class="col-md-6">
                                <h5>
                                    성별
                                    <i class="tip"
                                        data-tip-content='성별을 숫자로 입력해 주세요. <br> <i class="fa fa-warning"></i> 남자: 1, 여자: 2'></i>
                                </h5>
                                <input type="number" name="user_sex" class="js_user_sex" />
                            </div>

                            <!-- 튜터 -->
                            <div class="col-md-6">
                                <h5>
                                    튜터/튜티 설정
                                    <i class="tip"
                                        data-tip-content='튜터/튜티를 설정해 주세요. <br> 튜터는 강좌를 계설 할 수 있습니다. <br> <i class="fa fa-warning"></i> 튜티: 1, 튜터: 2'></i>
                                </h5>
                                <input type="number" name="user_auth" class="js_user_auth"/>
                            </div>

                            <!-- 출생일 -->
                            <div class="col-md-6">
                                <h5>
                                    출생일
                                </h5>
                                <input name="user_birth" class="js_flatpickr_basic"/>
                            </div>

                            <!-- YouTube Link -->
                            <div class="col-md-6">
                                <h5>
                                    YouTube Link
                                    <i class="tip"
                                        data-tip-content='자신의 유튜브로 홍보해 보세요. <br> <i class="fa fa-warning"></i> 홍보 영상이 없으면 빈칸으로 남겨 주세요.'></i>
                                </h5>
                                <input type="url" name="user_youtube" placeholder="https://www.youtube.com/">
                            </div>
                        </div>
                        <!-- user info / End-->
                    </div>
                    <!-- Thank you Register / End -->

                    <!-- 상태 메시지 -->
                    <div class="add-listing-section margin-top-45">

                        <!-- Headline -->
                        <div class="add-listing-headline">
                            <h3>
                                <i class="sl sl-icon-docs"></i> 상태 메시지
                            </h3>
                        </div>

                        <!-- Description -->
                        <div class="form">
                            <h5>상태 메시지 <i class="tip" data-tip-content='자신의 상태 메시지 내용을 입력해 주세요.'></i></h5>
                            <textarea cols="40" rows="3" name="user_status"></textarea>
                        </div>

                    </div>
                    <!-- 상태 메시지 / End -->

                </div>
            </div>
        </div>
        
        <input type="submit" class="button border fw margin-top-10" name="register" value="Register" />

    </form>
</div>