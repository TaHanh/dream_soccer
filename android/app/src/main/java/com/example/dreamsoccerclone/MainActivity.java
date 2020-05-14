package com.example.dreamsoccerclone;

import android.os.Build;

import androidx.annotation.NonNull;

import com.example.dreamsoccerclone.adx.Config;
import com.example.dreamsoccerclone.adx.SharedPrefsUtils;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  String CHANNEL = "my_module";
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method){
          case "getAppId":{
            result.success(BuildConfig.APPLICATION_ID);
            break;
          }
          case "getBannerId":{
            result.success(SharedPrefsUtils.getInstance(MainActivity.this).getString(Config.AD_BANNER));
            break;
          }
          case "getInterId":{
            result.success(SharedPrefsUtils.getInstance(MainActivity.this).getString(Config.AD_INTERSTITIAL));
            break;
          }
        }
      }
    });
  }
}
