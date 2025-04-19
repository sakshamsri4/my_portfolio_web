import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/contact/controllers/contact_controller.dart';

void main() {
  late ContactController controller;

  setUp(() {
    Get.testMode = true;
    controller = ContactController();
    Get.put(controller);
  });

  tearDown(Get.reset);

  group('ContactController', () {
    test('initial count should be 0', () {
      expect(controller.count.value, equals(0));
    });

    test('increment should increase count by 1', () {
      controller.increment();
      expect(controller.count.value, equals(1));

      controller.increment();
      expect(controller.count.value, equals(2));
    });
  });
}
