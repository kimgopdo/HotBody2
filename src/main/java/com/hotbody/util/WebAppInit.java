package com.hotbody.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class WebAppInit implements ServletContextListener {
	private String fileName = "/WEB-INF/count.txt";

	@Override
	public void contextInitialized(ServletContextEvent evt) {
		// 웹 어플리케이션 시작시
		fileName = evt.getServletContext().getRealPath(fileName);
		System.out.println(fileName);
		loadFile();
	}

	@Override
	public void contextDestroyed(ServletContextEvent evt) {
		// 웹 어플리케이션 종료시
		saveFile();
	}
	
	protected void loadFile() {
		try {
			long toDay=0, yesterDay=0, total=0;
			
			File file = new File(fileName);
			if (!file.exists()) {
				return;
			}

			BufferedReader br = new BufferedReader(new FileReader(fileName));
			String str;
			
			str = br.readLine();
			if(str!=null) {
				String[] result = str.split(":");
				if(result.length==3) {
					toDay=Long.parseLong(result[0].trim());
					yesterDay=Long.parseLong(result[1].trim());
					total=Long.parseLong(result[2].trim());
				}
			}
			
			CountManager.init(toDay, yesterDay, total);

			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void saveFile() {
		try {
			long toDay, yesterDay, total;
			
			toDay=CountManager.getToDayCount();
			yesterDay=CountManager.getYesterDayCount();
			total=CountManager.getTotalCount();
			
			String s=toDay+":"+yesterDay+":"+total;

			PrintWriter pw = new PrintWriter(new FileWriter(fileName));

			pw.println(s);
			
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
