/*
	MVC
		HTML / Java 분리 과정
		분업 / 확장성 / 재사용
		실제 실무에서 사용
			단점 : 소스가 복잡 : Controller에 의존하는 경향
		Spring	=> MVC Project	=> MVC만 사용 가능
		 
		model : 자바와 관련된 모든 소스
			=> DAO, VO, Service, Manager
		view : JSP / HTML / CSS / JavaScript	=> 태그형 프로그램 중심
			=> <% %> / <%= %> : 사용하지 않음
			=> <c:forEach> <c:if> ${}
			화면 출력	=> model에서 전송된 데이터 출력
		controller : model과 view를 연결
		
		실행 과정
		
		2. Controller가 요청값을 받는다
			요청값을 받음
				request, response 전송
			해당 model을 찾음
				요청에 대한 처리	=> 결과값 request에 저장
			출력할 jsp를 찾음
			JSP	=> request를 전송
				forwrad()	=> request를 이용
					모든 화면은 Controller다	=> .do(서블릿)
					JSP화면만 갱신
			JSP에 화면을 출력, Controller에 덮어쓴다
			시작과 끝은 Controller	(.do ~ .do)	=> 모든  URL주소는 .do	=> 서블릿 찾을 때 사용
 */
package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class ListModel {
	public String execute(HttpServletRequest request) {
		String msg="게시판 목록";
		request.setAttribute("msg", msg);
		return "view/list.jsp";
	}
}
