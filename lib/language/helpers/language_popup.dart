import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jct/language/helpers/language.dart';
import 'package:jct/language/providers/language_provider.dart';
import 'package:jct/theme/app_theme/app_theme.dart';

class LanguagePopupMenu extends ConsumerWidget {
  const LanguagePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(localLanguageProvider);
    return PopupMenuButton(
      onSelected: (value) {
        // print("itemmTap");
        ref.read(localLanguageProvider.notifier).changeLanguage(value);
      },
      itemBuilder: (context) => [
        for (var values in Language.values)
          PopupMenuItem(
            value: values,
            child: Row(
              children: [
                Text(values.countryFlag),
                const SizedBox(width: 8.0),
                Text(values.languageName),
              ],
            ),
          )
      ],
      child: Icon(
        Icons.language_sharp,
        color: context.theme.appColors.secondary,
      ),
    );
  }
}
