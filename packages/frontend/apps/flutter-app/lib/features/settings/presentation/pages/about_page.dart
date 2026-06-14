import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../../../core/constants/app_constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80, height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.auto_stories, size: 44, color: AppColors.primary),
              ),
              const SizedBox(height: 20),
              Text(AppConstants.appName, style: AppTypography.headlineLarge.copyWith(color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              Text('Version ${AppConstants.appVersion}', style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 4),
              Text(AppConstants.packageName, style: AppTypography.bodySmall.copyWith(color: AppColors.textTertiary)),
              const SizedBox(height: 32),
              Text('A privacy-focused, local-first,\nopen-source workspace.',
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 32),
              Text('© 2025 ToEverything', style: AppTypography.bodySmall.copyWith(color: AppColors.textTertiary)),
            ],
          ),
        ),
      ),
    );
  }
}
