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
		dao.insert(img);
	}

	public ArrayList<Img> getAll() {
		return dao.selectAll();
		// TODO Auto-generated method stub
		
	}

	@Override
	public int makeNum() {
		return dao.makeNum();
		// TODO Auto-generated method stub
		
	}

	@Override
	public Img getImg(int num) {
		return dao.select(num);
		// TODO Auto-generated method stub
		
	}

	@Override
	public int delImg(int num) {
		return dao.delete(num);
		// TODO Auto-generated method stub
		
	}

}
