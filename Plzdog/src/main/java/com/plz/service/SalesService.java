package com.plz.service;

import java.util.Date;
import java.util.List;

import com.plzdog.vo.Sales;

public interface SalesService {
	
	void insertSales(Sales sales);
	
	void updateSales(Sales sales);
	
	void deleteSales(int resId);

	List<Sales> findSalesByDate(Date sDay, Date eDay);

	int findAllCommission();

	int findAllToTal();

	List<Sales> findAllSales();
	
}
