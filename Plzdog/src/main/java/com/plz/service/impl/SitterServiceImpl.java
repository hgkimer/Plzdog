package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plz.dao.SitterDao;
import com.plz.dao.SkillDao;
import com.plz.service.SitterService;
import com.plzdog.vo.Sitter;
import com.plzdog.vo.Skill;

@Service
public class SitterServiceImpl implements SitterService {

	@Autowired
	private SitterDao sitterDao;
	@Autowired
	private SkillDao skillDao;
	
	@Override
	@Transactional
	public void insertSitter(Sitter sitter, List<String> skillList) {
		sitterDao.insertSitter(sitter);
		System.out.println(sitter);
		//시터가 입력한 보유 기술과 환경에 대한 리스트를 저장하는 insert
		for(String s : skillList) {
			Skill skill = new Skill(sitter.getEmail(), s);
			System.out.println(s);
			skillDao.insertSkill(skill);
		}
		
	}

}
