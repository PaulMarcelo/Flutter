package com.example.flutter_speedometer

import android.content.pm.PackageManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity(), Geolocation.OnGeolocationListener {
    lateinit var geolocation: Geolocation
    lateinit var channel: MethodChannel
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // GeneratedPluginRegistrant.registerWith(this)


        geolocation = Geolocation(this)
        geolocation.onGeolocationListener = this;


        channel = MethodChannel(flutterEngine?.dartExecutor, "ec.paul/geolocation")
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "permission" -> {
                    geolocation.checkPermission(result)
                }
                "startTracking" -> {
                    geolocation.start()
                    result.success(null)
                }
                "stopTracking" -> {
                    geolocation.stopTracking();
                    result.success(null);
                }

                else ->
                    result.notImplemented()
            }
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String?>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == Geolocation.REQUEST_ACCESS_FINE_LOCATION) {
            if (grantResults.isNotEmpty()
                    && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // permission was granted, yay! Do the
                geolocation.sendResult("GRANTED")
            } else {
                // permission denied, boo! Disable the
                // functionality that depends on this permission.
                geolocation.sendResult("DENIED")
            }
        }
    }

    override fun onDestroy() {
        geolocation.unregister()
        geolocation.stopTracking()
        super.onDestroy()
    }

    override fun onGpsChanged(isEnabled: Boolean) {
        channel.invokeMethod("onGpsEnabled", isEnabled);
    }

    override fun onLocationUpdate(position: HashMap<String, Double>?) {
        channel.invokeMethod(
                "onLocation", position)
    }
}





