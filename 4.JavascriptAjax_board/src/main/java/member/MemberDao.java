package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class MemberDao {
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

	public MemberDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(MemberVo vo) {
		String sql="insert into member values(?,?,?,?,?)";
		conn= dbconn.conn();
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getId());
			pstmt.setString(2,vo.getPwd());
			pstmt.setString(3,vo.getName());
			pstmt.setString(4,vo.getEmail());
			pstmt.setString(5,vo.getType());
			pstmt.executeUpdate();
		} catch(SQLIntegrityConstraintViolationException e) {
			System.out.println("중복된 아이디, 다시 입력하세요.");
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}

	public MemberVo select(String id) {
		String sql="select * from member where id=?";
		MemberVo vo = null;
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo= new MemberVo(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return vo;
	}

	// pwd 수정
	public void update(MemberVo vo) {
		String sql="update member set pwd=? where id=?";
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPwd());
			pstmt.setString(2,vo.getId());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}

	public void delete(String id) {
		String sql="delete from member where id=?";
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}
	public ArrayList<MemberVo> selectAll() {
		String sql="select * from member";
		ArrayList<MemberVo> vos =new ArrayList<MemberVo>();
		try {
			conn= dbconn.conn();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vos.add(new MemberVo(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));				
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return vos;
	}

	
}
