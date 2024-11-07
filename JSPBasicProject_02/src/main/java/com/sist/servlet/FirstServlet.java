package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
	서블릿	= URL요청	=> 톰캣에 의해 실행
		자바로 만들어져 있음
		
	init() : 초기화	=> 생성자와 비슷한 역할
	doGet() / doPost()	=> 사용자에게 요청 처리에 대한 결과를 보여준다(HTML)
		사용자 요청시 한개만 실행	=> GET / POST
			get : 화면에 출력	=> 디폴트값임
			post : 사용자 요청값 받아 처리
			통합	=> service()
		destroy() : 메모리 해제
					새로고침, 파일 이동
						=> 호출시 마다 new / delete
						
	사용자가 요청 데이터 전송시
		톰캣에 의해 한군데 모아서 전송	=> request	=> 사용자 브라우저 정보를 가지고 있음 (IP/PORT)
		브라우저에 전송	=> response	=> HTML을 브라우저로 보내준다
	코딩 방식
		변환 코드 지정
			HTML / XML / JSON
				reponse.setContentType("text/html")
				reponse.setContentType("text/xml")
				reponse.setContentType("text/plain")
		클라이언트 브라우저에서 읽어 갈 수 있게 메모리에 저장
			PrintWriter out = response.getWriter()
			
			out.write("<html>")
		데이터베이스 연결
		
*/
/**
 * Servlet implementation class FirstServlet
 */
@WebServlet("/FirstServlet")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String msg;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstServlet() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		msg = "Hello Servlet";
		System.out.println("Init() Call");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("destroy() : 서블릿 메모리 해제");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();		// 브라우저 확인	=> response안에 사용자 IP를 갖고있음
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>ip:"+request.getRemoteAddr()+"</h3>");
		out.write("<h3>요청내용"+request.getRequestURL()+"</h3>");
		out.write("<h3>실제요청내용"+request.getRequestURI()+"</h3>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
