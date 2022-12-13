package item;

import java.util.ArrayList;

public interface Service {
	void addItem(Item i);

	Item getByNum(int num);

	ArrayList<Item> getByC1(int c1);

	ArrayList<Item> getByC2(int c2);

	ArrayList<Item> getByC3(int c3);
}
