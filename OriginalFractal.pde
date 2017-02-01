public void setup()
{
	size(800,800);
	
}
public void draw()
{
	background(0);
	myFractal(400,400,150);
}
public void myFractal(int x, int y, int siz)
{
	
	if (siz > 10)
	{
		myFractal(x - siz/2, y, siz/2);
		myFractal(x + siz/2, y, siz/2);
	}
}