import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/bindings/home_binding.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('HomeBinding', () {
    test('registers HomeController', () {
      // Apply the binding
      HomeBinding().dependencies();

      // Verify the controller is registered
      expect(Get.isPrepared<HomeController>(), isTrue);

      // Verify we can find the controller
      final controller = Get.find<HomeController>();
      expect(controller, isA<HomeController>());
    });
  });
}
