package kr.co.openeg.aop.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AopTest {

	public static void main(String[] args) {
			  String configLocation = "config.xml";
			  ApplicationContext context = new ClassPathXmlApplicationContext(configLocation);
			  Apple apple = (Apple) context.getBean("apple");
			  apple.println();
	 }

}
