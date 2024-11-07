package com.sist.main;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.MusicDAO;
import com.sist.dao.MusicVO;

public class MainClass {

	public static void main(String[] args) {
		MainClass mc = new MainClass();
		MusicDAO dao = MusicDAO.newInstance();
		List<MusicVO> list = dao.musicAllDate();
		for(MusicVO vo : list) {
			System.out.println(vo.getTitle());
		}
	}
	public void genieData() {
		int k = 1;
		try {
			for(int i = 1 ; i <= 4 ; i++) {
				Document doc = Jsoup.connect("https://www.genie.co.kr/chart/top200?ditc=D&ymd=20240627&hh=15&rtm=Y&pg=" + i).get();
				Elements title = doc.select("table.list-wrap td.info a.title");
				Elements singer = doc.select("table.list-wrap td.info a.artist");
				Elements album = doc.select("table.list-wrap td.info a.albumtitle");
				Elements poster = doc.select("table.list-wrap a.cover img");
				Elements etc = doc.select("table.list-wrap span.rank");
				for(int j = 0 ; j < title.size() ; j++) {
					System.out.println(k++);
					String s = etc.get(j).text();
					String id = "";
					String state = "";
					if(s.equals("유지")) {
						id = "0";
						state = "유지";
					}
					else {
						id = s.replaceAll("[^0-9]", "");
						state = s.replaceAll("[^가-힣]", "");
					}
					
					MusicVO vo = new MusicVO();
					vo.setTitle(title.get(j).text());
					vo.setSinger(singer.get(j).text());
					vo.setAlbum(album.get(j).text());
					vo.setPoster(poster.get(j).attr("src"));
					vo.setIncrement(Integer.parseInt(id));
					vo.setState(state);
					MusicDAO dao = MusicDAO.newInstance();
					dao.musicInsert(vo);
				}
			}
				
		} catch (Exception e) {}
	}
}
