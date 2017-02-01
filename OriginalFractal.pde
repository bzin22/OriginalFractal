public void setup()
{
	size(800,800);
	rectMode(CENTER);
}
public void draw()
{
	background(0);
	myFractal(400,150,300);
	FractalTwo(400,450,400);
}
public void myFractal(int x, int y, int siz)
{
	ellipse(x,y,siz,siz);
	if (siz < 10)
	{
		ellipse(x,y,siz,siz);
	}
	else
	{
		fill(255,0,0);
		myFractal(x - siz/2, y, siz/2);
		fill(0,0,255);
		myFractal(x + siz/2, y, siz/2);
		fill(255,166,0);
		myFractal(x - siz/2, y + 3*siz/4, siz/2);
		fill(0,255,0);
		myFractal(x + siz/2, y + 3*siz/4, siz/2);
	}
}
public void FractalTwo(int x, int y, int siz)
{
	
	rect(x,y,siz,siz,10);
	if (siz < 10)
	{
		rect(x,y,siz,siz);
	}
	else 
	{
		fill(255,159,175);
		FractalTwo(x - siz/2, y, siz/2);
		fill(35,65,255);
		FractalTwo(x + siz/2, y, siz/2);
		fill(255,166,84);
		FractalTwo(x - siz/2, y + 3*siz/4, siz/2);
		fill(0,255,69);
		FractalTwo(x + siz/2, y + 3*siz/4, siz/2);
	}
}