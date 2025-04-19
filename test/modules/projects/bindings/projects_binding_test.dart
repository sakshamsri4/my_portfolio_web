import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/projects/bindings/projects_binding.dart';
import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('ProjectsBinding', () {
    test('registers ProjectsController', () {
      // Apply the binding
      ProjectsBinding().dependencies();

      // Verify the controller is registered
      expect(Get.isPrepared<ProjectsController>(), isTrue);

      // Verify we can find the controller
      final controller = Get.find<ProjectsController>();
      expect(controller, isA<ProjectsController>());
    });
  });
}
