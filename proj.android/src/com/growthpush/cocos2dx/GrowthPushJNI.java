package com.growthpush.cocos2dx;

import android.content.Context;

import com.growthpush.GrowthPush;
import com.growthpush.model.Environment;

public class GrowthPushJNI {

	private static Context context = null;

	public static void initialize(int applicationId, final String secret, int environment, boolean debug) {
		GrowthPush.getInstance().initialize(context, applicationId, secret, convertIntToEnvironment(environment), debug);
	}

	public static void register(final String senderId) {
		GrowthPush.getInstance().register(senderId);
	}

	public static void trackEvent(final String name) {
		trackEvent(name, null);
	}

	public static void trackEvent(final String name, final String value) {
		GrowthPush.getInstance().trackEvent(name, value);
	}

	public static void setTag(final String name) {
		setTag(name, null);
	}

	public static void setTag(final String name, final String value) {
		GrowthPush.getInstance().setTag(name, value);
	}

	public static void setDeviceTags() {
		GrowthPush.getInstance().setDeviceTags();
	}

	public static void setContext(Context context) {
		GrowthPushJNI.context = context;
	}

	public static Environment convertIntToEnvironment(int environment) {

		switch (environment) {
		case 1:
			return Environment.development;
		case 2:
			return Environment.production;
		default:
			return null;
		}

	}

}
