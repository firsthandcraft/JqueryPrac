package item;

import java.util.ArrayList;

public interface Dao {
	void insert(Item i);

	Item selectByNum(int num);

	ArrayList<Item> selectByC1(int c1);

	ArrayList<Item> selectByC2(int c2);

	ArrayList<Item> selectByC3(int c3);
}
