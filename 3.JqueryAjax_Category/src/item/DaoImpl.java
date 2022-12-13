package item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import menu.Cate;

public class DaoImpl implements Dao {
	private DBConnect db;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	public DaoImpl() {
		db = DBConnect.getInstance();
	}
	@Override
	public void insert(Item i) {
		// TODO Auto-generated method stub
		Connection conn=db.getConnection();
		String sql="insert into item values(seq_item.nextval,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,i.getTitle());
			pstmt.setInt(2, i.getPrice());
			pstmt.setString(3,i.getImg());
			pstmt.setInt(4, i.getC1());
			pstmt.setInt(5, i.getC2());
			pstmt.setInt(6, i.getC3());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	@Override
	public Item selectByNum(int num) {
		// TODO Auto-generated method stub
		Connection conn=db.getConnection();
		String sql="select * from item where num=?";
		Item i =null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return new Item(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7));
			}
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return null;
	}

	@Override
	public ArrayList<Item> selectByC1(int c1) {
		// TODO Auto-generated method stub
		Connection conn=db.getConnection();
		String sql="select * from item where c1=?";
		ArrayList<Item> list =new ArrayList<Item>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,c1);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Item(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7)));
			} 
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public ArrayList<Item> selectByC2(int c2) {
		// TODO Auto-generated method stub
		Connection conn=db.getConnection();
		String sql="select * from item where c2=?";
		ArrayList<Item> list =new ArrayList<Item>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,c2);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Item(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7)));
			} 
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public ArrayList<Item> selectByC3(int c3) {
		// TODO Auto-generated method stub
		Connection conn=db.getConnection();
		String sql="select * from item where c3=?";
		ArrayList<Item> list =new ArrayList<Item>();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,c3);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Item(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7)));
			} 
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return list;
	}

}
