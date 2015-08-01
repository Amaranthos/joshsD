module Rect;

struct Rect {
	public int x;
	public int w;
	public int y;
	public int h;

	public Rect(int x = 0, int w = 0, int y = 0, int h = 0) {
		this.x = x;
		this.w = w;
		this.y = y;
		this.h = h;
	}

	public bool Contains(int i, int j) {
		return (i > x && 
				i < x + w &&
			 	j > y &&
			  	j < y + h);
	}
}