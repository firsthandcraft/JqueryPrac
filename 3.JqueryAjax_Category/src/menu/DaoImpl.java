package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.Img;

public class DaoImpl implements Dao {
	private DBConnect db;
	private ResultSet rs=null;
	
	
	public DaoImpl() {
		db = DBConnect.getInstance();
	}
	@Override
	public ArrayList<Cate> selectAllCate1() {
		// TODO Auto-generated method stub
		String sql="select * from cate1";
		ArrayList<Cate> list = new ArrayList<Cate>();
		Connection conn=db.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Cate(rs.getInt(1),rs.getString(2),0));
			}
			
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public ArrayList<Cate> selectCate2(int pNum) {
		// TODO Auto-generated method stub
		String sql="select * from cate2 where parent_num=?";
		ArrayList<Cate> list = new ArrayList<Cate>();
		Connection conn=db.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Cate(rs.getInt(1),rs.getString(2),0));
			}
			
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public ArrayList<Cate> selectCate3(int pNum) {
		// TODO Auto-generated method stub
		String sql="select * from cate3 where parent_num=?";
		ArrayList<Cate> list = new ArrayList<Cate>();
		Connection conn=db.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Cate(rs.getInt(1),rs.getString(2),0));
			}
			
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

}
