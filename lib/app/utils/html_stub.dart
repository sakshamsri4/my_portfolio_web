/// Stub implementation of Navigator
class Navigator {
  /// User agent string
  String get userAgent => 'stub-user-agent';
}

/// Stub implementation of Window
class Window {
  /// Navigator instance
  Navigator get navigator => Navigator();

  /// Open method (does nothing in stub)
  void open(String url, String target) {
    // Do nothing in stub implementation
  }
}

/// Stub implementation of Body
class Body {
  /// Append method (does nothing in stub)
  void append(dynamic element) {
    // Do nothing in stub implementation
  }
}

/// Stub implementation of Document
class Document {
  /// Body instance
  Body? get body => Body();
}

/// Stub implementation of AnchorElement
class AnchorElement {
  /// Constructor that takes an href
  AnchorElement({this.href});

  /// The href attribute of the anchor
  String? href;

  /// The target attribute of the anchor
  String? target;

  /// The download attribute of the anchor
  String? download;

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

  /// Remove method (does nothing in stub)
  void remove() {
    // Do nothing in stub implementation
  }
}

/// Global window instance
final Window window = Window();

/// Global document instance
final Document document = Document();
