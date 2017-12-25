package com.plz.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.SalesDao;
import com.plz.service.SalesService;
import com.plzdog.vo.Sales;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesDao salesDao;
	
	@Override
	@Transactional
	public void insertSales(Sales sales) {
		salesDao.insertSales(sales);
	}
	
	@Override
	public void updateSales(Sales sales) {
		salesDao.updateSales(sales);
	}
	
	@Override
	public void deleteSales(int resId) {
		salesDao.deleteSales(resId);
	}
	
	@Override
	public List<Sales> findAllSales() {
		return salesDao.selectAllSales();
	}
	
	@Override
	public int findAllToTal() {
		return salesDao.selectAllToTal();
	}
	
	@Override
	public int findAllCommission() {
		return salesDao.selectAllCommission();
	}
	
	@Override
	public List<Sales> findSalesByDate(Date sDay, Date eDay) {
		HashMap<String, Date> map = new HashMap<>();
		map.put("sDay", sDay);
		map.put("eDay", eDay);
		return salesDao.selectSalesByDate(map);
	}
}
