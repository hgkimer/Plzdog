package com.plz.dao.impl;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.SalesDao;
import com.plzdog.vo.Sales;

@Repository
public class SalesDaoImpl implements SalesDao{
	@Autowired
	private SqlSessionTemplate session;
	
	public String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.salesMapper." + id; 
	}
	
	@Override
	public int insertSales(Sales sales) {
		return session.insert(makeSqlId("insertSales"), sales);
	}
	
	@Override
	public int updateSales(Sales sales) {
		return session.insert(makeSqlId("updateSales"), sales);
	}
	
	@Override
	public int deleteSales(int resId) {
		return session.insert(makeSqlId("deleteSales"), resId);
	}
}
