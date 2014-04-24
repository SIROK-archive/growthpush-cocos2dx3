package com.growthpush.cocos2dx;

import android.content.Context;
import com.growthpush.GrowthPush;
import com.growthpush.model.Environment;

public class GrowthPushJNI {
	static Context mContext = null;

	public GrowthPushJNI(Context context) {
		mContext = context;
	}

	public static void initialize(int applicationId, final String secret, int environment, boolean debug) {
		initialize(applicationId, secret, environment, debug, 0);
	}

	public static void initialize(int applicationId, final String secret, int environment, boolean debug, int option) {
		GrowthPush.getInstance().initialize(mContext, applicationId, secret, convertIntToEnvironment(environment), debug);
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

	public static void callTrackGrowthPushMessage() {
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
