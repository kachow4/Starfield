NormalParticle[] kachow;
void setup()
{
	size(600, 600);
	kachow = new NormalParticle[100];
	for (int i = 0; i < kachow.length; i++)
	{
		kachow[i] = new NormalParticle();
	}
}
void draw()
{
	for (int i = 0; i < kachow.length; i++)
	{
		kachow[i].move();
		kachow[i].show();
	}
}
class NormalParticle
{
	double nX, nY, nSpeed, nAngle;
	int nColor;

	NormalParticle(int x, int y)
	{
		nX = (Math.random()*100);
		nY = (Math.random()*100);
		nSpeed = (Math.random()*100);
		nAngle = (Math.random()*100);
		nColor = 0;
	}

	void move()
	{
		nX = nX + Math.cos(nAngle)*nSpeed;
		nY = nY + Math.sin(nAngle)*nSpeed;
	}

	void show()
	{
		nColor = color(0, 0, 255);
	}
}
	interface Particle
	{
	//your code here
	}

class OddballParticle //uses an interface
{
	//your code here
}

class JumboParticle //uses inheritance
{
	//your code here
}

