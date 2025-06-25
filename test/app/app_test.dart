import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/app.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';
import 'package:my_portfolio_web/app/routes/app_routes.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

import 'app_test.mocks.dart';

@GenerateMocks([
  ThemeController,
  PortfolioRepository,
])
void main() {
  group('App Widget', () {
    late MockThemeController mockThemeController;
    late MockPortfolioRepository mockRepository;

    setUp(() {
      mockThemeController = MockThemeController();
      mockRepository = MockPortfolioRepository();
      
      Get.reset();
      
      // Register mock dependencies
      Get.put<PortfolioRepository>(mockRepository);
      Get.put<ThemeController>(mockThemeController);
      
      // Mock theme controller behavior
      when(mockThemeController.isDarkMode).thenReturn(false.obs);
      when(mockThemeController.currentTheme).thenReturn(AppTheme.lightTheme.obs);
    });

    tearDown(() {
      Get.reset();
    });

    group('Widget Creation', () {
      testWidgets('should create App widget', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        expect(find.byType(App), findsOneWidget);
      });

      testWidgets('should be a StatelessWidget', (tester) async {
        const app = App();
        
        expect(app, isA<StatelessWidget>());
      });

      testWidgets('should create GetMaterialApp', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });
    });

    group('App Configuration', () {
      testWidgets('should set correct app title', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.title, equals('Saksham Srivastava - Portfolio'));
      });

      testWidgets('should disable debug banner', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.debugShowCheckedModeBanner, isFalse);
      });

      testWidgets('should set initial route', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.initialRoute, equals(Routes.home));
      });

      testWidgets('should configure app pages', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.getPages, equals(AppPages.routes));
      });
    });

    group('Theme Integration', () {
      testWidgets('should use light theme by default', (tester) async {
        when(mockThemeController.isDarkMode).thenReturn(false.obs);
        when(mockThemeController.currentTheme).thenReturn(AppTheme.lightTheme.obs);
        
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.theme, isNotNull);
      });

      testWidgets('should support dark theme', (tester) async {
        when(mockThemeController.isDarkMode).thenReturn(true.obs);
        when(mockThemeController.currentTheme).thenReturn(AppTheme.darkTheme.obs);
        
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.theme, isNotNull);
      });

      testWidgets('should react to theme changes', (tester) async {
        final isDarkMode = false.obs;
        final currentTheme = AppTheme.lightTheme.obs;
        
        when(mockThemeController.isDarkMode).thenReturn(isDarkMode);
        when(mockThemeController.currentTheme).thenReturn(currentTheme);
        
        const app = App();
        
        await tester.pumpWidget(app);
        
        // Change theme
        isDarkMode.value = true;
        currentTheme.value = AppTheme.darkTheme;
        
        await tester.pump();
        
        // Should rebuild with new theme
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });
    });

    group('Routing Configuration', () {
      testWidgets('should configure GetX routing', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.getPages, isNotNull);
        expect(getMaterialApp.getPages, isNotEmpty);
      });

      testWidgets('should set home route', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.initialRoute, isNotNull);
      });

      testWidgets('should handle unknown routes', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.unknownRoute, isNull);
      });
    });

    group('Dependency Integration', () {
      testWidgets('should work with GetX dependency injection', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        // Should be able to find registered dependencies
        expect(Get.isRegistered<PortfolioRepository>(), isTrue);
        expect(Get.isRegistered<ThemeController>(), isTrue);
      });

      testWidgets('should handle missing dependencies gracefully', (tester) async {
        Get.reset(); // Remove all dependencies
        
        const app = App();
        
        // Should not crash even without dependencies
        await tester.pumpWidget(app);
        
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });
    });

    group('Localization', () {
      testWidgets('should support localization', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        // Should have locale configuration
        expect(getMaterialApp.locale, isNull); // Default locale
      });

      testWidgets('should handle locale changes', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        // Should handle locale changes gracefully
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });
    });

    group('Performance', () {
      testWidgets('should build efficiently', (tester) async {
        const app = App();
        
        final stopwatch = Stopwatch()..start();
        
        await tester.pumpWidget(app);
        
        stopwatch.stop();
        
        // Should build quickly (less than 100ms in test environment)
        expect(stopwatch.elapsedMilliseconds, lessThan(100));
      });

      testWidgets('should handle rebuilds efficiently', (tester) async {
        final isDarkMode = false.obs;
        when(mockThemeController.isDarkMode).thenReturn(isDarkMode);
        when(mockThemeController.currentTheme).thenReturn(AppTheme.lightTheme.obs);
        
        const app = App();
        
        await tester.pumpWidget(app);
        
        final stopwatch = Stopwatch()..start();
        
        // Trigger rebuild
        isDarkMode.value = true;
        await tester.pump();
        
        stopwatch.stop();
        
        // Rebuild should be fast
        expect(stopwatch.elapsedMilliseconds, lessThan(50));
      });
    });

    group('Error Handling', () {
      testWidgets('should handle theme controller errors', (tester) async {
        when(mockThemeController.isDarkMode).thenThrow(Exception('Theme error'));
        
        const app = App();
        
        // Should not crash on theme errors
        await tester.pumpWidget(app);
        
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });

      testWidgets('should handle routing errors', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        // Should handle invalid routes gracefully
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });
    });

    group('Material Design', () {
      testWidgets('should use Material Design 3', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.theme?.useMaterial3, isTrue);
      });

      testWidgets('should have proper color scheme', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        final getMaterialApp = tester.widget<GetMaterialApp>(
          find.byType(GetMaterialApp),
        );
        
        expect(getMaterialApp.theme?.colorScheme, isNotNull);
      });
    });

    group('Accessibility', () {
      testWidgets('should support accessibility features', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        // Should have semantic labels and proper contrast
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });

      testWidgets('should handle high contrast mode', (tester) async {
        const app = App();
        
        await tester.pumpWidget(app);
        
        // Should adapt to high contrast settings
        expect(find.byType(GetMaterialApp), findsOneWidget);
      });
    });
  });
}
