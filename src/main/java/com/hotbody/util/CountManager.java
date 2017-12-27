package com.hotbody.util;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class CountManager implements HttpSessionListener {
	private static int currentCount;
	private static long toDayCount, yesterDayCount, totalCount;
	
	public CountManager() {
		// 타이머(자정이 되면 오늘 인원을 어제 인원에 할당하고 오늘 인원은 0으로)
		TimerTask cron = new TimerTask() {
			public void run() {
				yesterDayCount = toDayCount;
				toDayCount = 0;
			}
		};

		Timer timer = new Timer();
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, 1);
		date.set(Calendar.HOUR, 0);
		date.set(Calendar.MINUTE, 0);
		date.set(Calendar.SECOND, 0);
		date.set(Calendar.MILLISECOND, 0);
		timer.schedule(cron, date.getTime(), 1000 * 60 * 60 * 24);
	}
	
	public static int getCurrentCount() {
		// 현재 접속자수
		return currentCount;
	}
	public static long getToDayCount() {
		// 오늘 접속자수
		return toDayCount;
	}
	public static long getYesterDayCount() {
		// 어제 접속자수
		return yesterDayCount;
	}
	public static long getTotalCount() {
		// 전체 접속자수
		return totalCount;
	}
	
	public static void init(long toDay, long yesterDay, long total) {
		toDayCount=toDay;
		yesterDayCount=yesterDay;
		totalCount=total;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent evt) {
		// HttpSession session=evt.getSession();
		// session.getServletContext().log(	session.getId()+" : 세션생성...");
		
		synchronized (this) {
			currentCount++;
			toDayCount++;
			totalCount++;
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent evt) {
		// 세션이 소멸될때
		// HttpSession session=evt.getSession();
		
		synchronized (this) {
			currentCount--;
			if(currentCount<0)
				currentCount=0;
		}
		
		// session.getServletContext().log(	session.getId()+" : 세션소멸...");
	}
}
