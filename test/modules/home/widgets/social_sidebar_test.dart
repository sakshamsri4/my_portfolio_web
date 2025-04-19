import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/ui/neo_pop_social_button.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/social_sidebar.dart';

class MockHomeController extends GetxController {
  Future<void> launchProjectUrl(String url) async {}
  Future<void> launchWhatsApp() async {}
}

void main() {
  late MockHomeController controller;
  
  setUp(() {
    controller = MockHomeController();
    Get.testMode = true;
    Get.reset();
  });
  
  tearDown(() {
    Get.reset();
  });
  
  group('SocialSidebar', () {
    test('SocialSidebar exists and is a widget', () {
      // Create a SocialSidebar
      final sidebar = SocialSidebar(controller: controller as HomeController);
      
      // Verify it's a widget
      expect(sidebar, isA<Widget>());
      
      // Verify it's a SocialSidebar
      expect(sidebar, isA<SocialSidebar>());
    });
    
    testWidgets('does not render on mobile', (WidgetTester tester) async {
      // Set up a small screen size for mobile
      tester.binding.window.physicalSizeTestValue = const Size(360, 640);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                SocialSidebar(controller: controller as HomeController),
              ],
            ),
          ),
        ),
      );
      
      // Verify the sidebar is rendered but returns SizedBox.shrink()
      expect(find.byType(SocialSidebar), findsOneWidget);
      
      // Verify no social buttons are rendered
      expect(find.byType(NeoPOPSocialButton), findsNothing);
      
      // Reset the screen size
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
    
    test('controller methods exist', () {
      // Verify the methods exist
      expect(controller.launchProjectUrl, isA<Function>());
      expect(controller.launchWhatsApp, isA<Function>());
    });
  });
}
