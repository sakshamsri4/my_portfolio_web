import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/utils/responsive_helper.dart';

void main() {
  group('ResponsiveHelper', () {
    testWidgets('isMobile should return true for small screen width',
        (WidgetTester tester) async {
      // Build a MediaQuery with a small screen width
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(500, 800)),
          child: Container(),
        ),
      );

      // Get the BuildContext
      final context = tester.element(find.byType(Container));

      // Test the isMobile method
      expect(ResponsiveHelper.isMobile(context), isTrue);
      expect(ResponsiveHelper.isTablet(context), isFalse);
      expect(ResponsiveHelper.isDesktop(context), isFalse);
    });

    testWidgets('isTablet should return true for medium screen width',
        (WidgetTester tester) async {
      // Build a MediaQuery with a medium screen width
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(800, 1000)),
          child: Container(),
        ),
      );

      // Get the BuildContext
      final context = tester.element(find.byType(Container));

      // Test the isTablet method
      expect(ResponsiveHelper.isMobile(context), isFalse);
      expect(ResponsiveHelper.isTablet(context), isTrue);
      expect(ResponsiveHelper.isDesktop(context), isFalse);
    });

    testWidgets('isDesktop should return true for large screen width',
        (WidgetTester tester) async {
      // Build a MediaQuery with a large screen width
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1300, 1000)),
          child: Container(),
        ),
      );

      // Get the BuildContext
      final context = tester.element(find.byType(Container));

      // Test the isDesktop method
      expect(ResponsiveHelper.isMobile(context), isFalse);
      expect(ResponsiveHelper.isTablet(context), isFalse);
      expect(ResponsiveHelper.isDesktop(context), isTrue);
    });

    testWidgets(
        'responsiveValue should return correct value based on screen size',
        (WidgetTester tester) async {
      // Test for mobile
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(500, 800)),
          child: Container(),
        ),
      );

      var context = tester.element(find.byType(Container));
      expect(
        ResponsiveHelper.responsiveValue<String>(
          context: context,
          mobile: 'mobile',
          tablet: 'tablet',
          desktop: 'desktop',
        ),
        equals('mobile'),
      );

      // Test for tablet
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(800, 1000)),
          child: Container(),
        ),
      );

      context = tester.element(find.byType(Container));
      expect(
        ResponsiveHelper.responsiveValue<String>(
          context: context,
          mobile: 'mobile',
          tablet: 'tablet',
          desktop: 'desktop',
        ),
        equals('tablet'),
      );

      // Test for desktop
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1300, 1000)),
          child: Container(),
        ),
      );

      context = tester.element(find.byType(Container));
      expect(
        ResponsiveHelper.responsiveValue<String>(
          context: context,
          mobile: 'mobile',
          tablet: 'tablet',
          desktop: 'desktop',
        ),
        equals('desktop'),
      );
    });

    testWidgets('responsiveValue should use mobile value when tablet is null',
        (WidgetTester tester) async {
      // Test for tablet with null tablet value
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(800, 1000)),
          child: Container(),
        ),
      );

      final context = tester.element(find.byType(Container));
      expect(
        ResponsiveHelper.responsiveValue<String>(
          context: context,
          mobile: 'mobile',
          desktop: 'desktop',
        ),
        equals('mobile'),
      );
    });

    test('breakpoint constants should have correct values', () {
      expect(ResponsiveHelper.mobileBreakpoint, equals(600));
      expect(ResponsiveHelper.tabletBreakpoint, equals(900));
      expect(ResponsiveHelper.desktopBreakpoint, equals(1200));
    });
  });
}
