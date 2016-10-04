Particle[] kat;
void setup()
{
	size(800, 800);
	kat = new Particle[1000];
	for (int i = 0; i < kat.length; i++)
	{
		kat[i] = new NormalParticle();
		kat[1] = new JumboParticle();
	}
	kat[0] = new OddballParticle();
}

void draw()
{
	background(0);
	for (int i = 0; i < kat.length; i++)
	{
		kat[i].move();
		kat[i].show();
	}
}

class NormalParticle implements Particle
{
	double nX, nY, nSpeed, nAngle;
	int nColor;

	NormalParticle()
	{
		nX = 400;
		nY = 400;
		nSpeed = Math.random()*5;
		nAngle = Math.PI*2*Math.random();
		nColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
	}

	public void move()
	{
		nX = nX + Math.cos(nAngle)*nSpeed;
		nY = nY + Math.sin(nAngle)*nSpeed;
	}

	public void show()
	{
		noStroke();
		fill(nColor);
		ellipse((float)nX, (float)nY, 2, 2);

	}
}

interface Particle
{
	public void show();
	public void move();
}

class OddballParticle implements Particle
{
	double oX, oY, oSpeed, oAngle;
	int oColor;

	OddballParticle()
	{	
		oX = -10;
		oY = 300;
		oSpeed = Math.random()*10;
		oAngle = Math.PI*2*Math.random();
		oColor = color(0, 0, 255);
	}

	public void move()
	{
		oX +=5;
		//oY ++;
		if (oX > 900)
		{
			oX = 0;
		}
	}

	public void show()
	{
		noStroke();
		fill(oColor);
		ellipse((float)oX, (float)oY, 100, 50);

	}
}

class JumboParticle extends NormalParticle
{
	void show()
	{
		noStroke();
		fill(255, 0, 0);
		ellipse( (float)nX, (float)nY, 15, 15);
	}
}

void mousePressed()
{	
}