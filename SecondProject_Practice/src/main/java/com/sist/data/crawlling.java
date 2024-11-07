package com.sist.data;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class crawlling {
	public static void main(String[] args) {
		try {
		//	Document doc = Jsoup.connect("https://www.tripadvisor.co.kr/Attractions-g294196-Activities-South_Korea.html").get();
			Document doc2 = Jsoup.connect("https://www.tripadvisor.co.kr/Attractions-g294196-Activities-South_Korea.html").timeout(30000).userAgent("Chrome").get();
			Elements link = doc2.select("div.WfLVk ul.TAcAQ li.Mkrpq a");
			System.out.println(link.get(1).attr("href"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
