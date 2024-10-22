import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jct/cubit/bottom_navigation_cubit.dart';
import 'package:jct/language/helpers/service/user_language_service.dart';
import 'package:jct/language/providers/language_provider.dart';

import 'package:jct/screens/splash_screen.dart';
import 'package:jct/screens/splash_screenn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jct/theme/app_theme/app_theme.dart';
import 'package:jct/theme/app_theme/provider/theme_provider.dart';
import 'package:jct/theme/app_theme/provider/value_provider.dart';
import 'package:jct/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserLanguageService.init();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(localLanguageProvider);
    final themeProvider = ref.watch(themeNotifierProvider);
    final valueUpdate = ref.watch(valueNotifierProvider);
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(language.languageCode),
        debugShowCheckedModeBanner: false,
        title: 'JCT',
        // themeMode: themeProvider,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.dark,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        //   textTheme: GoogleFonts.latoTextTheme(),
        // ),
        theme: AppTheme.light,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.hasData) {
              return const SplashScreenn();
            }
            return const SplashScreen();
          },
        ),
      ),
    );
  }
}
