import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/controllers/contact_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

import 'contact_controller_test.mocks.dart';

@GenerateMocks([PortfolioRepositoryInterface])
void main() {
  group('ContactController', () {
    late ContactController controller;
    late MockPortfolioRepositoryInterface mockRepository;

    setUp(() {
      mockRepository = MockPortfolioRepositoryInterface();
      
      // Setup mock data
      when(mockRepository.getContactInfo()).thenReturn({
        'email': 'test@example.com',
        'phone': '+1234567890',
        'location': 'Test City, Test Country',
      });
      
      when(mockRepository.getSocialLinks()).thenReturn({
        'linkedin': {
          'url': 'https://linkedin.com/in/test',
          'icon': 'linkedin_icon',
          'color': 'blue',
        },
        'github': {
          'url': 'https://github.com/test',
          'icon': 'github_icon',
          'color': 'black',
        },
        'twitter': {
          'url': 'https://twitter.com/test',
          'icon': 'twitter_icon',
          'color': 'blue',
        },
        'whatsapp': {
          'icon': 'whatsapp_icon',
          'color': 'green',
        },
      });
      
      // Register mock repository
      Get.put<PortfolioRepositoryInterface>(mockRepository);
      
      controller = ContactController();
    });

    tearDown(() {
      Get.reset();
    });

    group('Initialization', () {
      test('should initialize without errors', () {
        expect(() => controller.initializeController(), returnsNormally);
      });

      test('should use injected repository', () {
        controller = ContactController(repository: mockRepository);
        
        expect(controller.contactInfo, isNotEmpty);
        expect(controller.socialLinks, isNotEmpty);
      });

      test('should use GetX repository when none provided', () {
        controller = ContactController();
        
        expect(controller.contactInfo, isNotEmpty);
        expect(controller.socialLinks, isNotEmpty);
      });

      test('should access repository data during initialization', () {
        controller = ContactController(repository: mockRepository);

        // Verify that data is accessible (methods are called lazily)
        expect(controller.contactInfo, isNotEmpty);
        expect(controller.socialLinks, isNotEmpty);
      });
    });

    group('Contact Information', () {
      test('should provide contact information', () {
        final contactInfo = controller.contactInfo;
        
        expect(contactInfo, isNotEmpty);
        expect(contactInfo.keys, contains('email'));
        expect(contactInfo.keys, contains('phone'));
        expect(contactInfo.keys, contains('location'));
      });

      test('should have valid email format', () {
        final email = controller.contactInfo['email'];
        
        expect(email, isNotNull);
        expect(email, contains('@'));
        expect(email, contains('.'));
      });

      test('should have valid phone format', () {
        final phone = controller.contactInfo['phone'];
        
        expect(phone, isNotNull);
        expect(phone, startsWith('+'));
      });

      test('should have location information', () {
        final location = controller.contactInfo['location'];
        
        expect(location, isNotNull);
        expect(location, isNotEmpty);
      });

      test('should return consistent contact info', () {
        final contactInfo1 = controller.contactInfo;
        final contactInfo2 = controller.contactInfo;
        
        expect(contactInfo1, equals(contactInfo2));
      });
    });

    group('Social Links', () {
      test('should provide social media links', () {
        final socialLinks = controller.socialLinks;
        
        expect(socialLinks, isNotEmpty);
        expect(socialLinks, isA<Map<String, Map<String, dynamic>>>());
      });

      test('should contain expected social platforms', () {
        final socialLinks = controller.socialLinks;
        
        expect(socialLinks.keys, contains('linkedin'));
        expect(socialLinks.keys, contains('github'));
        expect(socialLinks.keys, contains('twitter'));
        expect(socialLinks.keys, contains('whatsapp'));
      });

      test('should have valid social link structure', () {
        final socialLinks = controller.socialLinks;
        
        for (final entry in socialLinks.entries) {
          final platform = entry.key;
          final data = entry.value;
          
          expect(data.keys, contains('icon'));
          expect(data.keys, contains('color'));
          expect(data['icon'], isNotNull);
          expect(data['color'], isNotNull);
          
          // Platforms with URLs should have valid URLs
          if (data.containsKey('url')) {
            expect(data['url'], isA<String>());
            expect(data['url'], isNotEmpty);
            expect(data['url'], startsWith('https://'));
          }
        }
      });

      test('should have LinkedIn profile URL', () {
        final linkedinData = controller.socialLinks['linkedin'];
        
        expect(linkedinData, isNotNull);
        expect(linkedinData!['url'], contains('linkedin.com'));
      });

      test('should have GitHub profile URL', () {
        final githubData = controller.socialLinks['github'];
        
        expect(githubData, isNotNull);
        expect(githubData!['url'], contains('github.com'));
      });

      test('should have Twitter profile URL', () {
        final twitterData = controller.socialLinks['twitter'];
        
        expect(twitterData, isNotNull);
        expect(twitterData!['url'], contains('twitter.com'));
      });

      test('should have WhatsApp without URL', () {
        final whatsappData = controller.socialLinks['whatsapp'];
        
        expect(whatsappData, isNotNull);
        expect(whatsappData!.containsKey('url'), isFalse);
        expect(whatsappData['icon'], isNotNull);
        expect(whatsappData['color'], isNotNull);
      });

      test('should return consistent social links', () {
        final socialLinks1 = controller.socialLinks;
        final socialLinks2 = controller.socialLinks;
        
        expect(socialLinks1.keys.length, equals(socialLinks2.keys.length));
        
        for (final key in socialLinks1.keys) {
          expect(socialLinks2.keys, contains(key));
          expect(socialLinks1[key], equals(socialLinks2[key]));
        }
      });
    });

    group('Controller Lifecycle', () {
      test('should initialize controller properly', () {
        expect(() => controller.initializeController(), returnsNormally);
      });

      test('should cleanup resources properly', () {
        expect(() => controller.cleanupResources(), returnsNormally);
      });

      test('should handle onInit lifecycle', () {
        expect(() => controller.onInit(), returnsNormally);
      });

      test('should handle onClose lifecycle', () {
        expect(() => controller.onClose(), returnsNormally);
      });

      test('should maintain data after initialization', () {
        controller.initializeController();
        
        expect(controller.contactInfo, isNotEmpty);
        expect(controller.socialLinks, isNotEmpty);
      });

      test('should maintain data after cleanup', () {
        controller.cleanupResources();
        
        // Data should still be available after cleanup
        expect(controller.contactInfo, isNotEmpty);
        expect(controller.socialLinks, isNotEmpty);
      });
    });

    group('Error Handling', () {
      test('should handle repository errors gracefully', () {
        when(mockRepository.getContactInfo())
            .thenThrow(Exception('Repository error'));
        when(mockRepository.getSocialLinks())
            .thenThrow(Exception('Repository error'));

        // Controller creation should succeed, but accessing data should throw
        final controller = ContactController(repository: mockRepository);
        expect(() => controller.contactInfo, throwsException);
        expect(() => controller.socialLinks, throwsException);
      });

      test('should handle empty contact info', () {
        when(mockRepository.getContactInfo()).thenReturn({});
        
        final controller = ContactController(repository: mockRepository);
        
        expect(controller.contactInfo, isEmpty);
      });

      test('should handle empty social links', () {
        when(mockRepository.getSocialLinks()).thenReturn({});
        
        final controller = ContactController(repository: mockRepository);
        
        expect(controller.socialLinks, isEmpty);
      });

      test('should handle null repository gracefully', () {
        // This should use GetX to find repository
        expect(() => ContactController(), returnsNormally);
      });

      test('should handle missing GetX repository', () {
        Get.reset(); // Remove registered repository

        expect(() => ContactController(), throwsA(isA<String>()));
      });
    });

    group('Data Validation', () {
      test('should validate email format', () {
        final email = controller.contactInfo['email']!;
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        
        expect(emailRegex.hasMatch(email), isTrue);
      });

      test('should validate phone format', () {
        final phone = controller.contactInfo['phone']!;
        final phoneRegex = RegExp(r'^\+\d+');
        
        expect(phoneRegex.hasMatch(phone), isTrue);
      });

      test('should validate social URLs', () {
        final socialLinks = controller.socialLinks;
        
        for (final entry in socialLinks.entries) {
          final data = entry.value;
          
          if (data.containsKey('url')) {
            final url = data['url'] as String;
            expect(Uri.tryParse(url), isNotNull);
            expect(url, startsWith('https://'));
          }
        }
      });

      test('should have non-empty required fields', () {
        final contactInfo = controller.contactInfo;
        
        expect(contactInfo['email'], isNotEmpty);
        expect(contactInfo['phone'], isNotEmpty);
        expect(contactInfo['location'], isNotEmpty);
      });

      test('should have valid social platform data', () {
        final socialLinks = controller.socialLinks;
        
        for (final entry in socialLinks.entries) {
          final platform = entry.key;
          final data = entry.value;
          
          expect(platform, isNotEmpty);
          expect(data['icon'], isNotNull);
          expect(data['color'], isNotNull);
        }
      });
    });

    group('Integration Tests', () {
      test('should work with real repository data structure', () {
        // Test with data structure that matches real repository
        when(mockRepository.getContactInfo()).thenReturn({
          'email': 'sakshamsri4@gmail.com',
          'phone': '+91 8795304811',
          'location': 'Bangalore, India',
        });
        
        when(mockRepository.getSocialLinks()).thenReturn({
          'linkedin': {
            'url': 'https://linkedin.com/in/sakshamsri/',
            'icon': 'linkedin_icon',
            'color': 'linkedin_blue',
          },
          'github': {
            'url': 'https://github.com/sakshamsri4',
            'icon': 'github_icon',
            'color': 'github_black',
          },
        });
        
        final controller = ContactController(repository: mockRepository);
        
        expect(controller.contactInfo['email'], contains('sakshamsri4'));
        expect(controller.contactInfo['phone'], contains('+91'));
        expect(controller.contactInfo['location'], contains('Bangalore'));
        
        expect(controller.socialLinks['linkedin']!['url'], 
               contains('linkedin.com/in/sakshamsri'));
        expect(controller.socialLinks['github']!['url'], 
               contains('github.com/sakshamsri4'));
      });

      test('should handle complete contact workflow', () {
        controller.initializeController();
        
        // Should have all contact methods available
        final contactInfo = controller.contactInfo;
        final socialLinks = controller.socialLinks;
        
        expect(contactInfo, isNotEmpty);
        expect(socialLinks, isNotEmpty);
        
        // Should be able to access all contact methods
        expect(contactInfo['email'], isNotNull);
        expect(contactInfo['phone'], isNotNull);
        expect(socialLinks['linkedin'], isNotNull);
        expect(socialLinks['github'], isNotNull);
        
        controller.cleanupResources();
        
        // Data should still be accessible after cleanup
        expect(controller.contactInfo, isNotEmpty);
        expect(controller.socialLinks, isNotEmpty);
      });

      test('should support multiple controller instances', () {
        final controller1 = ContactController(repository: mockRepository);
        final controller2 = ContactController(repository: mockRepository);
        
        expect(controller1.contactInfo, equals(controller2.contactInfo));
        expect(controller1.socialLinks.keys.length, 
               equals(controller2.socialLinks.keys.length));
      });
    });


  });
}
