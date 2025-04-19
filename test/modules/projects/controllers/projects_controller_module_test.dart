import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart';

void main() {
  late ProjectsController controller;

  setUp(() {
    Get.testMode = true;
    controller = ProjectsController();
    Get.put(controller);
  });

  tearDown(Get.reset);

  group('ProjectsController', () {
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
