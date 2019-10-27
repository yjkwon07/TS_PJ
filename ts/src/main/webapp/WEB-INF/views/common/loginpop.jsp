<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
    <div class="small-dialog-header">
        <h3>로그인</h3>
    </div>
    <!--Tabs -->
    <div class="sign-in-form style-1">

        <div class="tabs-container alt">
            <!-- Login -->
            <div class="tab-content" id="tab1" style="display: none;">
                <form method="POST" action="/user/login">
                    <p class="form-row form-row-wide">
                        <label for="username">Username:
                            <i class="im im-icon-Male"></i>
                            <input type="text" class="input-text" name="user_id" value="" />
                        </label>
                    </p>

                    <p class="form-row form-row-wide">
                        <label for="password">Password:
                            <i class="im im-icon-Lock-2"></i>
                            <input class="input-text" type="new-password" name="user_pw" value="" />
                        </label>
                    </p>

                    <div class="form-row">
                        <input type="submit" class="button border margin-top-5"/>
                        <div class="checkboxes margin-top-10">
                            <input id="remember-me" type="checkbox" name="useCookie">
                            <label for="remember-me">Remember Me</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>