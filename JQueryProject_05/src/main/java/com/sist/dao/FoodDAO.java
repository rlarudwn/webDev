package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<FoodVO> foodListData(int page, String type) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		int row = 20;
		int start = (page - 1) * row + 1;
		int end = start + row - 1;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		SqlSession session = ssf.openSession();
		list = session.selectList("foodListData", map);
		session.close();
		return list;
	}

	public static int foodTotalPage(String type) {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("foodTotalPage", type);
		session.close();
		return total;
	}
}
