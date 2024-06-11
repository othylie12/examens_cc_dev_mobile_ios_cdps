package com.example.nadjitanbetan_atossou_agbleta

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingPlugin

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        FlutterFirebaseMessagingPlugin.setPluginRegistrant { registry ->
            FirebaseCloudMessagingPluginRegistrant.registerWith(registry)
        }
    }
}
