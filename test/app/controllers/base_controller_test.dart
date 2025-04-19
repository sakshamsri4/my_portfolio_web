import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';

// Create a concrete implementation of BaseController for testing
class TestController extends BaseController {
  int initializeCount = 0;
  int cleanupCount = 0;

  @override
  void initializeController() {
    initializeCount++;
  }

  @override
  void cleanupResources() {
    cleanupCount++;
  }
}

void main() {
  group('BaseController', () {
    late TestController controller;

    setUp(() {
      controller = TestController();
    });

    test('should be a GetxController', () {
      expect(controller, isA<GetxController>());
    });

    test('initializeController should be called', () {
      controller.initializeController();
      expect(controller.initializeCount, equals(1));
    });

    test('cleanupResources should be called', () {
      controller.cleanupResources();
      expect(controller.cleanupCount, equals(1));
    });

    test('onInit should call initializeController', () {
      // Manually call onInit (normally called by GetX)
      controller.onInit();

      // Verify initializeController was called
      expect(controller.initializeCount, equals(1));
    });

    test('onClose should call cleanupResources', () {
      // Manually call onClose (normally called by GetX)
      controller.onClose();

      // Verify cleanupResources was called
      expect(controller.cleanupCount, equals(1));
    });
  });
}
