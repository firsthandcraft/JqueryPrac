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

	public DaoImpl() {
		db = DBConnect.getInstance();
	}

	public ArrayList<Img> selectAll() {
		// TODO Auto-generated method stub

		

		return null;
	}

	public void insert(Img img) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int makeNum() {
		// TODO Auto-generated method stub
		
		return 0;
	}

	@Override
	public Img select(int num) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
	
		return 0;
	}

	@Override
	public int update(Img img) {
		// TODO Auto-generated method stub
		
		return 0;
	}
}
