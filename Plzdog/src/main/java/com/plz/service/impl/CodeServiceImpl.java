package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.CodeDao;
import com.plz.service.CodeService;
import com.plzdog.vo.Code;
@Repository
public class CodeServiceImpl implements CodeService{
	@Autowired
	private CodeDao dao;
	@Override
	public Code findCodeByCode(String code) {
		return dao.selectCodeByCode(code);
	}

	@Override
	public List<Code> findCodeByCategory(String category) {
		return dao.selectCodeByCategory(category);
	}
	/*#######################################################################
	 * 시간되면 관리자 기능으로 넣을거임, 시간없음 그냥 없앨거니까 그냥 두세여
	 *#######################################################################  
	 */
}
