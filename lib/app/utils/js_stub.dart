/// Stub implementation for dart:js functionality
/// Used when running on non-web platforms
library;

/// Stub implementation of JsObject
class JsObject {
  /// Constructor
  JsObject();

  /// Check if property exists (stub implementation)
  bool hasProperty(String property) => false;

  /// Get property (stub implementation)
  dynamic operator [](String property) => null;

  /// Set property (stub implementation)
  void operator []=(String property, dynamic value) {}

  /// Call method (stub implementation)
  dynamic callMethod(String method, [List<dynamic>? args]) => null;
}

/// Stub implementation of context
final JsObject context = JsObject();
