import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/modules/projects/views/projects_view.dart';

/// A wrapper for ProjectsView that makes it testable by wrapping it in a SingleChildScrollView
/// This avoids the overflow issues in tests
class ProjectsViewTestWrapper extends StatelessWidget {
  const ProjectsViewTestWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: ProjectsView(),
      ),
    );
  }
}
