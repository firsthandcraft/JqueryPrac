package menu;

import java.util.ArrayList;

public interface Dao {
	ArrayList<Cate> selectAllCate1();
	ArrayList<Cate> selectCate2(int pNum);
	ArrayList<Cate> selectCate3(int pNum);
}
