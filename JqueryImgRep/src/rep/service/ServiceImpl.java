package rep.service;

import java.util.ArrayList;

import model.Rep;
import rep.dao.Dao;
import rep.dao.DaoImpl;

public class ServiceImpl implements Service {
	private Dao dao;
	
	public ServiceImpl(){
		dao = new DaoImpl();
	}
	
	public void addRep(Rep rep) {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<Rep> getRepsByImg_num(int img_num) {
		// TODO Auto-generated method stub
		return null;
	}

}
