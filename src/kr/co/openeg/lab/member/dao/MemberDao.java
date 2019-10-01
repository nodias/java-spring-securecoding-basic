package kr.co.openeg.lab.member.dao;

import kr.co.openeg.lab.member.model.MemberModel;
;
public interface MemberDao {
	void insertMember(MemberModel memberModel);
	void deleteMember(MemberModel memberModel);
	void updateMember(MemberModel memberModel);
	MemberModel selectMember(String userId);
	
	
}
