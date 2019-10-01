package kr.co.openeg.lab.test.controller;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Scanner;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.openeg.lab.member.model.MemberModel;
import kr.co.openeg.lab.member.service.MemberService;
import kr.co.openeg.lab.test.util.Customer;
import kr.co.openeg.lab.test.util.CustomerService;
import kr.co.openeg.lab.test.util.DBinit;
import kr.co.openeg.lab.test.util.Role;
import kr.co.openeg.lab.test.util.TestUtil;

import com.nhncorp.lucy.security.xss.XssFilter;



@Controller
public class TestController {
	
	static int count;
	
	@Resource(name="memberService")
	private MemberService service;
	
	@Resource(name="testService")
	private TestService testService;
	
	@RequestMapping("/test/test.do")
	public String test() {		
		
		return "/test/test";
	}
	
	
	// TOCTOU
	@RequestMapping(value="/test/concurrency_test.do")
	@ResponseBody
	public String testConcurrency(HttpServletRequest request){
		    StringBuffer buffer=new StringBuffer();			
		    buffer.append("실행결과1: "+ count +"<br/>");
		    count=count+TestUtil.getInt(request.getParameter("data"));
		    try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				buffer.append("처리 불가");
			}
		    buffer.append("실행결과2: "+count);
		
        return buffer.toString();	
	}
	
	// 캡슐화 위배
	@RequestMapping(value="/test/encap_test.do")
	@ResponseBody
	public String testEncapsulation(HttpServletRequest request){
	    StringBuffer buffer=new StringBuffer();			
	    Role role=Role.getInstance();
	    String data=request.getParameter("data");
	    String type=request.getParameter("type");
	    switch(TestUtil.getInt(type)){
	    case 0:
	    	        buffer.append(role.adminLists());
	    	        break;
	    case 1:
	    	        String[] list = role.getAdminRoles();
	    	        list[0]=data;
	    	        buffer.append(role.adminLists());
	    	        break;
	    case 2:
	        String[] users=data.split(",");
	        role.setAdminRoles(users);
	        buffer.append("새로 설정된 관리자 목록: "+role.adminLists()+"<br/>");        
	        users[0]="hacker";
	        buffer.append("위조된 관리자 목록: "+role.adminLists());
	        break;
	    default:
	    }
        return buffer.toString();	
	}
	
	
	// 널포인트 역참조
	@RequestMapping(value="/test/null_test.do")
	@ResponseBody
	public String testNull(HttpServletRequest request, HttpSession session){
		    StringBuffer buffer=new StringBuffer();			
	        String data=request.getParameter("data");
	        String userid=request.getParameter("userid");
	        try {
		        FileReader fr=new FileReader("c:/SecureCoding/eclipse/eclipse.ini");	
		        if( userid.equals("admin")) {
		        	switch(TestUtil.getInt(data)){
		        	case 0: buffer.append("백업 작업을 수행합니다."); break;
		        	case 1: buffer.append("복구 작업을 수행합니다."); break;
		        	case 2: buffer.append("실행 작업을 수행합니다."); break;
		        	default: buffer.append("선택된 작업이 없습니다.");
		        	}
		        } else {
		        	buffer.append("작업권한이 없습니다.");
		        }
	        }catch(Exception e) {
	        	buffer.append("파일 초기화 작업을 수행합니다."); 
	        }
		 
        return buffer.toString();	
	}
	
	
	// 무한반복제어 
	@RequestMapping(value="/test/loop_test.do")
	@ResponseBody
	public String testLoopExit(HttpServletRequest request){
		    StringBuffer buffer=new StringBuffer();			
		    int number = TestUtil.getInt(request.getParameter("data"));
            int result=TestUtil.factorial(number);
		    buffer.append(number+"! = "+result);
            return buffer.toString();	
	}
	
	// 세션정보 노출 
	@RequestMapping(value="/test/session_data_test.do")
	@ResponseBody
	public String testSessionData(HttpServletRequest request, HttpSession session){
		StringBuffer buffer=new StringBuffer();	
		CustomerService cust=CustomerService.getInstance();	
		Customer c=new Customer(request.getParameter("name"),
	                                                  request.getParameter("phone"));
		
		//session.setAttribute("customer", cust.getCustomer());
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			buffer.append("요청 작업을 처리할 수 없습니다: 10001");
		}
		//Customer c=(Customer)session.getAttribute("customer");
		synchronized (this) {
			cust.setCustomer(c);
			buffer.append(cust.displayCustomer());
		}
        return buffer.toString();	
	}	
	
	// XPath 인젝션
	@RequestMapping(value="/test/xpath_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testXpathInjection(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		String name=request.getParameter("name");
		buffer.append("실행결과: ");
		TestUtil util=new TestUtil();
	    buffer.append(util.readXML(name));
        return buffer.toString();
		
	}
	
	//Command 인젝션
	@RequestMapping(value="/test/command_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testCommandInjection(HttpServletRequest request, HttpSession session){
		StringBuffer buffer=new StringBuffer();	
		String data=request.getParameter("data");
			
	    if ( data != null  && data.equals("type")) {
	    		data=data+" "+
	    	            request.getSession().getServletContext().getRealPath("/")+
	    	            "file1.txt"; 
	    		System.out.println(data);
	    }
    	
		Process process;
		String osName = System.getProperty("os.name");
		String[] cmd;

		if(osName.toLowerCase().startsWith("window")) {
		    cmd = new String[] { "cmd.exe","/c",data };
		    for( String s : cmd)
		       System.out.print(s+" ");
		} else {
		    cmd = new String[] { "/bin/sh",data };
		}

		try {
			process = Runtime.getRuntime().exec(cmd);
			InputStream in = process.getInputStream(); 
			Scanner s = new Scanner(in,"EUC-KR");
			buffer.append("실행결과: <br/>");
			while(s.hasNextLine() == true) {
			    buffer.append(s.nextLine()+"<br/>");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			buffer.append("실행오류발생");
			e.printStackTrace();
		} 
			return buffer.toString();

	}
	
	
	// 암호화 테스트 

	
	@RequestMapping(value="/test/encrypt_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testEncryption(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		String type=request.getParameter("type");
		switch ( TestUtil.getInt(type)  ) {
		case 0:
			buffer.append("SHA-256 테스트: "); break;
		case 1:
			buffer.append("AES 암호화 테스트: ");break;		
		case 2:
			buffer.append("AES 복호화 테스트: "); break;
		case 3:
			buffer.append("RSA 암호화 테스트: "); break;
		case 4:
			buffer.append("RSA 복호화 테스트: "); break;
	    default:
	    	buffer.append("잘못된 요청입니다: ");
		}
		
        return buffer.toString();
		
	}
	
	
	// 인코딩 테스트 
	@RequestMapping(value="/test/encode_test.do",method = RequestMethod.POST)
	@ResponseBody
	public String testEncoding(HttpServletRequest request) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		String type=request.getParameter("type");
		switch ( TestUtil.getInt(type)  ) {
		case 0:
			buffer.append("BASE64 인코딩 테스트: "); break;
		case 1:
			buffer.append("BASE64 디코딩 테스트: "); break;
		case 2:
			buffer.append("URL 인코딩 테스트: "); break;
		case 3:
			buffer.append("URL 디코딩 테스트: "); break;
		case 4:
			buffer.append("HTML 인코딩 테스트: "); break;
		case 5:
			buffer.append("HTML 디코딩 테스트: "); break;
	    default:
	    	buffer.append("잘못된 요청입니다.");
		}
		return buffer.toString();
	}
	
	
	// 정규식 테스트 
	@RequestMapping(value="/test/reg_test.do",method = RequestMethod.POST)
	@ResponseBody
	public String testRegEx(HttpServletRequest request) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		buffer.append("정규식테스트  입력값: "+data);
        return buffer.toString();		

	}
	
	// CSRF 테스트 
	@RequestMapping(value="/test/csrf_test.do")
	@ResponseBody
	public String testCSRF(HttpServletRequest request) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
	    MemberModel   m=service.findMember(data);
		//buffer.append("<font color='pink' size='8'>");
		buffer.append("<p>사용자ID: "+m.getUserId()+"</p>");
		buffer.append("<p>이메일: "+m.getUserName()+"</p>");
		buffer.append("<p>PIN NO: "+m.getPinNo()+"</p>");
		//buffer.append("</font>");
        return buffer.toString();	
	}
	
	
	// CSRF 테스트 
	@RequestMapping(value="/test/csrf_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testCSRF2(HttpServletRequest request) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		buffer.append(data);
        return buffer.toString();	
	}
	
	
//	// Reflective XSS 테스트 
//	@RequestMapping(value="/test/xss_test.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String testXss(HttpServletRequest request) {
//		StringBuffer buffer=new StringBuffer();
//		String data=request.getParameter("data");
//		buffer.append(data);
//        return buffer.toString();	
//	}
	
	// Reflective XSS 테스트 
		@RequestMapping(value="/test/xss_test.do", method = RequestMethod.POST)
		@ResponseBody
		public String testXss(HttpServletRequest request) {
			StringBuffer buffer=new StringBuffer();
			String data=request.getParameter("data");
			
			//데이터 정규화
			//data = data.toLowerCase();
					
			//문자열 필터
//			if (data != null) {
//			    	data = data.replaceAll("script", "").replaceAll("SCRIPT", "");
//			    } else {
//			    	data = "";
//			 }

			//HTML 인코딩 필터		
//			if (data != null) {
//			    	data = data.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("&", "&amp;").replaceAll("\"", "&quot;");
//			    } else {
//			    	data = "";
//			 }
					
			// 검증된 외부 라이브러리 필터 로직을 적용
			// Lucy XSS Filter 
			//lucy-xss-1.1.2.jar→ /WEB-INF/lib/ 폴더에 복사
			//lucy-xss-superset.xml → /src 폴더에 복사

//	       XssFilter filter = XssFilter.getInstance("lucy-xss-superset.xml");
//			data = filter.doFilter(data)	;
			
			//Spring MVC 공통 필터 적용
			/*
			/openeg/src/kr/co/openeg/lab/common/filter 폴더에 아래 2개 파일 넣기
			XSSRequestWrapper.java, XSSFilter.java
			web.xml 백업 후 을 web_xss.xml 을 web.xml로 수정
			dispatcher-servlet.xml 파일에 Beans ID 변경 --> filterMultipartResolver
			*/
			
			//출력값에 대한 필터
			//view.jsp 에 c:out, escapeXml jsp jstl 문법으로 html 인코딩 처리
			/*
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<c:out value="${board.subject}

			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
			<p>${fn:escapeXml(board.subject)}
			*/

			buffer.append(data);
	        return buffer.toString();	
		}
	
	
	
	
	
	
	// Stored XSS 테스트 
	@RequestMapping(value="/test/xss_test_b.do", method = RequestMethod.POST)
	@ResponseBody
	public String testXssB(HttpServletRequest request) {
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("1", "<script>alert('xss');</script>");
        map.put("2", "&lt;script&gt;alert('xss');&lt;/script&gt;");
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		if ("1".equals(data)) {
			buffer.append(map.get("1"));
		}else if ( "2".equals(data)) {
			buffer.append(map.get("2"));
		} else {
			buffer.append("잘못된 요청입니다.");
		}
        return buffer.toString();	
	}
	
	// DOM XSS 테스트 
	@RequestMapping(value="/test/xss_test_c.do")
	public void testXssC(HttpServletRequest request, HttpServletResponse response) {
		String data=request.getParameter("data");
        try {
	         response.sendRedirect("../domxss.jsp?message="+data);
        } catch (IOException e) {
	
          System.out.println("ERROR");
        }
	}
	
	// SQL 인젝션 
	@RequestMapping(value="/test/sql_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testSqlInjection(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		TestUtil util=new TestUtil();
		buffer.append("ID,PASSWD 조회 결과:   " );
		buffer.append(util.readDB(id, passwd));
        return buffer.toString();
		
	}
	
	
	// SQL 인젝션 
	@RequestMapping(value="/test/sql_test_b.do", method = RequestMethod.GET)
	@ResponseBody
	public String testSqlInjectionB(HttpServletRequest request){
		StringBuffer buffer=new StringBuffer();
		String id=request.getParameter("id");
		TestUtil util=new TestUtil();
		buffer.append("MySQL 조회결과:    " );
		buffer.append(util.readDB2(id));
        return buffer.toString();
		
	}
	
	
	// SQL 인젝션 
	@RequestMapping(value="/test/sql_test_b2.do", method = RequestMethod.GET)
	@ResponseBody
	public String testSqlInjectionB2(HttpServletRequest request) throws Exception{
		StringBuffer buffer=new StringBuffer();
		String id=request.getParameter("id");
		TestUtil util=new TestUtil();
		buffer.append("MS SQL Server 조회결과:    " );
		buffer.append(util.readDB3(id));
        return buffer.toString();
		
	}
	
	// DB초기화 
	@RequestMapping(value="/test/init_db.do", method = RequestMethod.GET)
	@ResponseBody
	public String initDB(HttpServletRequest request, HttpServletResponse response) throws Exception{
		StringBuffer buffer=new StringBuffer();
		String id = request.getParameter("id");
		if ( id.equals(request.getSession().getAttribute("userId")) && "admin".equals(id)) {
		     DBinit util=new DBinit();
		    // util.initMSSQLDB();
		     util.initMySQLDB();
		     buffer.append("DB 초기화 완료");
		} else {
			buffer.append("작업권한이 없습니다.");
		}
		request.getSession().invalidate();
		response.sendRedirect("/openeg/login.do");
        return buffer.toString();
		
	}
	
	
	// 인증 
	@RequestMapping(value="/test/authenticator_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testAuthenticator(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session){
		StringBuffer buffer=new StringBuffer();
		buffer.append("인증테스트");
        return buffer.toString();
		
	}

	// Secure Cookie
	@RequestMapping(value="/test/secure_cookie_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testSecureCookie(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		String type=request.getParameter("type");
		switch( Integer.parseInt(type)) {
		case 0:
			Cookie c=new Cookie("openeg",data);
			// 쿠키에 보안 설정 CODE 삽입
			c.setMaxAge(60*60*24*365);            // 쿠키 유지 기간 - 1년
			c.setPath("/"); 
			response.addCookie(c);
			buffer.append("openeg="+data +"  쿠키값 추가");
			break;
		case 1:
			Cookie[] cookies = request.getCookies();
			buffer.append("수신된 쿠키<br/>");
			for (int i = 0; i < cookies.length; i++) {
			    buffer.append(cookies[i].getName() +"=");
			    buffer.append(cookies[i].getValue() + "<br/>");
			}
			break;
		default:
			buffer.append("요청오류");
			break;
		}

        return buffer.toString();		
	}
	

	// HTTP 응답분할 
	@RequestMapping(value="/test/http_split_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testHttpSplit(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		System.out.println("수신된 데이터: "+data);
		response.setHeader("openeg", data);
//		Cookie cookie=new Cookie("data",data);
//		response.addCookie(cookie);
		buffer.append("HTTP 응답 분할 테스트: Cookie 값 확인");
	    return buffer.toString();
	}
	
	
	// 정수 오버플로우 
	@RequestMapping(value="/test/int_overflow_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testIntOverflow(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		System.out.println("수신데이터: "+data);
		int size=Integer.parseInt(data);
		String[] strings = new String[size+1];
        strings[0]="hello";
        buffer.append(strings[0]+"  int overflow test");    
	    return buffer.toString();
	}
	
	
	// 오픈리다이렉트
	@RequestMapping(value="/test/forward_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testForwarding(HttpServletRequest request,HttpServletResponse response){
		String url=request.getParameter("data");
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			return "redirect 테스트 오류";
		}
		return null;
	}
	
	    
	// 접근제어 
	@RequestMapping(value="/test/access_control_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testAccessControlPost(HttpServletRequest request,HttpServletResponse response,
	                                    HttpSession session){			
	 StringBuffer buffer=new StringBuffer(); 
	 MemberModel m=null;
	 String id=request.getParameter("id");
	 String name = request.getParameter("name");
	 String action=request.getParameter("action");
	
	 // 사용자정보 조회 요청인 경우 DB에서 해당 사용자 정보를 조회한 결과를 응답
	 if( "view".equals(action)) {
	   if( id != null && ! "".equals(id)) {
	       m=service.findMember(id);
	       if(m==null) {
		      buffer.append("등록되지 않은 사용자입니다. ");
	       } else {
	          // 조회한 사용자 정보는 세션에 저장
		     session.setAttribute("member", m);
		     buffer.append("사용자ID: "+m.getUserId()+"<br/>");
		     buffer.append("고객명: "+m.getUserName()+"<br/>");
		     buffer.append("전화번호: "+m.getPinNo()+"<br/>");
		     buffer.append("가입일자: "+m.getJoinDate()+"<br/>"); 
	       }
	   }else{
	       buffer.append("userId가 입력되지 않았습니다.");
	   }
	
	   // 실행결과 사용자에 대한 고객 정보 수정
	 } else if( "modify".equals(action)) {
	   m=(MemberModel)session.getAttribute("member");
	   if(m==null) {
	       buffer.append("사용자정보 조회부터 실행하세요");
	   } else {
	       m.setPinNo(name);
	       service.modifyMember(m);
	       session.setAttribute("member", m);
	         buffer.append(m.getUserId()+"님의 고객번호 수정을 완료하였습니다.<br/>");   
		     buffer.append("사용자ID: "+m.getUserId()+"<br/>");
		     buffer.append("고객명: "+m.getUserName()+"<br/>");
		     buffer.append("전화번호: "+m.getPinNo()+"<br/>");
		     buffer.append("가입일자: "+m.getJoinDate()+"<br/>"); 
	    }

	   // 실행결과 사용자에 대한 고객정보 삭제
	 }else if ( "delete".equals(action)) {
	      m=(MemberModel)session.getAttribute("member");
	      if(m==null) {
		      buffer.append("사용자정보 조회부터 실행하세요");
	      } else {				
		service.deleteMember(m);
		session.removeAttribute("member");
		buffer.append(m.getUserId()+"님의  정보를 삭제하였습니다.");
	      }
	      
	  // 새로운 고객 정보 등록
	 }else if ( "edit".equals(action)) {
	    if( id != null && ! "".equals(id)) {
	        m=new MemberModel(0,id,id,name,"","");
	        int result=service.addMember(m);       
	        if ( result == 3) {
	        	 m=service.findMember(id);
	        	 if ( m != null) {    
	        		 session.setAttribute("member", m);
			         buffer.append(m.getUserId()+" 사용자 등록을 완료하였습니다.<br/>");   
				     buffer.append("사용자ID: "+m.getUserId()+"<br/>");
				     buffer.append("고객명: "+m.getUserName()+"<br/>");
				     buffer.append("전화번호: "+m.getPinNo()+"<br/>");
				     buffer.append("가입일자: "+m.getJoinDate()+"<br/>"); 
	        	 } else {
	        		 buffer.append("사용자 등록 실패: "+result);
	        	 }
	        } else {
		        buffer.append("사용자 등록 실패: "+result);
	        }
	    }else {
	         buffer.append("userId가 입력되지 않았습니다.");
	    }
	 }	
	 return buffer.toString();
	}

	
	// 예외처리 
	@RequestMapping(value="/test/exception_test.do", method = RequestMethod.POST)
	@ResponseBody
	public String testException(HttpServletRequest request, HttpServletResponse response){
		StringBuffer buffer=new StringBuffer();
		String data=request.getParameter("data");
		String type=request.getParameter("type");
		System.out.println("*****: "+data+"-----"+type);
		switch( Integer.parseInt(type)) {
		// 에러메시지를 통한 정보노출
		case 0:		
			int i=100/TestUtil.getInt(data);
			buffer.append("처리결과: "+i);
			break;
	    // 에러처리부재
		case 1:
			  String level="S";
			  try {
			    if ( data.equals("admin")) {
			         level="S";
			    } else {
			         level="G";
			    }
			  }catch(Exception e){}

			  if ( level.equals("S"))  {
			      buffer.append("관리자 권한으로 작업을 수행합니다"); 
			  } else {
			      buffer.append("일반사용자 권한으로 작업을 수행합니다"); 
			  }
			  break;
        //부적절한 예외처리
		case 2:			
			char[] cbuf = new char[256];
		    FileReader fr;	
			FileWriter fw;
			try {
				fr = new FileReader(data);
				fw = new FileWriter(data+"_new");
				fw.write(new Date().getTime()+":  "+fr.read(cbuf));
			    fr.close();
			    fw.close();
			} catch(Exception e){
				buffer.append("요청하신 작업을 처리할 수 없습니다.");
			}
			break;
		default:
			buffer.append("요청오류");
			break;
		}

        return buffer.toString();		
	}	


}
