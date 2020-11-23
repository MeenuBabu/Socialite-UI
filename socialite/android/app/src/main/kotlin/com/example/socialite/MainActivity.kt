package com.example.socialite

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "test_activity"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        MethodChannel(flutterEngine?.dartExecutor, CHANNEL).setMethodCallHandler(
                object : MethodChannel.MethodCallHandler {
                    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
                        if(call.method.equals("startNewActivity")) {
                            val text = call.argument<String>("text")
                            startNewActivity(text)
                        }
                    }
                })
    }

    private fun startNewActivity(text: String?) {
        val intent = Intent(this, SecondActivity::class.java)
        intent.putExtra("ARG",text)
        startActivity(intent)
    }
}
