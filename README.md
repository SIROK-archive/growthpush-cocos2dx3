> ## :warning: Deprecation Notice

> Growth Push SDK for Android will be depricated becasue all SDK are integrated with Growthbeat SDK. Please use its SDK instead:
> * [Growthbeat SDK for iOS](https://github.com/SIROK/growthbeat-ios/)
> * [Growthbeat SDK for Android](https://github.com/SIROK/growthbeat-android/)

Growth Push SDK for Cocos2d-x 3.x
===================

![Growth Push](https://growthpush.com/) is the easiest way to implement push notification and analyzes your notification for smart devices.

## Build sample project

```bash
git clone https://github.com/SIROK/growthpush-cocos2dx3.git
cd ./growthpush-cocos2dx3/ ; git submodule update --init --recursive
cd ./submodules/cocos2d-x/ ; ./download-deps.py
cd ../../ ; open sample/proj.ios_mac/sample.xcodeproj
```

## Install

### iOS

1. Copy Classes/GrowthPush to /path/to/your_project/Classes/
1. Copy growthpush-ios/GrowthPush.framework to /path/to/your_project/proj.ios/Frameworks/
1. Add Classes/GrowthPush and GrowthPush.framework to Xcode project.

### Android

1. Copy following jar files to /path/to/your_project/proj.android/libs/
  - android-support-v4.jar
  - google-play-services.jar
  - growthpush.jar
1. Copy proj.android/* to /path/to/your_project/proj.android/
1. Edit AndroidManifest.xml
1. Edit Android.mk
1. Pass Context to GrowthPushJNI

How to edit AndroidManifest.xml.

```xml
<application android:label="@string/app_name"
    android:icon="@drawable/icon">
    <!-- ... -->
    <activity android:name="com.growthpush.view.AlertActivity"
              android:configChanges="orientation|keyboardHidden"
              android:launchMode="singleInstance"
              android:theme="@android:style/Theme.Translucent" />

    <receiver android:name="com.growthpush.cocos2dx.Cocos2dxBroadcastReceiver" android:permission="com.google.android.c2dm.permission.SEND" >
            <intent-filter>
                    <action android:name="com.google.android.c2dm.intent.RECEIVE" />
                    <action android:name="com.google.android.c2dm.intent.REGISTRATION" />
                    <category android:name="YOUR_PACKAGE_NAME" />
            </intent-filter>
    </receiver>
</application>

<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.GET_ACCOUNTS" />
<uses-permission android:name="com.google.android.c2dm.permission.RECEIVE" />
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<permission android:name="YOUR_PACKAGE_NAME.permission.C2D_MESSAGE" android:protectionLevel="signature" />
<uses-permission android:name="YOUR_PACKAGE_NAME.permission.C2D_MESSAGE" />
```

How to edit Android.mk.

```bash
LOCAL_SRC_FILES += ../../Classes/GrowthPush/android/GrowthPush.cpp
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/cocos/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/cocos/base/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/external/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/GrowthPush
```

How to pass Context to GrowthPushJNI.

```java
public class AppActivity extends Cocos2dxActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GrowthPushJNI.setContext(getApplicationContext());
  }
}
```

Easier way is adding GrowthPushCocos2dxActivity instead of AppActivity to AndroidManifest.xml as LAUNCHER

```
<activity android:name="com.growthpush.cocos2dx.GrowthPushCocos2dxActivity" ... >
  ...
  <intent-filter>
    <action android:name="android.intent.action.MAIN" />
    <category android:name="android.intent.category.LAUNCHER" />
  </intent-filter>
</activity>
```

## Tracking events and setting tags.


```cpp
bool AppDelegate::applicationDidFinishLaunching() {
    // ...
    GrowthPush::initialize(YOUR_APP_ID, "YOUR_APP_SECRET", GPEnvironmentDevelopment, true);
    GrowthPush::registerDeviceToken("YOUR_SENDER_ID");
    GrowthPush::trackEvent("Launch");
    GrowthPush::setDeviceTags();
    GrowthPush::clearBadge();
    // ...
    return YES;
}
```
