package edu.ucla.cs.galaxygear.datacollection2;

public class SensorEventDAO {
	
	public final float[] values;
	public final int type;
	
	public SensorEventDAO(int type, float[] values) {
		this.values = values;
		this.type = type;
	}

}
