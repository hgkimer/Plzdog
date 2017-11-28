package com.plz.dao;

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
	int deleteSales(String resId);
	
	/**
	 * 금액의 합계를 구하는 메소드
	 * @param sales
	 * @return
	 */
	Sales selectAllToTal(int sales);
	
	/**
	 * 수수료의 합계를 구하는 메소드
	 * @param sales
	 * @return
	 */
	Sales selectAllCommission(int sales);
	
	/**
	 * Sales 테이블내의 모든 내용을 조회하는 메소드
	 * @param sales
	 * @return
	 */
	Sales selectAllSales(Sales sales);
}
