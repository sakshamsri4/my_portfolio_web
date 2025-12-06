import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    required this.controller,
    super.key,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 980;
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isWide ? 48 : 32,
        horizontal: isWide ? 40 : 24,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0B1221),
            Color(0xFF0F172A),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withAlpha(18)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withAlpha(40),
            blurRadius: 32,
            spreadRadius: 6,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(20),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: theme.colorScheme.primary.withAlpha(80),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withAlpha(120),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'AI × Mobile × Agents · 2025',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (isWide)
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.download,
                    color: Colors.white70,
                    size: 16,
                  ),
                  tooltip: 'Download CV',
                  onPressed: controller.downloadCV,
                ),
            ],
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildIntro(context)),
                    const SizedBox(width: 32),
                    Expanded(
                      child: _buildIdentityCard(context),
                    ),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntro(context),
                  const SizedBox(height: 28),
                  _buildIdentityCard(context),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIntro(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saksham Srivastava',
          style: theme.textTheme.displayMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Senior Flutter + AI engineer focused on mobile architectures, agent integrations, and reliable shipping across iOS, Android, and web.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withAlpha(220),
            fontSize: isMobile ? 16 : 18,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _Pill(text: 'Flutter specialist'),
            _Pill(text: 'AI agents & RAG'),
            _Pill(text: 'ML pipelines'),
            _Pill(text: 'Mobile architectures'),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: controller.downloadCV,
              icon: const FaIcon(FontAwesomeIcons.fileArrowDown, size: 16),
              label: const Text('Download CV'),
              style: FilledButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.black,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => controller.launchProjectUrl(
                AppConstants.githubUrl,
              ),
              icon: const FaIcon(FontAwesomeIcons.github, size: 14),
              label: const Text('GitHub'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withAlpha(90)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              ),
            ),
            if (!isMobile)
              TextButton.icon(
                onPressed: () => controller.launchProjectUrl(
                  AppConstants.linkedInUrl,
                ),
                icon: const FaIcon(FontAwesomeIcons.linkedin, size: 14),
                label: const Text(
                  'LinkedIn',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildIdentityCard(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withAlpha(6),
        border: Border.all(color: Colors.white.withAlpha(30)),
        boxShadow: [
          BoxShadow(
            color: primary.withAlpha(30),
            blurRadius: 30,
            spreadRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage(AppConstants.profileImagePath),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI × Mobile Product Engineer',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bangalore · Remote · Intl friendly',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () => controller.launchProjectUrl(
                  AppConstants.linkedInUrl,
                ),
                icon: const FaIcon(FontAwesomeIcons.linkedin, size: 18),
                color: Colors.white,
                tooltip: 'LinkedIn',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Mobile-focused engineer building AI features with a strong reliability baseline. Interested in senior roles where Flutter, agents, and ML meet production needs.',
            style: TextStyle(
              color: Colors.white.withAlpha(210),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withAlpha(32)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }
}
