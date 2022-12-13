package item;

public class Item {
	private int num;
	private String title;
	private int price;
	private String img;
	private int c1;
	private int c2;
	private int c3;

	public Item() {
	}

	public Item(int num, String title, int price, String img, int c1, int c2, int c3) {
		this.num = num;
		this.title = title;
		this.price = price;
		this.img = img;
		this.c1 = c1;
		this.c2 = c2;
		this.c3 = c3;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getC1() {
		return c1;
	}

	public void setC1(int c1) {
		this.c1 = c1;
	}

	public int getC2() {
		return c2;
	}

	public void setC2(int c2) {
		this.c2 = c2;
	}

	public int getC3() {
		return c3;
	}

	public void setC3(int c3) {
		this.c3 = c3;
	}

	@Override
	public String toString() {
		return "Item [num=" + num + ", title=" + title + ", price=" + price + ", img=" + img + ", c1=" + c1 + ", c2="
				+ c2 + ", c3=" + c3 + "]";
	}

}
