package img.service;

import java.util.ArrayList;

import img.dao.Dao;
import img.dao.DaoImpl;
import model.Img;

public class ServiceImpl implements Service {

	private Dao dao;

	public ServiceImpl() {
		dao = new DaoImpl();
	}

	public void addImg(Img img) {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<Img> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int makeNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Img getImg(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delImg(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editImg(Img i) {
		// TODO Auto-generated method stub
		return 0;
	}

}
