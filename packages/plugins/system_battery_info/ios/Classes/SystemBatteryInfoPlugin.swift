import Flutter
import UIKit

public class SystemBatteryInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "system_battery_info", binaryMessenger: registrar.messenger())
    let instance = SystemBatteryInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    UIDevice.current.isBatteryMonitoringEnabled=true
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getBatteryLevel" :
            let level = UIDevice.current.batteryLevel
            if level>=0 {
                result(Int(level*100))
            }else{
                result(FlutterError(code:"UNAVAILABLE",message: "Battery info unavailable",details: nil ))
            }
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
