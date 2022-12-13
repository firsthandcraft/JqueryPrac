package menu;

import java.util.ArrayList;

public class ServiceImpl implements Service {
	private Dao dao;

	public ServiceImpl() {
		dao = new DaoImpl();
	}

	@Override
	public ArrayList<Cate> getCate1() {
		// TODO Auto-generated method stub
		return dao.selectAllCate1();
	}

	@Override
	public ArrayList<Cate> getCate2(int pNum) {
		// TODO Auto-generated method stub
		return dao.selectCate2(pNum);
	}

	@Override
	public ArrayList<Cate> getCate3(int pNum) {
		// TODO Auto-generated method stub
		return dao.selectCate3(pNum);
	}

}
