import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/modules/projects/views/projects_view.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

/// A wrapper for ProjectsView that makes it testable
class ProjectsViewWrapper extends StatelessWidget {
  const ProjectsViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize GetX dependencies
    final controller = Get.put(ProjectsController());
    
    // Add routes for navigation testing
    Get.addPages(AppPages.routes);
    
    return const MaterialApp(
      home: SingleChildScrollView(
        child: ProjectsView(),
      ),
    );
  }
}
