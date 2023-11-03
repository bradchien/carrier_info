import Flutter
import UIKit

public class SwiftCarrierInfoPlugin: NSObject, FlutterPlugin {
#if os(iOS)
    fileprivate let carrier = Carrier()
#endif
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "plugins.chizi.tech/carrier_info", binaryMessenger: registrar.messenger())
        let instance = SwiftCarrierInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        DispatchQueue.main.async { [self] in
            switch call.method {
            
            case "getIosInfo":
#if os(iOS)
                result(carrier.carrierInfo)
#else
                result(nil)
#endif

            default:
                result(FlutterMethodNotImplemented)
                return
            }
        }
    }

}
