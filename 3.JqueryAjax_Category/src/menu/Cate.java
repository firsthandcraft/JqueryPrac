package menu;

public class Cate {
	private int num;
	private String name;
	private int parent_num;

	public Cate() {
	}

	public Cate(int num, String name, int parent_num) {
		this.num = num;
		this.name = name;
		this.parent_num = parent_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParent_num() {
		return parent_num;
	}

	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}

	@Override
	public String toString() {
		return "Cate [num=" + num + ", name=" + name + ", parent_num=" + parent_num + "]";
	}

}
