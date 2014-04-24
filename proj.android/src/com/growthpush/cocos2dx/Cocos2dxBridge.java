package com.growthpush.cocos2dx;

import org.cocos2dx.lib.Cocos2dxGLSurfaceView;

import com.growthpush.bridge.ExternalFrameworkBridge;

public class Cocos2dxBridge extends ExternalFrameworkBridge {

	@Override
	protected void callbackExternalFramework(final String customFiled) {
		Cocos2dxGLSurfaceView.getInstance().queueEvent(new Runnable() {
			@Override
			public void run() {
				didOpenRemoteNotification(customFiled);
			}
		});
	}

	/*
	 * Remote notification callback method (JNI interface)
	 * 
	 * @param json json string
	 */
	static native void didOpenRemoteNotification(String json);

}
