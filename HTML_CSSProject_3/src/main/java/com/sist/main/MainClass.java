package com.sist.main;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.FoodDAO;
import com.sist.dao.FoodVO;

public class MainClass {

	public static void main(String[] args) {
		MainClass mc = new MainClass();
		mc.foodData();

	}
	public void foodData() {
		try {
			FoodDAO dao = FoodDAO.newInstance();
			for(int i=1;i<=347;i++) {
				Document doc = Jsoup.connect("https://www.menupan.com/restaurant/bestrest/bestrest.asp?page="+i+"&trec=8674&pt=rt").get();
				Elements link = doc.select("ul.list p.listName a");
				try {

					for(int j=0;j<link.size();j++) {
						String url = "https://www.menupan.com"+link.get(j).attr("href");
						doc = Jsoup.connect(url).get();
						Elements poster = doc.select("div.areaThumbnail img#rest_bigimg");
						Elements name = doc.select("div.areaBasic dl.restName > dd.name");
						Elements type = doc.select("div.areaBasic dl.restType dd.type");
						Elements phone = doc.select("div.areaBasic dl.restTel dd.tel1");
						Elements address1 = doc.select("div.areaBasic dl.restAdd > dd.add1");
						Elements address2 = doc.select("div.areaBasic dl.restAdd > dd.add2");
						Elements score = doc.select("div.areaBasic dl.restGrade span.total");
						Elements theme = doc.select("div.areaBasic dl.restTheme dd.Theme");
						Elements content = doc.select("div.infoTable div#info_ps_f");
						String addr = address1.text() + "\n" + address2.text();
						String temp = name.text();
						String name_ = temp.substring(0, temp.indexOf(' '));
						FoodVO vo = new FoodVO();
						System.out.println(name_);
						System.out.println(poster.attr("src"));
						System.out.println(type.text());
						System.out.println(phone.text());
						System.out.println(addr);
						System.out.println(score.text());
						System.out.println(theme.text());
						System.out.println(content.text());
						vo.setName(name_);
						vo.setPoster(poster.attr("src"));
						vo.setType(type.text());
						vo.setPhone(phone.text());
						vo.setAddress(address1.text());
						vo.setScore(Double.parseDouble(score.text()));
						vo.setTheme(theme.text());
						vo.setContent(content.text());
						dao.foodInsert(vo);
					}
				} catch (Exception e) {}
			}
			System.out.println("저장 완료");
		} catch (Exception e) {}
	}
}
