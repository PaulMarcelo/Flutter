import UIKit
import Flutter
import CoreLocation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate,GeolocationDelegate {
    func onLocationUpdate(coords: CLLocationCoordinate2D) {
        channel?.invokeMethod("onLocation", arguments: ["lat":coords.latitude,"lng":coords.longitude])
    }
    
    let geolocation = Geolocation()
    var channel:FlutterMethodChannel?
    
    
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        geolocation.delegate = self
        
        let controller = window.rootViewController as! FlutterBinaryMessenger
        
        //let channel = FlutterMethodChannel(name: "ec.paul/native_text", binaryMessenger: controller)
        channel = FlutterMethodChannel(name: "ec.paul/geolocation", binaryMessenger: controller)
        
        
        channel?.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult)->Void in
            //            let arguments = call.arguments as? [String:Any]
            switch call.method{
            //case "get":
            case "permission":
                self.geolocation.checkPermission(result: result	)
                
                //                let dartText = arguments?["text"] as! String
                //                let dartAge = arguments?["age"] as! Int
                //                result("ios is here: \(dartText) \(dartAge)")
                //            case "add": result("ios add is here")
                
            case "startTracking":
                self.geolocation.startTracking()
                result(nil)
                
            case "stopTracking":
                self.geolocation.stopTracking()
                result(nil)
            default: result(FlutterMethodNotImplemented)
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
