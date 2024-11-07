package com.sist.main;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.ArtistVO;
import com.sist.dao.MusicDAO;

//
public class Main {

	public static void main(String[] args) {
		MusicDAO dao = MusicDAO.newInstance();
		/*try {
			for (int i = 1990; i <= 2023; i++) {
				for (int j = 1; j <= 2; j++) {
					Document doc = Jsoup.connect("https://www.genie.co.kr/chart/musicHistory?year=" + i + "&category=0&pg=" + j)
							.get();
					Elements url_ = doc.select("tr.list a.cover");
					for (int k = 0; k < url_.size(); k++) {
						String url = url_.get(k).attr("onclick").toString();
						url = url.substring(url.indexOf("'") + 1, url.lastIndexOf("'"));
						doc = Jsoup.connect("https://www.genie.co.kr/detail/albumInfo?axnm=" + url).get();
						Elements url_2 = doc.select("tr.list");
						for (int l = 0; l < url_2.size(); l++) {
							String url2 = url_2.get(l).attr("songid");
							doc = Jsoup.connect("https://www.genie.co.kr/detail/songInfo?xgnm=" + url2).get();
							Elements title_= doc.select("div.song-main-infos div.info-zone h2.name");
							String title = title_.toString();
							title=title.substring(title.indexOf(">")+1, title.lastIndexOf("<"));
							System.out.println(title);
						}
						break;
					}
				}
			}
		} catch (IOException e) {
		}*/
		/*try {
			Document doc=Jsoup.connect("https://www.yes24.com//Mall/Main/Book/001?CategoryNumber=001").get();
			Elements url_=doc.select("div.mBestOlArea div.optTitDl ul li a");
			Elements url2=doc.select("dd.qCatePos02 a");
			for(int i=0;i<15;i++) {
				String url=url_.get(i).attr("href");
				url=url.substring(url.indexOf("'")+1, url.lastIndexOf("'"));
				url="https://www.yes24.com/Product/Category/BestSeller?pageNumber=1&pageSize=24&categoryNumber="+url;
				System.out.println(url);
			}
		} catch (Exception e) {}*/
		try {
			int index = 0;
			for (int i = 1980; i <= 2023; i++) {
				for (int j = 1; j <= 2; j++) {
					Document doc = Jsoup.connect("https://www.genie.co.kr/chart/musicHistory?year=" + i + "&category=0&pg=" + j)
							.get();
					Elements url_ = doc.select("tr.list a.cover");
					for (int k = 0; k < url_.size(); k++) {
						String url = url_.get(k).attr("onclick").toString();
						url = url.substring(url.indexOf("'") + 1, url.lastIndexOf("'"));
						doc = Jsoup.connect("https://www.genie.co.kr/detail/albumInfo?axnm=" + url).get();
						Elements url_2 = doc.select("tr.list");
						for (int l = 0; l < url_2.size(); l++) {
							String url2 = url_2.get(l).attr("songid");
							doc = Jsoup.connect("https://www.genie.co.kr/detail/songInfo?xgnm=" + url2).get();
							Elements artist_ = doc.select("div#wrap-body div#body-content h2.page-top-this a");
							Elements lylicist_ = doc.select("span.artist_etc_layer li a");
							String artist = artist_.attr("onclick");
							artist = artist.substring(artist.indexOf("'") + 1, artist.lastIndexOf("'"));
							doc = Jsoup.connect("https://www.genie.co.kr/detail/artistInfo?xxnm=" + artist).get();
							artistInsert(doc);
							for (int m = 0; m <= lylicist_.size(); m++) {
								String lylicist = lylicist_.attr("onclick");
								lylicist = lylicist.substring(lylicist.indexOf("'") + 1, lylicist.lastIndexOf("'"));
								doc = Jsoup.connect("https://www.genie.co.kr/detail/artistInfo?xxnm=" + lylicist).get();
								artistInsert(doc);
							}
						}
					}
				}
			}
		} catch (Exception e) {
		}
	}

	public static void artistInsert(Document doc) {
		MusicDAO dao = MusicDAO.newInstance();
		ArtistVO vo = new ArtistVO();
		Elements name = doc.select("div.info-zone h2.name");
		Elements post = doc.select("div.artist-main-infos div.photo-zone img");
		Elements etc = doc.select("div.info-zone ul.info-data li span.value");
		Elements content = doc.select("div.detail-descript div.desc-cont div.db-insert span");
		vo.setName(name.text());
		vo.setPoster(post.attr("src"));
		System.out.println(name.text());
		System.out.println(post.attr("src"));
		for (int i = 0; i < etc.size(); i++) {
			if ((i == 2 || i == 1) && etc.get(i).text().length() < 4)
				System.out.println("정보없음");
			else {
				if (i == 2) {
					String song = etc.get(i).text();
					String year = song.substring(song.indexOf("/") + 2);
					song = song.substring(0, song.indexOf(" "));
					vo.setDebutsong(song);
					vo.setDeutyear(year);
					System.out.println(song);
					System.out.println(year);
				} else if (i == 0) {
					vo.setType(etc.get(i).text());
					System.out.println(etc.get(i).text());
					boolean bCheck = dao.artistIsIn(name.text(), etc.get(i).text());
					if (bCheck) {
						System.out.println("이미 존재하는 데이터");
						return;
					}
				} else if (i == 3) {
					vo.setNation(etc.get(i).text());
					System.out.println(etc.get(i).text());
				} else if (i == 1) {
					vo.setActive(etc.get(i).text());
					System.out.println(etc.get(i).text());
				}
			}
		}
		vo.setContent(content.text());
		System.out.println(content.text());
		dao.artistInsert(vo);
		System.out.println("=========================================================");
	}
}
