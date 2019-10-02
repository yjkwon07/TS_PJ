package com.duojj.common;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggingAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);
	
	// target 메서드의 파라미터등 정보를 출력합니다.
	@Before("execution(* com.duojj.service.*.*(..)) or "
			+ "execution(* com.duojj.dao.*.*(..))")
	public void startLog(JoinPoint jp) {
		logger.info("-------------------------------------");
		logger.info("-------------------------------------");

		// 전달되는 모든 파라미터들을 Object의 배열로 가져옵니다. 
		logger.info("Before, req(모든 파라미터들):" + Arrays.toString(jp.getArgs()));

		//해당 Advice의 타입을 알아냅니다. 
		logger.info("Advice 타입:" + jp.getKind());

		// 실행하는 대상 객체의 메소드에 대한 정보를 알아낼 때 사용합니다. 
		logger.info("실행하는 메소드정보:" + jp.getSignature().getName());

		// target 객체를 알아낼 때 사용합니다. 
		logger.info("target 객체정보:" + jp.getTarget().toString());

		// Advice를 행하는 객체를 알아낼 때 사용합니다. 
		logger.info("Advice를 행하는 객체정보:" + jp.getThis().toString());
	}
	
	@After("execution(* com.duojj.service.*.*(..)) or "
			+ "execution(* com.duojj.dao.*.*(..))")
	public void after(JoinPoint jp) { 
		logger.info("-------------------------------------");
		logger.info("-------------------------------------");

		// 전달되는 모든 파라미터들을 Object의 배열로 가져옵니다. 
		logger.info("After, req(모든 파라미터들):" + Arrays.toString(jp.getArgs()));

		// 해당 Advice의 타입을 알아냅니다. 
		logger.info("Advice 타입:" + jp.getKind());

		// 실행하는 대상 객체의 메소드에 대한 정보를 알아낼 때 사용합니다.
		logger.info("실행하는 메소드정보:" + jp.getSignature().getName());

		// target 객체를 알아낼 때 사용합니다. 
		logger.info("target 객체정보:" + jp.getTarget().toString());

		// Advice를 행하는 객체를 알아낼 때 사용합니다 
		logger.info("Advice를 행하는 객체정보:" + jp.getThis().toString());
	}

	// target 메소드의 동작 시간을 측정합니다.
	@Around("execution(* com.duojj.service.*.*(..)) or "
			+ "execution(* com.duojj.dao.*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		long startTime = System.currentTimeMillis();
		logger.info("==============================");
		logger.info("가져온 파라미터들:"+Arrays.toString(pjp.getArgs()));

		// 실제 타겟을 실행하는 부분이다. 이 부분이 없으면 advice가 적용된 메소드가 동작하지않습니다.
		Object result = pjp.proceed(); // proceed는 Exception 보다 상위 Throwable을 처리해야 합니다.

		long endTime = System.currentTimeMillis();
		// target 메소드의 동작 시간을 출력한다.
		logger.info("Method-Done:"+pjp.getSignature().getName() + " : " + (endTime - startTime) + "ms"); 
		logger.info("==============================");

		// Around를 사용할 경우 반드시 Object를 리턴해야 합니다.
		return result;
	}
}
