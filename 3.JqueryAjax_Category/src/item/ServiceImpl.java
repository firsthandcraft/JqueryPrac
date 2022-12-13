package item;

import java.util.ArrayList;

public class ServiceImpl implements Service {
	private Dao dao;

	public ServiceImpl() {
		dao = new DaoImpl();
	}

	@Override
	public void addItem(Item i) {
		// TODO Auto-generated method stub
		dao.insert(i);
	}

	@Override
	public Item getByNum(int num) {
		// TODO Auto-generated method stub
		return dao.selectByNum(num);
	}

	@Override
	public ArrayList<Item> getByC1(int c1) {
		// TODO Auto-generated method stub
		return dao.selectByC1(c1);
	}

	@Override
	public ArrayList<Item> getByC2(int c2) {
		// TODO Auto-generated method stub
		return dao.selectByC2(c2);
	}

	@Override
	public ArrayList<Item> getByC3(int c3) {
		// TODO Auto-generated method stub
		return dao.selectByC3(c3);
	}

}
