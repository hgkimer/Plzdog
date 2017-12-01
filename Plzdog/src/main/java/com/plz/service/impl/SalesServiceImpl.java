package com.plz.service.impl;

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
}
