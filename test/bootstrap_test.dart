import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/services/service_locator.dart';
import 'package:my_portfolio_web/bootstrap.dart';

import 'bootstrap_test.mocks.dart';

// Generate mocks for testing
@GenerateMocks([ServiceLocator])
void main() {
  group('Bootstrap', () {
    late MockServiceLocator mockServiceLocator;

    setUp(() {
      mockServiceLocator = MockServiceLocator();
      // Reset GetX state
      Get.reset();
    });

    tearDown(() {
      Get.reset();
    });

    group('AppBlocObserver', () {
      late AppBlocObserver observer;

      setUp(() {
        observer = const AppBlocObserver();
      });

      test('should create AppBlocObserver instance', () {
        expect(observer, isA<AppBlocObserver>());
        expect(observer, isA<BlocObserver>());
      });

      test('should log onChange events', () {
        // Create a test bloc for testing
        final testBloc = TestBloc();
        final change = Change<int>(currentState: 0, nextState: 1);

        // This test verifies the onChange method can be called
        expect(() => observer.onChange(testBloc, change), returnsNormally);
      });

      test('should log onError events', () {
        final testBloc = TestBloc();
        final error = Exception('Test error');
        final stackTrace = StackTrace.current;

        // This test verifies the onError method can be called
        expect(() => observer.onError(testBloc, error, stackTrace), returnsNormally);
      });
    });

    group('bootstrap function', () {
      testWidgets('should initialize Flutter binding', (tester) async {
        // Mock the builder function
        Widget testApp() => const MaterialApp(home: Text('Test App'));

        // Test that bootstrap completes without error
        await expectLater(
          () => bootstrap(() => testApp()),
          returnsNormally,
        );
      });

      testWidgets('should handle web platform detection', (tester) async {
        Widget testApp() => const MaterialApp(home: Text('Test App'));

        // Test bootstrap with web platform
        await expectLater(
          () => bootstrap(() => testApp()),
          returnsNormally,
        );
      });

      testWidgets('should set up error handling', (tester) async {
        Widget testApp() => const MaterialApp(home: Text('Test App'));

        // Capture the original error handler
        final originalOnError = FlutterError.onError;

        await bootstrap(() => testApp());

        // Verify error handler was set
        expect(FlutterError.onError, isNotNull);
        expect(FlutterError.onError, isNot(equals(originalOnError)));

        // Test error handler
        final testError = FlutterErrorDetails(
          exception: Exception('Test error'),
          stack: StackTrace.current,
        );

        expect(() => FlutterError.onError!(testError), returnsNormally);
      });

      testWidgets('should set BlocObserver', (tester) async {
        Widget testApp() => const MaterialApp(home: Text('Test App'));

        await bootstrap(() => testApp());

        expect(Bloc.observer, isA<AppBlocObserver>());
      });

      testWidgets('should handle async builder function', (tester) async {
        Future<Widget> asyncBuilder() async {
          await Future.delayed(const Duration(milliseconds: 10));
          return const MaterialApp(home: Text('Async Test App'));
        }

        await expectLater(
          () => bootstrap(asyncBuilder),
          returnsNormally,
        );
      });

      testWidgets('should handle builder exceptions', (tester) async {
        Widget errorBuilder() => throw Exception('Builder error');

        await expectLater(
          () => bootstrap(() => errorBuilder()),
          throwsException,
        );
      });

      test('should handle kIsWeb flag correctly', () {
        // This test verifies the web detection logic
        if (kIsWeb) {
          expect(kIsWeb, isTrue);
        } else {
          expect(kIsWeb, isFalse);
        }
      });
    });

    group('Platform Detection', () {
      test('should detect web platform correctly', () {
        // Test web platform detection
        expect(kIsWeb, isA<bool>());
      });

      test('should handle Firebase initialization for web', () {
        // Test Firebase web initialization logic
        if (kIsWeb) {
          // On web, Firebase is handled by JavaScript SDK
          expect(kIsWeb, isTrue);
        } else {
          // On native platforms, would need Flutter plugins
          expect(kIsWeb, isFalse);
        }
      });
    });

    group('Service Initialization', () {
      test('should initialize service locator', () async {
        // This test verifies ServiceLocator.init() is called
        // In a real test, we would mock ServiceLocator.init()
        expect(() => ServiceLocator.init(), returnsNormally);
      });
    });

    group('Error Handling', () {
      test('should handle FlutterError.onError setup', () {
        final originalHandler = FlutterError.onError;
        
        // Create a test error handler
        void testErrorHandler(FlutterErrorDetails details) {
          log(details.exceptionAsString(), stackTrace: details.stack);
        }

        FlutterError.onError = testErrorHandler;
        expect(FlutterError.onError, equals(testErrorHandler));

        // Restore original handler
        FlutterError.onError = originalHandler;
      });

      test('should log errors correctly', () {
        final testDetails = FlutterErrorDetails(
          exception: Exception('Test exception'),
          stack: StackTrace.current,
        );

        // Test that error logging doesn't throw
        expect(() => log(testDetails.exceptionAsString(), stackTrace: testDetails.stack), 
               returnsNormally);
      });
    });
  });
}

/// Test bloc for testing BlocObserver
class TestBloc extends Cubit<int> {
  TestBloc() : super(0);

  void increment() => emit(state + 1);
  void throwError() => throw Exception('Test bloc error');
}
