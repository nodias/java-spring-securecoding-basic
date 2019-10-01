package kr.co.openeg.lab.common.utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;



public class EConnection {
     public static Connection getConnection(Object o) {
    	 Connection con=null;
    	 Properties properties = new Properties();
    	 
    	 try {   		 
    	      properties.load( o.getClass().getClassLoader()
    	    		               .getResourceAsStream("config/dbconn.properties"));
    	 } catch (IOException e) {
    		System.out.println("DB 정보 로드 실패");
    	    return null;
    	 }
    	 String driver = properties.getProperty("jdbc.driver");
    	 String url = properties.getProperty("jdbc.url");
    	 String username = properties.getProperty("jdbc.username");
    	 String password = properties.getProperty("jdbc.password");
    
    	 try {
    	    Class.forName(driver); 
    	    con=DriverManager.getConnection(url,username,password);
    	 }catch(Exception e){
    		 System.out.println("DB 연결 오류");
    		 return null;
    	 } 
    	 return con;
     }
}
