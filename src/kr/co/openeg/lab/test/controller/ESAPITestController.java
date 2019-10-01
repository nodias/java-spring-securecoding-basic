package kr.co.openeg.lab.test.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ESAPITestController {
	
	@RequestMapping("/test/esapi_test.do")
	public String test() {		
		
		return "/test/esapi_test";
	}
	

	
	@RequestMapping(value="/test/esapi_encrypt_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testEncryption(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		if ( data != null ) {
	          buffer.append("ESAPI 암호화 테스트");
		}
        return buffer.toString();
		
	}
	
	@RequestMapping(value="/test/esapi_encode_test.do",method = RequestMethod.POST)
	@ResponseBody
	public String testEncoding(HttpServletRequest request) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		if ( data != null ) {
          buffer.append("ESAPI 인코딩 테스트");
		}
		return buffer.toString();
	}
	

	
	@RequestMapping(value="/test/esapi_xss_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testXss(HttpServletRequest request) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		if ( data != null ) {
	          buffer.append("ESAPI XSS 테스트");
		}
        return buffer.toString();
		
	}
	
	@RequestMapping(value="/test/esapi_sql_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testSqlInjection(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		if ( id != null  && passwd != null ) {
	          buffer.append("ESAPI SQL 인젝션 테스트");
		}
        return buffer.toString();
		
	}
	
	public String readDB(String id, String passwd) {
		  StringBuffer  result=new StringBuffer();
		  Connection con=null;
		  Statement st=null;
		  ResultSet rs=null;
		  InputStream is =
		       this.getClass().getClassLoader().getResourceAsStream("config/dbconn.properties");
		  Properties props = new Properties();
		  try {
		     props.load(is);
		     String driver = props.getProperty("jdbc.driver");
		     String url = props.getProperty("jdbc.url");
		     String username = props.getProperty("jdbc.username");
		     String password = props.getProperty("jdbc.password");
		     System.out.println(driver+url+username+password);
		     Class.forName(driver);
		     con=DriverManager.getConnection(url, username, password);
		     st=con.createStatement();

		     String query =        
		             "select * from jmboard_member where userid='"+
		               id +"'"+
		              "and userpw='"+
		               passwd+"'";		
		     System.out.println(query);
		     rs=st.executeQuery(query);
		     if ( rs.next() ) {
		         result.append("ID: "+rs.getString(2));
		         result.append("    PASSWORD: "+rs.getString(3));
		     }else {
		         result.append("등록되어있지 않은 계정입니다.");
		     }
		  } catch (Exception e) {
		        e.printStackTrace();
		     System.err.println("Load failed");
		  } 
		   if ( rs != null ) try { rs.close(); }catch(SQLException e){}
		   if ( st != null ) try { st.close(); }catch(SQLException e){}
		   if ( con != null ) try { con.close(); }catch(SQLException e){}
		            
		   return result.toString();
	
	}
	
	@RequestMapping(value="/test/esapi_authenticator_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testAuthenticator(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session){
		    StringBuffer buffer=new StringBuffer();
        	String id=request.getParameter("id");
        	String passwd=request.getParameter("passwd");
    		if ( id != null  && passwd != null ) {
  	          buffer.append("ESAPI 계정등록 테스트");
  		    }
        	
        	return buffer.toString();
        }
        
	@RequestMapping(value="/test/esapi_login_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testLogin(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session){
		    StringBuffer buffer=new StringBuffer();
        	String id=request.getParameter("id");
        	String passwd=request.getParameter("passwd");
    		if ( id != null  && passwd != null ) {
    	          buffer.append("ESAPI 로그인 테스트");
    		}
        	return buffer.toString();
        }
	

	@RequestMapping(value="/test/esapi_validation_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testSecureCookie(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		if ( data != null) {
	          buffer.append("ESAPI 입력값 검증 테스트");
		}
        return buffer.toString();
		
	}
	
	@RequestMapping(value="/test/esapi_logout_test.do", method = RequestMethod.GET)
	@ResponseBody
	public String testLogout(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		buffer.append("ESAPI 로그아웃 테스트");
        return buffer.toString();
		
	}
	
	@RequestMapping(value="/test/esapi_redirect_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testForwarding(HttpServletRequest request,HttpServletResponse response){
		StringBuffer buffer=new StringBuffer();
		String url=request.getParameter("data");
		if ( url != null) {
	          buffer.append("ESAPI 리다이렉트 테스트");
		}
		return buffer.toString();
	}

}
