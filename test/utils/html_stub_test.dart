import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/utils/html_stub.dart';

void main() {
  group('AnchorElement', () {
    test('constructor sets href correctly', () {
      const testHref = 'https://example.com';
      final anchor = AnchorElement(href: testHref);

      expect(anchor.href, equals(testHref));
    });

    test('setAttribute sets href correctly', () {
      final anchor = AnchorElement();
      const testHref = 'https://example.com';

      anchor.setAttribute('href', testHref);
      expect(anchor.href, equals(testHref));
    });

    test('setAttribute does nothing for non-href attributes', () {
      final anchor = AnchorElement(href: 'initial')
        ..setAttribute('target', '_blank');
      expect(anchor.href, equals('initial'));
    });

    test('click method can be called without errors', () {
      final anchor = AnchorElement();

      // This should not throw an error
      expect(anchor.click, returnsNormally);
    });
  });
}
