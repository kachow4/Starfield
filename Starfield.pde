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
	fill(0, 0, 0, 100);
	rect(-5, -5, 810, 810);
	for (int i = 0; i < kat.length; i++)
	{
		kat[i].move();
		kat[i].show();
	}
	fill(0, 255, 0);
	rect(0, 730, 1000, 100);
}

class NormalParticle implements Particle
{
	double nX, nY, nSpeed, nAngle;
	int nColor;

	NormalParticle()
	{
		nX = 0;
		nY = 0;
		nSpeed = Math.random()*5;
		nAngle = Math.PI/2*Math.random();
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
		fill(255);
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
		oX = 10;
		oY = 400;
		oSpeed = Math.random()*10;
		oAngle = Math.PI*2*Math.random();
		oColor = color(0, 0, 255);
	}

	public void move()
	{
		oX = oX + 2;
		oY = 700;
	}

	public void show()
	{
		noStroke();
		fill(255);
		ellipse((float)oX, (float)oY, 10, 10);
		stroke(255);
		line((float)(oX), (float)oY, (float)(oX), (float)(oY + 20));
		line((float)(oX), (float)oY + 20, (float)(oX - 5), (float)(oY + 30));
		line((float)(oX), (float)oY + 20, (float)(oX + 5), (float)(oY + 30));
		line((float)(oX), (float)oY + 15, (float)(oX - 5), (float)(oY + 10));
		line((float)(oX), (float)oY + 15, (float)(oX + 5), (float)(oY + 10));
		if (oX < 350)
		{
		text("save me!", (float)oX + 10, (float)oY);
		}
		else 
		{
		text("AHHH!", (float)oX + 10, (float)oY);
		}	

	}
}

class JumboParticle extends NormalParticle
{
	void show()
	{
		noStroke();
		fill(255);
		ellipse( (float)nX, (float)nY, 20, 20);
	}
}

void mousePressed()
{	
	for (int i = 0; i < kat.length; i++)
	{
		kat[i] = new NormalParticle();
		kat[0] = new OddballParticle();
		kat[1] = new JumboParticle();
	}
}