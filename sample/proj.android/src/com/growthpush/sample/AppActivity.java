package com.growthpush.sample;

import org.cocos2dx.lib.Cocos2dxActivity;

import android.os.Bundle;

import com.growthpush.cocos2dx.GrowthPushJNI;

public class AppActivity extends Cocos2dxActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		GrowthPushJNI.setContext(getApplicationContext());
	}

}
