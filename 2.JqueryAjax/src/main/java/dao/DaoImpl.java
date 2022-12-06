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
	public ArrayList idList() {
		// TODO Auto-generated method stub
		String sql="select id from member";
		ArrayList<MemberVO> data= new ArrayList<MemberVO>();
		try {
			Connection conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				new MemberVO(rs.getString(1));
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
		return null;
	}

	@Override
	public void registerMember(MemberVO vo) {
		// TODO Auto-generated method stub
		
	}
	
}
