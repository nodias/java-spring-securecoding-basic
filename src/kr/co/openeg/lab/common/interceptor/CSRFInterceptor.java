//CSRFInterceptor.java 인터셉터에 넣기
//dispatcher-servlet.xml 인터셉터에 등록해야 함

package kr.co.openeg.lab.common.interceptor;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class CSRFInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
		                                  HttpServletResponse response, Object handler) throws Exception {
        
		// POST 방식의 요청에 대해서만 인터셉트를 적용해야 함
		if ( ! request.getMethod().equalsIgnoreCase("post")) {
			return true;
		} else {
			if( request instanceof MultipartHttpServletRequest) {
				Enumeration<String> names =
					                request.getParameterNames();
				while( names.hasMoreElements()) {
					String param=names.nextElement();

//파라메터로 전달된 csrf 토큰값과 세션에 저장된 csrf토큰값을 비교하여 일치하는 경우에만 요청을 처리한다.
	if( param.equals("CSRF")) {                     
					    String value=request.getParameter(param);
					    if ( value != null &&  value.equals(request.getSession().getAttribute("CSRF_TOKEN"))) {
							 return true;
					    } 
				    }
			    }
			
			}
		}	
		// 유효하지 않은요청(CSRF_TOKEN이 없거나 틀린경우) 
		response.sendRedirect("list.do");
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
}


