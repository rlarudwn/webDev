package com.sist.manager;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;


import com.sist.dao.MovieVO;

public class MovieManager {
	public static void main(String[] args) {
		MovieManager m=new MovieManager();
		m.movieListData(1);
	}
	public List<MovieVO> movieListData(int type){
		String[] url= {"",
				"https://www.kobis.or.kr/kobis/business/main/searchMainDailyBoxOffice.do",
				"https://www.kobis.or.kr/kobis/business/main/searchMainRealTicket.do",
				"https://www.kobis.or.kr/kobis/business/main/searchMainDailySeatTicket.do"
		};
		List<MovieVO> list=new ArrayList<MovieVO>();
		try {
			Document doc=Jsoup.connect(url[type]).get();
			String json=doc.toString();
			json=json.substring(json.indexOf("["), json.lastIndexOf("]")+1);
			JSONParser jp=new JSONParser();
			JSONArray arr=(JSONArray)jp.parse(json);
			System.out.println(arr);
			for(int i=0; i<arr.size();i++) {
				JSONObject obj=(JSONObject)arr.get(i);
				MovieVO vo=new MovieVO();
				String poster=(String)obj.get("thumbUrl");
				vo.setPoster("https://www.kobis.or.kr"+poster);
				String title=(String)obj.get("movieNm");
				vo.setTitle(title);
				String director=(String)obj.get("director");
				String genre=(String)obj.get("genre");
				String grade=(String)obj.get("watchGradeNm");
				vo.setDirector(director);
				vo.setGenre(genre);
				vo.setGrade(grade);
				vo.setRank(i+1);
				list.add(vo);
			}
		} catch (Exception e) {
		}
		return list;
	}
}
