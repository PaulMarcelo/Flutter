package com.example.flutter_speedometer


//import com.google.android.gms.common.api.ResolvableApiException
//import com.google.android.gms.location.FusedLocationProviderClient
//import com.google.android.gms.location.LocationCallback
//import com.google.android.gms.location.LocationRequest
//import com.google.android.gms.location.LocationResult
//import com.google.android.gms.location.LocationServices
//import com.google.android.gms.location.LocationSettingsRequest
//import com.google.android.gms.location.LocationSettingsResponse
//import com.google.android.gms.location.SettingsClient
//import com.google.android.gms.tasks.OnFailureListener
//import com.google.android.gms.tasks.OnSuccessListener
//import com.google.android.gms.tasks.Task

import android.Manifest
import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.IntentSender.SendIntentException
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.android.gms.common.api.ResolvableApiException
import com.google.android.gms.location.*
import com.google.android.gms.tasks.OnFailureListener
import com.google.android.gms.tasks.OnSuccessListener
import com.google.android.gms.tasks.Task
import io.flutter.plugin.common.MethodChannel
import java.util.*


class Geolocation internal constructor(private val activity: Activity) {
    var onGeolocationListener: OnGeolocationListener? = null
    private var locationRequest: LocationRequest

    private var fusedLocationProviderClient: FusedLocationProviderClient

    var gpsBroadcastReceiver: BroadcastReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            if (intent.action == "android.location.PROVIDERS_CHANGED") {
                val locationManager = context.getSystemService(Context.LOCATION_SERVICE) as LocationManager
                val isEnabled = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
                onGeolocationListener!!.onGpsChanged(isEnabled)
            }
        }
    }

    var result: MethodChannel.Result? = null
    private fun setResult(result: MethodChannel.Result): Boolean {
        if (this.result != null) {
            this.result!!.error("PENDING_RESULT_ERROR", "error you have a pending task", "")
            this.result = null
            return false
        }
        this.result = result
        return true
    }

    fun sendResult(response: String?) {
        result!!.success(response)
        result = null
    }

    private fun requestPermission() {
        ActivityCompat.requestPermissions(activity, arrayOf(Manifest.permission.ACCESS_FINE_LOCATION),
                REQUEST_ACCESS_FINE_LOCATION)
    }

    fun checkPermission(result: MethodChannel.Result) {
        if (setResult(result)) {
            if (ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION)
                    != PackageManager.PERMISSION_GRANTED) {
                // Permission is not granted
                requestPermission()
            } else {
                sendResult("GRANTED")
            }
        }
    }

    fun unregister() {
        activity.unregisterReceiver(gpsBroadcastReceiver)
    }

    private var locationCallback: LocationCallback = object : LocationCallback() {
        override fun onLocationResult(locationResult: LocationResult?) {
            super.onLocationResult(locationResult)
            if (locationResult != null) {
                val location: Location = locationResult.lastLocation
                if (onGeolocationListener != null) {
                    val position = HashMap<String, Double>()
                    position["lat"] = location.latitude
                    position["lng"] = location.longitude
                    onGeolocationListener!!.onLocationUpdate(position)
                }
            }
        }
    }

    private fun startTracking() {
        fusedLocationProviderClient.requestLocationUpdates(locationRequest, locationCallback, null)
    }

    fun start() {
        val builder: LocationSettingsRequest.Builder = LocationSettingsRequest.Builder()
        builder.addLocationRequest(locationRequest)
        builder.setAlwaysShow(true)
        val client: SettingsClient = LocationServices.getSettingsClient(activity)
        val task: Task<LocationSettingsResponse> = client.checkLocationSettings(builder.build())
        task.addOnSuccessListener(OnSuccessListener<LocationSettingsResponse> {
            startTracking()
        })
        task.addOnFailureListener(OnFailureListener { e ->
            if (e is ResolvableApiException) {
                try {
                    val resolvable: ResolvableApiException = e as ResolvableApiException
                    resolvable.startResolutionForResult(activity,
                            REQUEST_CHECK_SETTINGS)
                } catch (sendEx: SendIntentException) {
                    // Ignore the error.
                }
            }
        })
    }

    fun stopTracking() {
        fusedLocationProviderClient.removeLocationUpdates(locationCallback)
    }

    interface OnGeolocationListener {
        fun onGpsChanged(isEnabled: Boolean)
        fun onLocationUpdate(position: HashMap<String, Double>?)
    }

    companion object {
        const val REQUEST_ACCESS_FINE_LOCATION = 50101
        const val REQUEST_CHECK_SETTINGS = 50102
    }

    init {
        this.activity.registerReceiver(gpsBroadcastReceiver, IntentFilter(LocationManager.PROVIDERS_CHANGED_ACTION))
        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(activity)
        locationRequest = LocationRequest()
        locationRequest.interval = 10000
        locationRequest.fastestInterval = 5000
        locationRequest.priority = LocationRequest.PRIORITY_HIGH_ACCURACY
    }
}