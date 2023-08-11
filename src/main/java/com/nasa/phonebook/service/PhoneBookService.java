package com.nasa.phonebook.service;

import com.nasa.phonebook.dao.PhoneBookDao;

public class PhoneBookService {
	PhoneBookDao phonebookDao = new PhoneBookDao();
	
	public int idCheck(String loginid) throws Exception {
		int cnt=1;
		cnt = phonebookDao.idCheck(loginid);
		System.out.println(cnt);
		return cnt;
	}
}
