package com.yum.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(description = "한글 인코딩 기능을 구현", filterName= "firstFilter")
public class EncoderFilter implements Filter {
	ServletContext context; //서블릿
	
	public EncoderFilter() {
		
	}

	/** 필터가 수행될 때 자동 호출되는 초기 매서드 **/
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		context = filterConfig.getServletContext();
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//여기서 실제 필터링
		if(request.getCharacterEncoding()==null) {
			request.setCharacterEncoding("utf-8");
		}
		
		//경로 확인용 코드
		// 애플리케이션의 컨텍스트 이름
//		String context = ((HttpServletRequest)request).getContextPath();

		
		/** ↑ request(요청)관련 작업**/
		chain.doFilter(request, response); //
		/** ↓ response(응답)관련 작업 **/

//		response.setContentType("text/html;charset=utf-8"); 이건 servlet에서 내보내기 잘 안하니까 안써도 됨
		
	}

	/** encoding 소멸 **/
	@Override
	public void destroy() {
		
	}
}
