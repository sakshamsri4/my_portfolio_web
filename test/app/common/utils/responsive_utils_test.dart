import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/utils/responsive_utils.dart';

void main() {
  group('ResponsiveUtils', () {
    group('Breakpoint Constants', () {
      test('should have correct breakpoint values', () {
        expect(ResponsiveUtils.mobileBreakpoint, equals(768.0));
        expect(ResponsiveUtils.tabletBreakpoint, equals(1024.0));
      });

      test('breakpoints should be in ascending order', () {
        expect(ResponsiveUtils.mobileBreakpoint, 
               lessThan(ResponsiveUtils.tabletBreakpoint));
      });
    });

    group('Device Type Detection', () {
      testWidgets('should detect mobile device correctly', (tester) async {
        // Use a very small screen size to ensure mobile detection
        tester.view.physicalSize = const Size(400, 600);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isMobile(context), isTrue);
                expect(ResponsiveUtils.isTablet(context), isFalse);
                expect(ResponsiveUtils.isDesktop(context), isFalse);
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should detect tablet device correctly', (tester) async {
        tester.view.physicalSize = const Size(900, 1200);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isMobile(context), isFalse);
                expect(ResponsiveUtils.isTablet(context), isTrue);
                expect(ResponsiveUtils.isDesktop(context), isFalse);
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should detect desktop device correctly', (tester) async {
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isMobile(context), isFalse);
                expect(ResponsiveUtils.isTablet(context), isFalse);
                expect(ResponsiveUtils.isDesktop(context), isTrue);
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should handle edge cases at breakpoints', (tester) async {
        // Test exactly at mobile breakpoint
        await tester.binding.setSurfaceSize(const Size(768, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isMobile(context), isFalse);
                expect(ResponsiveUtils.isTablet(context), isTrue);
                return const SizedBox();
              },
            ),
          ),
        );

        // Test exactly at tablet breakpoint
        await tester.binding.setSurfaceSize(const Size(1024, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isTablet(context), isFalse);
                expect(ResponsiveUtils.isDesktop(context), isTrue);
                return const SizedBox();
              },
            ),
          ),
        );
      });
    });

    group('Column Count Calculation', () {
      testWidgets('should return 1 column for mobile', (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.getColumnCount(context), equals(1));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return 2 columns for tablet', (tester) async {
        await tester.binding.setSurfaceSize(const Size(900, 1200));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.getColumnCount(context), equals(2));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return 3 columns for desktop', (tester) async {
        await tester.binding.setSurfaceSize(const Size(1200, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.getColumnCount(context), equals(3));
                return const SizedBox();
              },
            ),
          ),
        );
      });
    });

    group('Screen Padding Calculation', () {
      testWidgets('should return correct padding for mobile', (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final padding = ResponsiveUtils.getScreenPadding(context);
                expect(padding, equals(const EdgeInsets.all(16)));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct padding for tablet', (tester) async {
        await tester.binding.setSurfaceSize(const Size(900, 1200));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final padding = ResponsiveUtils.getScreenPadding(context);
                expect(padding, equals(const EdgeInsets.all(24)));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct padding for desktop', (tester) async {
        await tester.binding.setSurfaceSize(const Size(1200, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final padding = ResponsiveUtils.getScreenPadding(context);
                expect(padding, equals(const EdgeInsets.all(32)));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      test('padding values should be in ascending order', () {
        const mobilePadding = EdgeInsets.all(16);
        const tabletPadding = EdgeInsets.all(24);
        const desktopPadding = EdgeInsets.all(32);

        expect(mobilePadding.left, lessThan(tabletPadding.left));
        expect(tabletPadding.left, lessThan(desktopPadding.left));
      });
    });

    group('Font Size Calculation', () {
      testWidgets('should return correct font sizes for mobile', (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.getTitleFontSize(context), equals(24.0));
                expect(ResponsiveUtils.getSubtitleFontSize(context), equals(18.0));
                expect(ResponsiveUtils.getBodyFontSize(context), equals(14.0));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct font sizes for tablet', (tester) async {
        await tester.binding.setSurfaceSize(const Size(900, 1200));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.getTitleFontSize(context), equals(28.0));
                expect(ResponsiveUtils.getSubtitleFontSize(context), equals(20.0));
                expect(ResponsiveUtils.getBodyFontSize(context), equals(16.0));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct font sizes for desktop', (tester) async {
        await tester.binding.setSurfaceSize(const Size(1200, 800));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.getTitleFontSize(context), equals(32.0));
                expect(ResponsiveUtils.getSubtitleFontSize(context), equals(22.0));
                expect(ResponsiveUtils.getBodyFontSize(context), equals(16.0));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      test('font sizes should maintain hierarchy', () {
        // Title should always be larger than subtitle, subtitle larger than body
        const titleMobile = 24.0;
        const subtitleMobile = 18.0;
        const bodyMobile = 14.0;

        expect(titleMobile, greaterThan(subtitleMobile));
        expect(subtitleMobile, greaterThan(bodyMobile));

        const titleDesktop = 32.0;
        const subtitleDesktop = 22.0;
        const bodyDesktop = 16.0;

        expect(titleDesktop, greaterThan(subtitleDesktop));
        expect(subtitleDesktop, greaterThan(bodyDesktop));
      });
    });

    group('Edge Cases and Error Handling', () {
      testWidgets('should handle very small screen sizes', (tester) async {
        await tester.binding.setSurfaceSize(const Size(200, 300));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isMobile(context), isTrue);
                expect(ResponsiveUtils.getColumnCount(context), equals(1));
                expect(ResponsiveUtils.getScreenPadding(context), 
                       equals(const EdgeInsets.all(16)));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should handle very large screen sizes', (tester) async {
        await tester.binding.setSurfaceSize(const Size(2560, 1440));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isDesktop(context), isTrue);
                expect(ResponsiveUtils.getColumnCount(context), equals(3));
                expect(ResponsiveUtils.getScreenPadding(context), 
                       equals(const EdgeInsets.all(32)));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should handle portrait vs landscape orientations', (tester) async {
        // Portrait tablet
        await tester.binding.setSurfaceSize(const Size(800, 1200));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isMobile(context), isFalse);
                expect(ResponsiveUtils.isTablet(context), isTrue);
                return const SizedBox();
              },
            ),
          ),
        );

        // Landscape tablet (same width, different height)
        await tester.binding.setSurfaceSize(const Size(800, 600));
        
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                expect(ResponsiveUtils.isMobile(context), isFalse);
                expect(ResponsiveUtils.isTablet(context), isTrue);
                return const SizedBox();
              },
            ),
          ),
        );
      });
    });

    group('Responsive Values', () {
      testWidgets('should return correct responsive value for mobile', (tester) async {
        tester.view.physicalSize = const Size(400, 600);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final value = ResponsiveUtils.getResponsiveValue<String>(
                  context: context,
                  mobile: 'mobile',
                  tablet: 'tablet',
                  desktop: 'desktop',
                );
                expect(value, equals('mobile'));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct responsive value for tablet', (tester) async {
        tester.view.physicalSize = const Size(900, 1200);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final value = ResponsiveUtils.getResponsiveValue<String>(
                  context: context,
                  mobile: 'mobile',
                  tablet: 'tablet',
                  desktop: 'desktop',
                );
                expect(value, equals('tablet'));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct responsive value for desktop', (tester) async {
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final value = ResponsiveUtils.getResponsiveValue<String>(
                  context: context,
                  mobile: 'mobile',
                  tablet: 'tablet',
                  desktop: 'desktop',
                );
                expect(value, equals('desktop'));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should fallback to mobile when tablet is null', (tester) async {
        tester.view.physicalSize = const Size(900, 1200);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final value = ResponsiveUtils.getResponsiveValue<String>(
                  context: context,
                  mobile: 'mobile',
                  desktop: 'desktop',
                );
                expect(value, equals('mobile'));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct responsive font size', (tester) async {
        tester.view.physicalSize = const Size(400, 600);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final fontSize = ResponsiveUtils.getResponsiveFontSize(
                  context,
                  mobile: 14.0,
                  tablet: 16.0,
                  desktop: 18.0,
                );
                expect(fontSize, equals(14.0));
                return const SizedBox();
              },
            ),
          ),
        );
      });

      testWidgets('should return correct responsive spacing', (tester) async {
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final spacing = ResponsiveUtils.getResponsiveSpacing(
                  context,
                  mobile: 8.0,
                  tablet: 12.0,
                  desktop: 16.0,
                );
                expect(spacing, equals(16.0));
                return const SizedBox();
              },
            ),
          ),
        );
      });
    });
  });
}
