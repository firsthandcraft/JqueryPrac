package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.MemberVO;

public class DaoImpl implements Dao {
	public PreparedStatement pstmt=null;
	public ResultSet rs=null;
	
	private DBConnect db;
	public DaoImpl() {
		db=DBConnect.getInstance();
	}
	@Override
	public ArrayList<MemberVO> idList() {
		// TODO Auto-generated method stub
		String sql="select id from member";
		ArrayList<MemberVO> data= new ArrayList<MemberVO>();
		try {
			Connection conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				data.add(new MemberVO(rs.getString(1)));
			}
			rs.close();
			pstmt.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println(data);
		return data;
	}

	@Override
	public MemberVO findMember(String id) {
		// TODO Auto-generated method stub
		String sql="select * from member where id=?";
		try {
			Connection conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}
			rs.close();
			pstmt.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void registerMember(MemberVO vo) {
		// TODO Auto-generated method stub
		String sql="insert into member values(?,?,?,?)";
		try {
			Connection conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getAddress());
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
}
