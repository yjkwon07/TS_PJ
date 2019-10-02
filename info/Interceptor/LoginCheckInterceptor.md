# LoginCheckInterceptor

로그인이 되어있는지 확인하는 interceptor

## preHandle()
```
session을 가져와서 만약 login이라는 이름으로 세션이 저장되어 있으면 session을 지우고 true를 반환하여 컨트롤러 메소드(/user/loginPost) 실행

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)!= null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
```

## method()
```
로그인 정보가 없으면 login페이지로이동
정보가 있으면 main페이지로 이동하고 만약 로그인시 자동로그인을 체크했으면 sessionkey와 sessionLimit 업데이트

	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public ModelAndView postLogin(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr)throws Exception{
	
		logger.info("call loginPost");
		ModelAndView mv = new ModelAndView();
		UserVO vo = service.login(dto);
		
		if(vo == null) {
			mv.setViewName("redirect:login");
			rttr.addFlashAttribute("msg", "등록된 정보가 없습니다.");
			//비동기?status
			return mv;
		} else {
			mv.setViewName("/main");
			mv.addObject("userVO", vo);
			rttr.addFlashAttribute("msg", "로그인되었습니다.");
			if (dto.isUseCookie()) {
				mv.addObject("userVO", vo);
				int amount = 60 * 60 * 5;
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
				service.keepLogin(vo.getUser_id(), session.getId(), sessionLimit);
			}
			return mv;
		}
	}
```


## postHandle()
```
로그인안 사용자에 대해 Httpsession에 보관처리를 담당하는 역할 자동 로그인을 선택한 경우 쿠키를 생성하고 쿠키의 이름 'loginCookie'로 저장, 값에는 세션 쿠키의 값 

쿠키의 사용 범위를 지정해주지 않으면 쿠키를 보낸 서블릿의 경로에
한정. 따라서 쿠키의 사용 범위를 현재 웹 어플리케이션 전체로 지정해야함

@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		UserVO userVO = (UserVO)modelMap.get("userVO"); // UserController에서 가져온 로그인한 vo객체 가져옴
		
		if(userVO != null) {
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO);
			
			if(request.getParameter("useCookie") != null) {
				
				logger.info("remember me..........");
				Cookie loginCookie = new Cookie("loginCookie",session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*5); 
				response.addCookie(loginCookie); //만들어진 쿠키는 반드시 HttpServletResponse에 담겨서 전송
			}
			
			
			Object dest = session.getAttribute("dest");
			if(dest == null) {
				response.sendRedirect("/test/main");
			} else {
				response.sendRedirect(dest != null ? (String)dest:"/");
			}
			
		}
	}
```