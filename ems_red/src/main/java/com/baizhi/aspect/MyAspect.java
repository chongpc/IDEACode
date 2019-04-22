package com.baizhi.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

@Configuration
@Aspect
@Order(1)
public class MyAspect {
    @Before("within(com.baizhi.service.*ServiceImpl)")
    public void beforeAspect(JoinPoint joinPoint){
        System.out.println("===前置通知===");
        String name = joinPoint.getSignature().getName();
        System.out.println("Method name="+name);
        System.out.println("==前置结束==");
    }
    @After("within(com.baizhi.service.*ServiceImpl)")
    public void AfterAspect(JoinPoint joinPiont){
        System.out.println("==后置通知==");
        String s = joinPiont.toString();
        System.out.println(s);
    }
    @Around("within(com.baizhi.service.*ServiceImpl)")
    public Object roundAspect(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        System.out.println("==环绕通知==");
        String name = proceedingJoinPoint.getSignature().getName();
        System.out.println(name);
        Object proceed = proceedingJoinPoint.proceed();
        return proceed;
    }
}
