package service;

import java.util.ArrayList;

import model.MemberVO;

public interface Service {
	ArrayList<MemberVO> idList();
	MemberVO findMember(String id);
	void registerMember(MemberVO vo);
}
