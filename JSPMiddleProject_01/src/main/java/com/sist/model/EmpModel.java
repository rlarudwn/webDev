package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.vo.*;

public class EmpModel {
	public void empListData(HttpServletRequest request) {
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();
		request.setAttribute("emp", list);
	}
}
