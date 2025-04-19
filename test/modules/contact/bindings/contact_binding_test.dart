import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/contact/bindings/contact_binding.dart';
import 'package:my_portfolio_web/app/modules/contact/controllers/contact_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('ContactBinding', () {
    test('registers ContactController', () {
      // Apply the binding
      ContactBinding().dependencies();

      // Verify the controller is registered
      expect(Get.isPrepared<ContactController>(), isTrue);

      // Verify we can find the controller
      final controller = Get.find<ContactController>();
      expect(controller, isA<ContactController>());
    });
  });
}
