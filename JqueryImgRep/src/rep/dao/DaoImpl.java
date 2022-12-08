package rep.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.Rep;

public class DaoImpl implements Dao {
	private Connection conn;
	private PreparedStatement pstmt = null;

	public DaoImpl() {
		DBConnect dbconn = DBConnect.getInstance();
		conn = dbconn.getConnection();
	}
	public void insert(Rep rep) {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<Rep> selectByImg_num(int img_num) {
		// TODO Auto-generated method stub
		

		return null;
	}

}
