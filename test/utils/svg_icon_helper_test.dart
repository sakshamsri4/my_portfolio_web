import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/utils/svg_icon_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SvgIconHelper', () {
    test('SvgIconHelper class exists and has expected methods', () {
      // Verify that the class has the expected methods
      expect(SvgIconHelper.loadSvgIcon, isA<Function>());
      expect(SvgIconHelper.getSvgIcon, isA<Function>());
    });
  });
}
