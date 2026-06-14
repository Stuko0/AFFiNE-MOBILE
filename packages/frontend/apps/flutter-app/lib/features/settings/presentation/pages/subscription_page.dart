import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Subscription')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('FREE', style: AppTypography.labelSmall.copyWith(
                            color: AppColors.primary, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Community Plan', style: AppTypography.headlineMedium.copyWith(color: AppColors.textPrimary)),
                    const SizedBox(height: 8),
                    Text('Free forever with core features', style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
                    const SizedBox(height: 20),
                    _FeatureRow(text: 'Unlimited documents'),
                    _FeatureRow(text: 'Real-time collaboration'),
                    _FeatureRow(text: 'Local-first storage'),
                    _FeatureRow(text: '1 GB cloud storage'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Upgrade to Pro'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final String text;
  const _FeatureRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check, size: 18, color: AppColors.success),
          const SizedBox(width: 10),
          Text(text, style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}
