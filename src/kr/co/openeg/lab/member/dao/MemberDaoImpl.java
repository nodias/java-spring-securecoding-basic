package kr.co.openeg.lab.member.dao;

import kr.co.openeg.lab.member.dao.MemberDao;
import kr.co.openeg.lab.member.model.MemberModel;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;


public class MemberDaoImpl extends SqlMapClientDaoSupport implements MemberDao{

	@Override
	public void insertMember(MemberModel memberModel) {
		getSqlMapClientTemplate().insert("member.addMember", memberModel);
	}

	@Override
	public MemberModel selectMember(String userId) {
		return (MemberModel) getSqlMapClientTemplate().queryForObject("member.findByUserId", userId);
	}

	@Override
	public void deleteMember(MemberModel memberModel) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().delete("member.deleteMember", memberModel);
	}

	@Override
	public void updateMember(MemberModel memberModel) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().update("member.updateMember", memberModel);
	}

}
