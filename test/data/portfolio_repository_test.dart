import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';

void main() {
  group('PortfolioRepository', () {
    late PortfolioRepository repository;

    setUp(() {
      repository = PortfolioRepository();
    });

    test('getTechStack returns non-empty list of TechStackItems', () {
      final techStack = repository.getTechStack();

      expect(techStack, isA<List<TechStackItem>>());
      expect(techStack, isNotEmpty);

      // Verify structure of tech stack items
      for (final item in techStack) {
        expect(item.name, isNotEmpty);
        expect(item.color, isA<Color>());

        // Check that either icon or svgName is provided based on iconType
        if (item.iconType == IconType.fontAwesome) {
          expect(item.icon, isNotNull);
        } else if (item.iconType == IconType.svg) {
          expect(item.svgName, isNotNull);
          expect(item.svgName, isNotEmpty);
        }
      }
    });

    test('getSocialLinks returns map with required keys', () {
      final socialLinks = repository.getSocialLinks();

      expect(socialLinks, isA<Map<String, Map<String, dynamic>>>());
      expect(socialLinks, isNotEmpty);

      // Check for required social platforms
      expect(socialLinks.containsKey('linkedin'), isTrue);
      expect(socialLinks.containsKey('github'), isTrue);

      // Verify structure of social links
      for (final entry in socialLinks.entries) {
        expect(entry.value.containsKey('icon'), isTrue);
        expect(entry.value.containsKey('color'), isTrue);

        // WhatsApp doesn't have a URL, so we need to check conditionally
        if (entry.key != 'whatsapp') {
          expect(entry.value.containsKey('url'), isTrue);
          expect(entry.value['url'], isA<String>());
          expect(entry.value['url'], isNotEmpty);
        }
      }
    });

    test('getAnimatedGreetings returns non-empty list of strings', () {
      final greetings = repository.getAnimatedGreetings();

      expect(greetings, isA<List<String>>());
      expect(greetings, isNotEmpty);

      for (final greeting in greetings) {
        expect(greeting, isNotEmpty);
      }
    });

    test('getProjects returns non-empty list of project maps', () {
      final projects = repository.getProjects();

      expect(projects, isA<List<Map<String, String>>>());
      expect(projects, isNotEmpty);

      // Verify structure of project maps
      for (final project in projects) {
        expect(project.containsKey('title'), isTrue);
        expect(project.containsKey('description'), isTrue);
        expect(project.containsKey('image'), isTrue);
        expect(project.containsKey('url'), isTrue);
        expect(project['title'], isNotEmpty);
        expect(project['description'], isNotEmpty);
        expect(project['image'], isNotEmpty);
        expect(project['url'], isNotEmpty);
      }
    });

    test('getCareerTimeline returns non-empty list of career entries', () {
      final timeline = repository.getCareerTimeline();

      expect(timeline, isA<List<Map<String, String>>>());
      expect(timeline, isNotEmpty);

      // Verify structure of career timeline entries
      for (final entry in timeline) {
        expect(entry.containsKey('company'), isTrue);
        expect(entry.containsKey('role'), isTrue);
        expect(entry.containsKey('period'), isTrue);
        expect(entry.containsKey('description'), isTrue);
        expect(entry['company'], isNotEmpty);
        expect(entry['role'], isNotEmpty);
        expect(entry['period'], isNotEmpty);
        expect(entry['description'], isNotEmpty);
      }
    });

    test('getContactInfo returns map with required contact details', () {
      final contactInfo = repository.getContactInfo();

      expect(contactInfo, isA<Map<String, String>>());
      expect(contactInfo, isNotEmpty);

      // Check for required contact information
      expect(contactInfo.containsKey('email'), isTrue);
      expect(contactInfo.containsKey('phone'), isTrue);
      expect(contactInfo['email'], isNotEmpty);
      expect(contactInfo['phone'], isNotEmpty);
    });
  });
}
