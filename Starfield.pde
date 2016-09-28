Particle[] kat;
void setup()
{
	size(600, 600);
	kat = new Particle[200];
	for (int i = 0; i < kat.length; i++)
	{
		kat[i] = new NormalParticle();
		kat[0] = new OddballParticle();
		kat[1] = new JumboParticle();
	}
	

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
		nX = 300;
		nY = 300;
		nSpeed = Math.random()*10;
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
		ellipse((float)nX, (float)nY, 5, 5);

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
		oX = 300;
		oY = 300;
		oSpeed = Math.random()*10;
		oAngle = Math.PI*2*Math.random();
		oColor = color(0, 0, 255);
	}

	public void move()
	{
		oX = oX + Math.cos(oAngle)*oSpeed;
		oY = oY + Math.sin(oAngle)*oSpeed;
	}

	public void show()
	{
		noStroke();
		fill(oColor);
		ellipse((float)oX, (float)oY, 50, 50);

	}
}

class JumboParticle extends NormalParticle
{
	void show()
	{
		noStroke();
		fill(255, 0, 0);
		ellipse( (float)nX, (float)nY, 50, 50);
	}
}

