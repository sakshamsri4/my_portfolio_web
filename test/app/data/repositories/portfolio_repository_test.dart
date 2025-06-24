import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

void main() {
  group('PortfolioRepository', () {
    late PortfolioRepositoryInterface repository;

    setUp(() {
      repository = PortfolioRepository();
    });

    tearDown(() {
      repository.dispose();
    });

    group('Initialization and Disposal', () {
      test('should initialize without errors', () async {
        expect(() => repository.initialize(), returnsNormally);
        await repository.initialize();
      });

      test('should dispose without errors', () {
        expect(() => repository.dispose(), returnsNormally);
      });

      test('should be able to initialize multiple times', () async {
        await repository.initialize();
        await repository.initialize();
        // Should not throw any errors
      });
    });

    group('Tech Stack Data', () {
      test('should return non-empty tech stack list', () {
        final techStack = repository.getTechStack();
        
        expect(techStack, isNotEmpty);
        expect(techStack, isA<List<TechStackItem>>());
      });

      test('should return valid tech stack items', () {
        final techStack = repository.getTechStack();
        
        for (final item in techStack) {
          expect(item.name, isNotEmpty);
          expect(item.color, isA<Color>());
          expect(item.iconType, isA<IconType>());
          
          // Validate icon consistency
          if (item.iconType == IconType.fontAwesome) {
            expect(item.icon, isNotNull);
            expect(item.svgName, isNull);
          } else if (item.iconType == IconType.svg) {
            expect(item.svgName, isNotNull);
            expect(item.icon, isNull);
          }
        }
      });

      test('should contain expected technologies', () {
        final techStack = repository.getTechStack();
        final techNames = techStack.map((item) => item.name.toLowerCase()).toList();
        
        // Should contain core Flutter technologies
        expect(techNames, contains('flutter'));
        expect(techNames, contains('dart'));
        expect(techNames, contains('firebase'));
      });

      test('should have consistent tech stack data', () {
        final techStack1 = repository.getTechStack();
        final techStack2 = repository.getTechStack();
        
        expect(techStack1.length, equals(techStack2.length));
        
        for (int i = 0; i < techStack1.length; i++) {
          expect(techStack1[i].name, equals(techStack2[i].name));
          expect(techStack1[i].color, equals(techStack2[i].color));
          expect(techStack1[i].iconType, equals(techStack2[i].iconType));
        }
      });
    });

    group('Social Links Data', () {
      test('should return non-empty social links map', () {
        final socialLinks = repository.getSocialLinks();
        
        expect(socialLinks, isNotEmpty);
        expect(socialLinks, isA<Map<String, Map<String, dynamic>>>());
      });

      test('should contain expected social platforms', () {
        final socialLinks = repository.getSocialLinks();
        
        expect(socialLinks.keys, contains('linkedin'));
        expect(socialLinks.keys, contains('github'));
        expect(socialLinks.keys, contains('twitter'));
        expect(socialLinks.keys, contains('whatsapp'));
      });

      test('should have valid social link structure', () {
        final socialLinks = repository.getSocialLinks();
        
        for (final entry in socialLinks.entries) {
          final platform = entry.key;
          final data = entry.value;
          
          expect(data.keys, contains('icon'));
          expect(data.keys, contains('color'));
          expect(data['icon'], isA<IconData>());
          expect(data['color'], isA<Color>());
          
          // LinkedIn, GitHub, and Twitter should have URLs
          if (['linkedin', 'github', 'twitter'].contains(platform)) {
            expect(data.keys, contains('url'));
            expect(data['url'], isA<String>());
            expect(data['url'], isNotEmpty);
            expect(data['url'], startsWith('https://'));
          }
        }
      });

      test('should use correct URLs from constants', () {
        final socialLinks = repository.getSocialLinks();
        
        expect(socialLinks['linkedin']!['url'], equals(AppConstants.linkedInUrl));
        expect(socialLinks['github']!['url'], equals(AppConstants.githubUrl));
        expect(socialLinks['twitter']!['url'], equals(AppConstants.twitterUrl));
      });

      test('should have consistent social links data', () {
        final socialLinks1 = repository.getSocialLinks();
        final socialLinks2 = repository.getSocialLinks();
        
        expect(socialLinks1.keys.length, equals(socialLinks2.keys.length));
        
        for (final key in socialLinks1.keys) {
          expect(socialLinks2.keys, contains(key));
          expect(socialLinks1[key]!['icon'], equals(socialLinks2[key]!['icon']));
          expect(socialLinks1[key]!['color'], equals(socialLinks2[key]!['color']));
        }
      });
    });

    group('Animated Content Data', () {
      test('should return non-empty animated greetings', () {
        final greetings = repository.getAnimatedGreetings();
        
        expect(greetings, isNotEmpty);
        expect(greetings, isA<List<String>>());
        
        for (final greeting in greetings) {
          expect(greeting, isNotEmpty);
          expect(greeting, isA<String>());
        }
      });

      test('should return non-empty animated introductions', () {
        final introductions = repository.getAnimatedIntroductions();
        
        expect(introductions, isNotEmpty);
        expect(introductions, isA<List<String>>());
        
        for (final intro in introductions) {
          expect(intro, isNotEmpty);
          expect(intro, isA<String>());
        }
      });

      test('should return non-empty design philosophy quotes', () {
        final quotes = repository.getDesignPhilosophyQuotes();
        
        expect(quotes, isNotEmpty);
        expect(quotes, isA<List<String>>());
        
        for (final quote in quotes) {
          expect(quote, isNotEmpty);
          expect(quote, isA<String>());
        }
      });

      test('animated content should be professional', () {
        final greetings = repository.getAnimatedGreetings();
        final introductions = repository.getAnimatedIntroductions();
        
        // Check for professional terms
        final allContent = [...greetings, ...introductions].join(' ').toLowerCase();
        
        expect(allContent, contains('flutter'));
        expect(allContent, anyOf([
          contains('developer'),
          contains('architect'),
          contains('engineer'),
          contains('specialist'),
        ]));
      });

      test('should have consistent animated content', () {
        final greetings1 = repository.getAnimatedGreetings();
        final greetings2 = repository.getAnimatedGreetings();
        
        expect(greetings1.length, equals(greetings2.length));
        for (int i = 0; i < greetings1.length; i++) {
          expect(greetings1[i], equals(greetings2[i]));
        }
      });
    });

    group('Skills Categories Data', () {
      test('should return non-empty skills categories', () {
        final categories = repository.getSkillCategories();
        
        expect(categories, isNotEmpty);
        expect(categories, isA<List<Map<String, dynamic>>>());
      });

      test('should have valid skills category structure', () {
        final categories = repository.getSkillCategories();
        
        for (final category in categories) {
          expect(category.keys, contains('category'));
          expect(category.keys, contains('iconType'));
          expect(category.keys, contains('skills'));
          
          expect(category['category'], isA<String>());
          expect(category['category'], isNotEmpty);
          expect(category['iconType'], isA<String>());
          expect(category['skills'], isA<List>());
          expect(category['skills'], isNotEmpty);
          
          // Validate skills list
          final skills = category['skills'] as List;
          for (final skill in skills) {
            expect(skill, isA<String>());
            expect(skill, isNotEmpty);
          }
        }
      });

      test('should contain expected skill categories', () {
        final categories = repository.getSkillCategories();
        final categoryNames = categories
            .map((cat) => cat['category'].toString().toLowerCase())
            .toList();
        
        expect(categoryNames, contains('flutter'));
        expect(categoryNames, anyOf([
          contains('mobile'),
          contains('backend'),
          contains('database'),
        ]));
      });

      test('should have Flutter as primary skill category', () {
        final categories = repository.getSkillCategories();
        final flutterCategory = categories.firstWhere(
          (cat) => cat['category'].toString().toLowerCase().contains('flutter'),
        );
        
        expect(flutterCategory, isNotNull);
        final skills = flutterCategory['skills'] as List<String>;
        expect(skills, contains('Dart'));
        expect(skills, contains('Widgets'));
      });
    });

    group('Projects Data', () {
      test('should return non-empty projects list', () {
        final projects = repository.getProjects();
        
        expect(projects, isNotEmpty);
        expect(projects, isA<List<Map<String, String>>>());
      });

      test('should have valid project structure', () {
        final projects = repository.getProjects();
        
        for (final project in projects) {
          expect(project.keys, contains('title'));
          expect(project.keys, contains('description'));
          expect(project.keys, contains('image'));
          expect(project.keys, contains('tileImage'));
          expect(project.keys, contains('url'));
          
          expect(project['title'], isNotEmpty);
          expect(project['description'], isNotEmpty);
          expect(project['image'], isNotEmpty);
          expect(project['tileImage'], isNotEmpty);
          expect(project['url'], isNotEmpty);
          
          // Validate asset paths
          expect(project['image'], startsWith('assets/'));
          expect(project['tileImage'], startsWith('assets/'));
          
          // Validate URL format
          expect(project['url'], startsWith('https://'));
        }
      });

      test('should have professional project descriptions', () {
        final projects = repository.getProjects();
        
        for (final project in projects) {
          final description = project['description']!.toLowerCase();
          
          // Should contain technical or professional terms
          expect(description, anyOf([
            contains('flutter'),
            contains('app'),
            contains('users'),
            contains('performance'),
            contains('developed'),
            contains('architected'),
          ]));
        }
      });
    });

    group('Career Timeline Data', () {
      test('should return non-empty career timeline', () {
        final timeline = repository.getCareerTimeline();
        
        expect(timeline, isNotEmpty);
        expect(timeline, isA<List<Map<String, String>>>());
      });

      test('should have valid career entry structure', () {
        final timeline = repository.getCareerTimeline();
        
        for (final entry in timeline) {
          expect(entry.keys, contains('company'));
          expect(entry.keys, contains('role'));
          expect(entry.keys, contains('period'));
          expect(entry.keys, contains('description'));
          
          expect(entry['company'], isNotEmpty);
          expect(entry['role'], isNotEmpty);
          expect(entry['period'], isNotEmpty);
          expect(entry['description'], isNotEmpty);
          
          // Validate period format (should contain years)
          expect(entry['period'], matches(r'\d{4}'));
        }
      });

      test('should be ordered chronologically (most recent first)', () {
        final timeline = repository.getCareerTimeline();
        
        if (timeline.length > 1) {
          // Check that periods suggest chronological order
          final firstPeriod = timeline.first['period']!;
          final lastPeriod = timeline.last['period']!;
          
          // Extract years from periods
          final firstYear = RegExp(r'\d{4}').allMatches(firstPeriod).last.group(0);
          final lastYear = RegExp(r'\d{4}').allMatches(lastPeriod).first.group(0);
          
          if (firstYear != null && lastYear != null) {
            expect(int.parse(firstYear), greaterThanOrEqualTo(int.parse(lastYear)));
          }
        }
      });
    });

    group('Contact Information', () {
      test('should return valid contact info', () {
        final contactInfo = repository.getContactInfo();
        
        expect(contactInfo, isNotEmpty);
        expect(contactInfo.keys, contains('email'));
        expect(contactInfo.keys, contains('phone'));
        expect(contactInfo.keys, contains('location'));
        
        expect(contactInfo['email'], equals(AppConstants.emailAddress));
        expect(contactInfo['phone'], equals(AppConstants.phoneNumber));
        expect(contactInfo['location'], isNotEmpty);
      });

      test('should have valid email format', () {
        final contactInfo = repository.getContactInfo();
        final email = contactInfo['email']!;
        
        expect(email, contains('@'));
        expect(email, contains('.'));
        expect(RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email), isTrue);
      });

      test('should have valid phone format', () {
        final contactInfo = repository.getContactInfo();
        final phone = contactInfo['phone']!;
        
        expect(phone, startsWith('+'));
        expect(RegExp(r'^\+\d+').hasMatch(phone), isTrue);
      });
    });

    group('Education Information', () {
      test('should return non-empty education info', () {
        final education = repository.getEducationInfo();
        
        expect(education, isNotEmpty);
        expect(education, isA<List<Map<String, String>>>());
      });

      test('should have valid education entry structure', () {
        final education = repository.getEducationInfo();
        
        for (final entry in education) {
          expect(entry.keys, contains('degree'));
          expect(entry.keys, contains('institution'));
          expect(entry.keys, contains('period'));
          
          expect(entry['degree'], isNotEmpty);
          expect(entry['institution'], isNotEmpty);
          expect(entry['period'], isNotEmpty);

          // Period should contain year information
          expect(entry['period'], matches(r'\d{4}'));
        }
      });
    });

    group('Professional Summary', () {
      test('should return non-empty professional summary', () {
        final summary = repository.getProfessionalSummary();
        
        expect(summary, isNotEmpty);
        expect(summary, isA<String>());
      });

      test('should contain professional keywords', () {
        final summary = repository.getProfessionalSummary().toLowerCase();
        
        expect(summary, contains('flutter'));
        expect(summary, anyOf([
          contains('developer'),
          contains('architect'),
          contains('engineer'),
          contains('years'),
          contains('experience'),
        ]));
      });

      test('should be substantial content', () {
        final summary = repository.getProfessionalSummary();
        
        expect(summary.length, greaterThan(100));
        expect(summary.split(' ').length, greaterThan(20));
      });
    });

    group('Data Consistency', () {
      test('should return consistent data across multiple calls', () {
        final techStack1 = repository.getTechStack();
        final techStack2 = repository.getTechStack();
        final projects1 = repository.getProjects();
        final projects2 = repository.getProjects();
        
        expect(techStack1.length, equals(techStack2.length));
        expect(projects1.length, equals(projects2.length));
      });

      test('should maintain data integrity after initialization', () async {
        final beforeInit = repository.getProjects();
        await repository.initialize();
        final afterInit = repository.getProjects();
        
        expect(beforeInit.length, equals(afterInit.length));
      });
    });
  });
}
