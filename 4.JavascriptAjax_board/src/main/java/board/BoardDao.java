package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import dbconn.DBConnect;
import member.MemberVo;

public class BoardDao {
	private DBConnect dbconn;
	private ResultSet rs= null;
	private PreparedStatement pstmt=null;
	private Connection conn= null;
	public void discon() {
		try {
			if(rs != null){
				rs.close();
			}
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public BoardDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(BoardVo vo) {
		String sql="insert into board values(seq_board.nextval,?,sysdate,?,?,?)";
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getWriter());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setInt(4,vo.getParent_num());
			pstmt.executeUpdate();
		} catch(SQLIntegrityConstraintViolationException e) {
			System.out.println("중복된 아이디, 다시 입력하세요.");
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}

	public ArrayList<BoardVo> selectAll() {
		String sql="select * from board where parent_num=0 order by num desc";
		ArrayList<BoardVo> lists =new ArrayList<BoardVo>();
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				lists.add(new BoardVo(rs.getInt(1)
						,rs.getString(2),rs.getDate(3),rs.getString(4),rs.getString(5),rs.getInt(6)));				
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return lists;
	}

	// 글번호로 찾아서 title, content 수정
	public void update(BoardVo vo) {
		String sql="update board set title=?,content=? where num=?";
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getTitle());
			pstmt.setString(2,vo.getContent());
			pstmt.setInt(3,vo.getNum());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}

	// 페이징. start는 rownum 시작값, end는 rownum 끝값
	public ArrayList<BoardVo> selectAllPaging(int start, int end) {
		
		return null;
	}

	public int getCnt() {
		String sql="select cont(*) from board";
		//sql - count: https://extbrain.tistory.com/54
		try {
			pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public BoardVo select(int num) {
		String sql="select * from board where num=?";
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return new BoardVo(rs.getInt(1),rs.getString(2),rs.getDate(3),
						rs.getString(4),rs.getString(5),rs.getInt(6));				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return null;
	}
	
	public ArrayList<BoardVo> selectByWriter(String writer) {
		String sql="select * from board where writer=? and parent_num=0 order by num desc";
		ArrayList<BoardVo> lists= new ArrayList<BoardVo>();
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,writer);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				lists.add(new BoardVo(rs.getInt(1),rs.getString(2),rs.getDate(3),
						rs.getString(4),rs.getString(5),rs.getInt(6))		
			);}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return lists;
	}
	
	public ArrayList<BoardVo> selectByTitle(String title) {
		String sql="select * from board where title like ? and parent_num=0 order by num desc";
		ArrayList<BoardVo> lists= new ArrayList<BoardVo>();
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+title+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				lists.add(new BoardVo(rs.getInt(1),rs.getString(2),rs.getDate(3),
						rs.getString(4),rs.getString(5),rs.getInt(6))		
			);}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return lists;
	}
	
	public void delete(int num) {
		String sql="delete from board where id=?";
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}
	
	//댓글 검색
	public ArrayList<BoardVo> selectByParent(int parent_num) {
		String sql="select * from board where parent_num=? order by num desc";
		ArrayList<BoardVo> list= new ArrayList<BoardVo>();
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, parent_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BoardVo(rs.getInt(1),rs.getString(2),rs.getDate(3),
						rs.getString(4),rs.getString(5),rs.getInt(6))		
			);}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return list;
	}
}
