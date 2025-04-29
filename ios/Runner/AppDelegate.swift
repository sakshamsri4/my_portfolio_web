import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  /// Handles application launch initialization and registers Flutter plugins.
  ///
  /// - Returns: `true` if the application finished launching successfully; otherwise, `false`.
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
