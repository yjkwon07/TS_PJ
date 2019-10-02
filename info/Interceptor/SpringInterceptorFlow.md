# Spring Interceptor 처리순서

	1. interceptor의 prehandle 호출 -> true 이면 컨트롤러 메소드 호출
    2. controller의 메소드 실행
    3. interceptor의 posthandle처리

    참고문서
    [스프링 인터셉터] https://to-dy.tistory.com/21d
   