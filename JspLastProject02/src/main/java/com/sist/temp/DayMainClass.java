package com.sist.temp;

import java.util.*;

import com.sist.dao.DayDAO;

public class DayMainClass {
	public static void main(String[] args) {
		DayMainClass dmc = new DayMainClass();
		// dmc.dayRandom();
		DayDAO dao = new DayDAO();
		/*for(int i=1;i<=31;i++) {
			dao.timeInsert(i, dmc.timeRandom());
		}
		System.out.println("저장완료");*/
		List<Integer> list=dao.foodGetFno();
		for(int fno:list) {
			dao.foodRdayUpdate(fno, dmc.dayRandom());
		}
		System.out.println("수정 완료");
	}

	public String timeRandom() {
		int times[] = new int[(int) (Math.random() * 10) + 5];
		String str = "";
		for (int i = 0; i < times.length; i++) {
			times[i]=(int)(Math.random()*20)+1;
			for (int j = 0; j < i; j++) {
				if (times[j] == times[i]) {
					i--;
					break;
				}
			}
		}
		Arrays.sort(times);
		System.out.println(Arrays.toString(times));
		for(int i:times) {
			str=str+i+",";
			System.out.println(str);
		}
		str=str.substring(0, str.lastIndexOf(","));
		System.out.println(str);
		return str;
	}

	public String dayRandom() {
		int[] days = new int[(int) (Math.random() * 10) + 10];
		String str = "";
		int su = 0;
		boolean bCheck = false;
		for (int i = 0; i < days.length; i++) {
			bCheck = true;
			while (bCheck) {
				su = (int) (Math.random() * 31 + 1);
				bCheck = false;
				for (int j = 0; j < i; j++) {
					if (days[j] == su) {
						bCheck = true;
						break;
					}
				}
			}
			days[i] = su;
		}
		Arrays.sort(days);
		System.out.println(Arrays.toString(days));
		for(int i: days) {
			str=str+i+",";
		}
		str=str.substring(0, str.lastIndexOf(","));
		System.out.println(str);
		return str;
	}
}
