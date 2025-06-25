// Conditional export for platform-specific implementations
export 'analytics_service_web.dart' if (dart.library.io) 'analytics_service_io.dart';
