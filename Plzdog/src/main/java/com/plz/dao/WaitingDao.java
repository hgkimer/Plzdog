package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Waiting;

public interface WaitingDao {

	int insertWaiting(String email);
	
	List<String> selectAllWaiting();
	
	String selectWaitingByEmail(String email);

	int deleteWaiting(String email);
}
