# TutorAuthCheckInterceptor

로그인한 유저가 튜터인지 확인하는 interceptor

## preHandle()
```
session을 가져와 만약 login이고 튜티이면 접근 불가 튜터면 접근가능

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(LOGIN);
		try {
			String sessionKey = userVO.getUser_sessionkey();
			int tutorCheck = service.checkUserTutorAuth(sessionKey);

			if(tutorCheck == 1) {
				logger.info("튜터가 아닙니다.");
				response.sendRedirect("/user/login");
				return false;
			} else if(tutorCheck == 2) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("로그인이 안되어있습니다.");
			response.sendRedirect("/user/login");
			return false;
		}
		
	}
```