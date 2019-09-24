# LoginPathInterceptor

특정 경로에 접근하는 경우 사용자가 로그인한 상태의 사용자인지 체크하는 역할 처리)
로그인이 안되어 있으면 로그인창으로 이동하고
로그인하면 사용자가 원하는 URI로 다시 이동!

**추후에 회원들만 접근할 수 있는 곳에서 사용될 예정**
## preHandle()
```
session을 가져와 만약 login이라는 session이 없으면 경로를 저장해놓는다.
그리고 웹으로부터 loginCookie를 가져와 있으면 하루가 지나지 않았으면 컨트롤러 메서드 실행 loginCookie가 없으면 /user/login창으로 이동

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			
			
			saveDest(request);
			
			//현재 사용자가 HttpSession에 적당한 값이 없는 경우 loginCookie를 가지고 있는지 체크한다.(3번 상황)
			//만일 과거에 보관한 쿠키가 있다면 UserService 객체를 이용해서 사용자의 정보가 존재하는지 확인한다.
			//만일 사용자의 정보가 존재한다면 HttpSession에 다시 사용자의 정보를 넣어준다.
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				
				if(userVO != null) {
					session.setAttribute("login", userVO);
					return true;
				}
			}
			
			response.sendRedirect("/user/login");
			return false;
		}
		
		return true;
	}
```
## savaDest 메소드
현재 uri를 저장하는 메소드

```
	private void saveDest(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";	
		} else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			req.getSession().setAttribute("dest", uri + query);
		}
	}
```