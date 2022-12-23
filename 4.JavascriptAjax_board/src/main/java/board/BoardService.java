package board;

import java.util.ArrayList;
import java.util.Scanner;

import member.MemberService;

public class BoardService {
	private BoardDao dao;

	public BoardService() {
		dao = new BoardDao();
	}

	public void addBoard(BoardVo vo) {
		dao.insert(vo);
	}
	
	public BoardVo getBoard(int num) {
		return dao.select(num);
	}
	
	public ArrayList<BoardVo> getAll(){
		return dao.selectAll();
	}
	
	public ArrayList<BoardVo> getByWriter(String writer){
		return dao.selectByWriter(writer);
	}
	
	public ArrayList<BoardVo> getByTitle(String title){
		return dao.selectByTitle(title);
	}
	
	public void editBoard(BoardVo vo) {
		dao.update(vo);
	}
	
	public void delBoard(int num) {
		dao.delete(num);
	}
	
	//댓글 검색
	public ArrayList<BoardVo> getByParent(int parent_num){
		return dao.selectByParent(parent_num);
	}
}
