/// Stub implementation of the html library for non-web platforms
/// This allows us to use the same code for web and mobile platforms
library html_stub;

/// Stub implementation of AnchorElement
class AnchorElement {
  /// Constructor that takes an href
  AnchorElement({this.href});

  /// The href attribute of the anchor
  String? href;

  /// Set an attribute (does nothing in stub)
  void setAttribute(String name, String value) {
    // Do nothing in stub implementation
    if (name == 'href') {
      href = value;
    }
  }

  /// Click method (does nothing in stub)
  void click() {
    // Do nothing in stub implementation
  }
}
