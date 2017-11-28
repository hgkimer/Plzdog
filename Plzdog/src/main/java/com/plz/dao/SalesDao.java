package com.plz.dao;

import java.util.Date;
import java.util.List;

import com.plzdog.vo.Sales;

public interface SalesDao {

	/**
	 * 매개변수로 받은 sales 정보를 추가하는 메소드
	 * @param sales
	 * @return
	 */
	int insertSales(Sales sales);
	
	/**
	 * 매개변수로 받은 sales 정보에서 resId일치하는 sales정보를 수정하는 메소드
	 * @param sales
	 * @return
	 */
	int updateSales(Sales sales);
	
	/**
	 * 매개변수로 받은 resId로 sales 정보를 삭제하는 메소드
	 * @param resId
	 * @return
	 */
	int deleteSales(int resId);

}
