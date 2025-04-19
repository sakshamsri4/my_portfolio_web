import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/infinite_scroll_row.dart';

void main() {
  group('InfiniteScrollRow', () {
    testWidgets('renders correct number of items', (WidgetTester tester) async {
      const itemCount = 5;
      const multiplier =
          3; // This is the internal multiplier used in the widget

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InfiniteScrollRow(
              itemCount: itemCount,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Center(child: Text('Item $index')),
              ),
            ),
          ),
        ),
      );

      // Verify the correct number of items is rendered (itemCount * multiplier)
      expect(find.byType(Container), findsNWidgets(itemCount * multiplier));

      // Verify the text of the first item
      expect(find.text('Item 0'), findsWidgets);

      // Verify the text of the last unique item
      expect(find.text('Item ${itemCount - 1}'), findsWidgets);
    });

    testWidgets('applies correct spacing between items',
        (WidgetTester tester) async {
      const itemSpacing = 20.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InfiniteScrollRow(
              itemCount: 3,
              itemSpacing: itemSpacing,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );

      // Find all padding widgets
      final paddingWidgets = tester.widgetList<Padding>(find.byType(Padding));

      // Verify each padding has the correct right padding
      for (final padding in paddingWidgets) {
        expect(
          padding.padding,
          equals(const EdgeInsets.only(right: itemSpacing)),
        );
      }
    });

    testWidgets('uses custom scroll controller when provided',
        (WidgetTester tester) async {
      final scrollController = ScrollController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InfiniteScrollRow(
              itemCount: 10,
              scrollController: scrollController,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
          ),
        ),
      );

      // Verify the scroll controller is used
      final singleChildScrollView = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );
      expect(singleChildScrollView.controller, equals(scrollController));

      // Clean up
      scrollController.dispose();
    });

    testWidgets('uses custom physics when provided',
        (WidgetTester tester) async {
      const customPhysics = NeverScrollableScrollPhysics();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InfiniteScrollRow(
              itemCount: 5,
              physics: customPhysics,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      );

      // Verify the custom physics is used
      final singleChildScrollView = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );
      expect(singleChildScrollView.physics, equals(customPhysics));
    });

    testWidgets('uses default physics when not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InfiniteScrollRow(
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                color: Colors.purple,
              ),
            ),
          ),
        ),
      );

      // Verify the default physics (BouncingScrollPhysics) is used
      final singleChildScrollView = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );
      expect(singleChildScrollView.physics, isA<BouncingScrollPhysics>());
    });

    testWidgets('applies custom padding when provided',
        (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(16);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InfiniteScrollRow(
              itemCount: 5,
              padding: customPadding,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      );

      // Verify the custom padding is used
      final singleChildScrollView = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );
      expect(singleChildScrollView.padding, equals(customPadding));
    });

    testWidgets('uses specified cross axis alignment',
        (WidgetTester tester) async {
      const alignment = CrossAxisAlignment.center;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InfiniteScrollRow(
              itemCount: 5,
              alignment: alignment,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                color: Colors.teal,
              ),
            ),
          ),
        ),
      );

      // Verify the alignment is used
      final row = tester.widget<Row>(find.byType(Row));
      expect(row.crossAxisAlignment, equals(alignment));
    });
  });
}
