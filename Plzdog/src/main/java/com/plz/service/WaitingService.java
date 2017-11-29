package com.plz.service;

import java.util.List;

public interface WaitingService {

	void insertWaiting(String email);
	
	List<String> selectAllWaiting();
	
	String selectWaitingByEmail(String email);
	
	void deleteWaiting(String email);
}
