import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/about/bindings/about_binding.dart';
import 'package:my_portfolio_web/app/modules/about/controllers/about_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('AboutModule', () {
    test('AboutBinding registers AboutController', () {
      // Apply the binding
      AboutBinding().dependencies();

      // Verify the controller is registered
      expect(Get.isPrepared<AboutController>(), isTrue);

      // Verify we can find the controller
      final controller = Get.find<AboutController>();
      expect(controller, isA<AboutController>());

      // Verify the controller has the expected properties
      expect(controller.count.value, equals(0));
    });

    test('AboutController increment increases count', () {
      // Register the controller
      final controller = AboutController();
      Get.put<AboutController>(controller);

      // Initial value should be 0
      expect(controller.count.value, equals(0));

      // Call increment
      controller.increment();

      // Value should be incremented to 1
      expect(controller.count.value, equals(1));
    });
  });
}
