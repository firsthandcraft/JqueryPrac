package member;

import java.util.ArrayList;

public class MemberService {
	
	private MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}

	//회원가입
	public void join(MemberVo vo) {
		dao.insert(vo);
	}

	public MemberVo getMember(String id) {
		return dao.select(id);		
	}

	public void editMember(MemberVo vo) {
		dao.update(vo);
	}

	public void delMember(String id) {	
		dao.delete(id);
	}
	
	public ArrayList<MemberVo> getAll(){
		return dao.selectAll();
	}
}
