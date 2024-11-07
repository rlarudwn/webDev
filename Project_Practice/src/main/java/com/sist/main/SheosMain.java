package com.sist.main;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.ShoesDAO;
import com.sist.dao.ShoesVO;

public class SheosMain {

	public static void main(String[] args) {
		ShoesDAO dao = ShoesDAO.newInstance();
		try {
			for(int i = 1 ; i <= 27 ; i++) {
				Document doc = Jsoup.connect("https://www.shoemarker.co.kr/ASP/Product/ProductList.asp?SearchType=C&SCode1=01&SCode2=&SCode3=&SSort=&Page="+i).get();
				Elements link_ = doc.select("div.result-list div.wrap-product-list div.ly-name a");
				System.out.println(link_.size());
				for(int j = 0 ; j < link_.size() ; j++) {
					ShoesVO vo = new ShoesVO();
					String link = "https://www.shoemarker.co.kr" + link_.get(j).attr("href");
					doc = Jsoup.connect(link).get();
					Elements name = doc.select("div.left div.title-wrap span.title");
					Elements brand = doc.select("div.left div.title-wrap span.brand");
					Elements code = doc.select("div.left div.title-wrap span.product-code span");
					Elements poster = doc.select("div.left div.img-wrap div.ProductImage img");
					Elements price = doc.select("div.right li:first-child div.title-wrap span.price strong");
					vo.setName(name.text());
					vo.setBrand(brand.text());
					vo.setCode(code.text());
					vo.setPoster(poster.attr("src"));
					vo.setPrice(price.text());
					dao.shoesInsertData(vo);
				}
			}
		} catch (IOException e) {
			System.out.println("error");
			e.printStackTrace();
		}
	}

}
