package com.example.callnatiivedemo;

import android.widget.Toast;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "wallpaper";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
//                            call.method//channel
//                            call.argument()//aa send from flutter
                            Toast.makeText((this), "toast   ", Toast.LENGTH_SHORT).show();
                            result.success("ok");//tra ve flutter
                        }
                );
    }
}
