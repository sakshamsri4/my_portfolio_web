import 'package:get/get.dart';

import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart';

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectsController>(
      ProjectsController.new,
    );
  }
}
