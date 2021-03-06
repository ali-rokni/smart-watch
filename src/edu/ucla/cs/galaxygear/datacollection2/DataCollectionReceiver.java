package edu.ucla.cs.galaxygear.datacollection2;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class DataCollectionReceiver extends BroadcastReceiver {
	@Override
	public void onReceive(Context context, Intent intent) {
		if (intent.getAction().equals("edu.cs.ucla.galaxygear.datacollection.startservice") ||
			intent.getAction().equals("android.intent.action.BOOT_COMPLETED")) {
			context.startService(new Intent(context, DataCollectionService.class));
		} else if (intent.getAction().equals("edu.cs.ucla.galaxygear.datacollection.stopservice")) {
			context.stopService(new Intent(context, DataCollectionService.class));
		}
	}
}