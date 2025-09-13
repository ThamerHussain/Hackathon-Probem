import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hackathon/src/core/provider/theme_provider.dart';
import 'package:hackathon/src/design/theme/custom_theme.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;

    return Container(
      decoration: BoxDecoration(
        color: customTheme.grey800,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: customTheme.grey600, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildThemeButton(
            context: context,
            ref: ref,
            isSelected: !isDarkMode,
            icon: Icons.light_mode,
            label: 'Light',
            themeMode: ThemeMode.light,
          ),
          _buildThemeButton(
            context: context,
            ref: ref,
            isSelected: isDarkMode,
            icon: Icons.dark_mode,
            label: 'Dark',
            themeMode: ThemeMode.dark,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeButton({
    required BuildContext context,
    required WidgetRef ref,
    required bool isSelected,
    required IconData icon,
    required String label,
    required ThemeMode themeMode,
  }) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;

    return GestureDetector(
      onTap: () {
        ref.read(themeModeProvider.notifier).setThemeMode(themeMode);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? customTheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? customTheme.black : customTheme.grey300,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isSelected ? customTheme.black : customTheme.grey300,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleThemeSwitch extends ConsumerWidget {
  const SimpleThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;

    return Switch(
      value: isDarkMode,
      onChanged: (value) {
        ref.read(themeModeProvider.notifier).toggleTheme();
      },
      activeColor: customTheme.primary,
      activeTrackColor: customTheme.primary.withOpacity(0.3),
      inactiveThumbColor: customTheme.grey300,
      inactiveTrackColor: customTheme.grey600,
    );
  }
}

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>()!;

    return IconButton(
      onPressed: () {
        ref.read(themeModeProvider.notifier).toggleTheme();
      },
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
        color: customTheme.grey300,
      ),
      style: IconButton.styleFrom(
        backgroundColor: customTheme.grey800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
