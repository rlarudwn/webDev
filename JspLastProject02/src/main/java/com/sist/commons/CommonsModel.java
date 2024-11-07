package com.sist.commons;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

public class CommonsModel {
	public static void footerPrint(HttpServletRequest request) {
		List<NoticeVO> nList = NoticeDAO.noticeTop5Data();
		request.setAttribute("noticeList", nList);
	}
}
