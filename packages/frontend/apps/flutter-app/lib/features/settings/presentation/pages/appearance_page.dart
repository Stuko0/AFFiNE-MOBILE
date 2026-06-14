import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/settings_providers.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class AppearancePage extends ConsumerWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Appearance')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                _ThemeOption(
                  icon: Icons.brightness_auto_outlined,
                  title: 'System default',
                  selected: currentTheme == ThemeMode.system,
                  onTap: () => ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.system),
                ),
                const Divider(height: 1, indent: 56),
                _ThemeOption(
                  icon: Icons.light_mode_outlined,
                  title: 'Light',
                  selected: currentTheme == ThemeMode.light,
                  onTap: () => ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.light),
                ),
                const Divider(height: 1, indent: 56),
                _ThemeOption(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark',
                  selected: currentTheme == ThemeMode.dark,
                  onTap: () => ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;
  const _ThemeOption({required this.icon, required this.title, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: selected ? AppColors.primary : AppColors.textSecondary),
      title: Text(title, style: AppTypography.bodyLarge.copyWith(
        color: selected ? AppColors.primary : AppColors.textPrimary,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
      )),
      trailing: selected ? const Icon(Icons.check, color: AppColors.primary) : null,
      onTap: onTap,
    );
  }
}
