package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Skill;

public interface SkillDao {
	/**
	 * 매개변수로 받은 skill 정보를 등록하는 메소드.
	 * @param skill
	 * @return
	 */
	int insertSkill(Skill skill);
	/**
	 * 매개변수로 받은 Email로 해당 Email이 가진 스킬들을 모두 삭제하는 메소드
	 * @param email
	 * @return
	 */
	int deleteSkill(String email);
	/**
	 * 매개변수로 받은 email에 해당하는 Skill들(0~N개)를 조회하는 메소드
	 *  + code 조인
	 *  + 이메일을 입력하면 바로 Code에 해당하는 code_name들이 조회 되게 함.
	 * 	+ String으로 나오니까 바로 스코프에 저장하고 뿌리면 될 듯?
	 * @param email
	 * @return
	 */
	List<Skill> selectSkillByEmail(String email);
	
}
