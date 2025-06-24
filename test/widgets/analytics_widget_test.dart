import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

import '../helpers/pump_app.dart';
import '../mocks/analytics_mock.dart';

void main() {
  group('Analytics Widget Tests', () {
    late MockAnalyticsService mockAnalyticsService;
    late AnalyticsController analyticsController;

    setUp(() {
      Get.testMode = true;
      
      mockAnalyticsService = MockAnalyticsService();
      Get.put<AnalyticsService>(mockAnalyticsService);
      
      analyticsController = AnalyticsController();
      Get.put<AnalyticsController>(analyticsController);
    });

    tearDown(() {
      Get.reset();
    });

    group('Button Analytics Tracking', () {
      testWidgets('should track button clicks', (WidgetTester tester) async {
        mockAnalyticsService.clearTrackedEvents();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ElevatedButton(
                onPressed: () async {
                  await analyticsController.trackButtonClick(
                    buttonName: 'test_button',
                    section: 'test_section',
                  );
                },
                child: const Text('Test Button'),
              ),
            ),
          ),
        );

        // Tap the button
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();

        // Verify analytics event was tracked
        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(1));
        expect(events.first['event_type'], equals('button_click'));
        expect(events.first['button_name'], equals('test_button'));
      });

      testWidgets('should track navigation button clicks', (WidgetTester tester) async {
        mockAnalyticsService.clearTrackedEvents();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                actions: [
                  TextButton(
                    onPressed: () async {
                      await analyticsController.trackNavigationClick('about');
                    },
                    child: const Text('About'),
                  ),
                ],
              ),
              body: const Center(child: Text('Home')),
            ),
          ),
        );

        // Tap the navigation button
        await tester.tap(find.text('About'));
        await tester.pumpAndSettle();

        // Verify navigation analytics
        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(1));
        expect(events.first['event_type'], equals('button_click'));
        expect(events.first['button_name'], equals('navigation_about'));
        expect(events.first['section'], equals('header_navigation'));
      });
    });

    group('Form Analytics Tracking', () {
      testWidgets('should track form interactions', (WidgetTester tester) async {
        mockAnalyticsService.clearTrackedEvents();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  TextField(
                    onTap: () async {
                      await analyticsController.trackContactAction('form_focus');
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await analyticsController.trackContactAction(
                        'form_submit',
                        method: 'email',
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );

        // Tap the text field
        await tester.tap(find.byType(TextField));
        await tester.pumpAndSettle();

        // Tap the submit button
        await tester.tap(find.text('Submit'));
        await tester.pumpAndSettle();

        // Verify form analytics
        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(2));
        
        expect(events[0]['event_type'], equals('contact_interaction'));
        expect(events[0]['action'], equals('form_focus'));
        
        expect(events[1]['event_type'], equals('contact_interaction'));
        expect(events[1]['action'], equals('form_submit'));
        expect(events[1]['method'], equals('email'));
      });
    });

    group('Project Card Analytics', () {
      testWidgets('should track project interactions', (WidgetTester tester) async {
        mockAnalyticsService.clearTrackedEvents();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Card(
                child: Column(
                  children: [
                    const Text('Project Title'),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await analyticsController.trackProjectClick(
                              projectName: 'portfolio_app',
                              action: 'view_demo',
                            );
                          },
                          child: const Text('Demo'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await analyticsController.trackProjectClick(
                              projectName: 'portfolio_app',
                              action: 'view_github',
                            );
                          },
                          child: const Text('GitHub'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        // Tap demo button
        await tester.tap(find.text('Demo'));
        await tester.pumpAndSettle();

        // Tap GitHub button
        await tester.tap(find.text('GitHub'));
        await tester.pumpAndSettle();

        // Verify project analytics
        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(2));
        
        expect(events[0]['event_type'], equals('project_interaction'));
        expect(events[0]['project_name'], equals('portfolio_app'));
        expect(events[0]['action'], equals('view_demo'));
        
        expect(events[1]['event_type'], equals('project_interaction'));
        expect(events[1]['project_name'], equals('portfolio_app'));
        expect(events[1]['action'], equals('view_github'));
      });
    });

    group('Skills Section Analytics', () {
      testWidgets('should track skill chip interactions', (WidgetTester tester) async {
        mockAnalyticsService.clearTrackedEvents();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Wrap(
                children: [
                  ActionChip(
                    label: const Text('Flutter'),
                    onPressed: () async {
                      await analyticsController.trackSkillClick(
                        skillName: 'Flutter',
                        category: 'mobile',
                      );
                    },
                  ),
                  ActionChip(
                    label: const Text('Firebase'),
                    onPressed: () async {
                      await analyticsController.trackSkillClick(
                        skillName: 'Firebase',
                        category: 'backend',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        // Tap Flutter chip
        await tester.tap(find.text('Flutter'));
        await tester.pumpAndSettle();

        // Tap Firebase chip
        await tester.tap(find.text('Firebase'));
        await tester.pumpAndSettle();

        // Verify skill analytics
        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(2));
        
        expect(events[0]['event_type'], equals('skill_interaction'));
        expect(events[0]['skill_name'], equals('Flutter'));
        expect(events[0]['category'], equals('mobile'));
        
        expect(events[1]['event_type'], equals('skill_interaction'));
        expect(events[1]['skill_name'], equals('Firebase'));
        expect(events[1]['category'], equals('backend'));
      });
    });

    group('Download Analytics', () {
      testWidgets('should track CV download', (WidgetTester tester) async {
        mockAnalyticsService.clearTrackedEvents();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ElevatedButton(
                onPressed: () async {
                  await analyticsController.trackCVDownload(
                    source: 'header_button',
                  );
                },
                child: const Text('Download CV'),
              ),
            ),
          ),
        );

        // Tap download button
        await tester.tap(find.text('Download CV'));
        await tester.pumpAndSettle();

        // Verify download analytics
        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(1));
        expect(events.first['event_type'], equals('cv_download'));
        expect(events.first['source'], equals('header_button'));
      });
    });

    group('Social Media Analytics', () {
      testWidgets('should track social media clicks', (WidgetTester tester) async {
        mockAnalyticsService.clearTrackedEvents();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await analyticsController.trackSocialClick(
                        platform: 'linkedin',
                        source: 'footer',
                      );
                    },
                    icon: const Icon(Icons.business),
                  ),
                  IconButton(
                    onPressed: () async {
                      await analyticsController.trackSocialClick(
                        platform: 'github',
                        source: 'footer',
                      );
                    },
                    icon: const Icon(Icons.code),
                  ),
                ],
              ),
            ),
          ),
        );

        // Tap LinkedIn icon
        await tester.tap(find.byIcon(Icons.business));
        await tester.pumpAndSettle();

        // Tap GitHub icon
        await tester.tap(find.byIcon(Icons.code));
        await tester.pumpAndSettle();

        // Verify social media analytics
        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(2));
        
        expect(events[0]['event_type'], equals('social_media_click'));
        expect(events[0]['platform'], equals('linkedin'));
        
        expect(events[1]['event_type'], equals('social_media_click'));
        expect(events[1]['platform'], equals('github'));
      });
    });

    group('Error Handling in Widgets', () {
      testWidgets('should handle analytics errors gracefully', (WidgetTester tester) async {
        // Remove analytics service to simulate error
        Get.delete<AnalyticsService>();
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ElevatedButton(
                onPressed: () async {
                  try {
                    await analyticsController.trackButtonClick(
                      buttonName: 'error_test',
                    );
                  } catch (e) {
                    // Should handle error gracefully
                  }
                },
                child: const Text('Error Test'),
              ),
            ),
          ),
        );

        // Tap button - should not crash
        await tester.tap(find.text('Error Test'));
        await tester.pumpAndSettle();

        // Widget should still be functional
        expect(find.text('Error Test'), findsOneWidget);
      });
    });
  });
}
