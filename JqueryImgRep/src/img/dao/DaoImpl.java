package img.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.Img;

public class DaoImpl implements Dao {
	private DBConnect db;
	private PreparedStatement pstmt=null;
	private ResultSet rs= null;
	private Connection conn=null;
	private Img img=null;

	public DaoImpl() {
		db = DBConnect.getInstance();
	}

	public ArrayList<Img> selectAll() {
		// TODO Auto-generated method stub
		conn=db.getConnection();
		String sql="select * from img order by num";
		ArrayList<Img> imgs = new ArrayList<Img>();
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//
			while(rs.next()) {
				imgs.add(new Img(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}//finally
		return imgs;
	}

	public void insert(Img img) {
		// TODO Auto-generated method stub
		conn=db.getConnection();
		String sql="insert into img values(?,?,?,?,?,sysdate)";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,img.getNum());
			pstmt.setString(2,img.getWriter());
			pstmt.setString(3,img.getPwd());
			pstmt.setString(4,img.getTitle());
			pstmt.setString(5,img.getPath());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}//finally
	}

	@Override
	public int makeNum() {
		// TODO Auto-generated method stub
		conn=db.getConnection();
		String sql="select seq_img.nextval from dual";
		int num=0;
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//
			if(rs.next()) {
				num=rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}//finally
		return num;
	}

	@Override
	public Img select(int num) {
		// TODO Auto-generated method stub
		conn=db.getConnection();
		String sql="select * from img where num=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return new Img(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}//finally
		return null;
	}

	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
		conn=db.getConnection();
		String sql="delete img where num=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			return num;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}//finally
		return 0;
	}

	@Override
	public int update(Img img) {
		// TODO Auto-generated method stub
		conn=db.getConnection();
		String sql="update img set writer=?,pwd=?,title=?,u_date=sysdate where num=?";

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,img.getWriter());
			pstmt.setString(2,img.getPwd());
			pstmt.setString(3,img.getTitle());
			pstmt.setInt(4,img.getNum());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}//finally
		return 0;
	}
}
