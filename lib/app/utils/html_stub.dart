/// Stub implementation of the html library for non-web platforms
/// This allows us to use the same code for web and mobile platforms

/// Stub implementation of AnchorElement
class AnchorElement {
  /// Constructor that takes an href
  AnchorElement({String? href}) : _href = href;

  final String? _href;

  /// Set an attribute (does nothing in stub)
  void setAttribute(String name, String value) {
    // Do nothing in stub implementation
  }

  /// Click method (does nothing in stub)
  void click() {
    // Do nothing in stub implementation
  }
}
