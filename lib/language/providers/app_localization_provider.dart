import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
part 'app_localization_provider.g.dart';

@riverpod
class AppLocalizationNotifier extends _$AppLocalizationNotifier
    with WidgetsBindingObserver {
  @override
  AppLocalizations build() {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(
      () {
        WidgetsBinding.instance.removeObserver(this);
      },
    );
    return lookupAppLocalizations(ui.window.locale);
  }

  
  @override
  void didChangeLocales(List<Locale>? locales) {
    // Handle locale changes, fetch localization for the new locale
    if (locales != null && locales.isNotEmpty) {
      final newLocale = locales.first;
      state = lookupAppLocalizations(newLocale);
    }
  }
}
