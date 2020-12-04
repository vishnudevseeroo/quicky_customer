import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quicky_customer/pages/dashboard_screen/dashboard_view.dart';
import 'package:quicky_customer/pages/localization/app_localizations.dart';
import 'package:quicky_customer/pages/localization/language_constants.dart';
import 'package:quicky_customer/pages/login/login.dart';
import 'package:quicky_customer/pages/profile/profile.dart';
import 'package:quicky_customer/pages/select_city/select_city.dart';
import 'package:quicky_customer/pages/select_language/select_language.dart';
import 'package:quicky_customer/pages/splash_screen/splash_screen.dart';
import 'package:quicky_customer/pages/success/success_screen.dart';
import 'package:quicky_customer/pages/verificationOtp/verification_otp.dart';
import 'package:quicky_customer/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.shared = await SharedPreferences.getInstance();
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyHomePageState state =
        context.findAncestorStateOfType<_MyHomePageState>();
    state.setLocale(newLocale);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    this._fetchLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: initialNavigator,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Localization',
      theme: ThemeData(primaryColor: Colors.greenAccent[700]),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ml', 'IN'),
      ],
      locale: _locale,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: SpalshScreen(),
      routes: {
        OtpScreen.routeName: (context) => OtpScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SelectLanguageScreen.routeName: (context) => SelectLanguageScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        SelectCity.routeName: (context) => SelectCity(),
        DashboardPage.routeName: (context) => DashboardPage(),
        SuccessScreen.routeName: (context) => SuccessScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }

  _fetchLocale() async {
    Locale tempLocale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = (prefs.getString(LAGUAGE_CODE) ?? 'en');
    print(languageCode);

    switch (languageCode) {
      case ENGLISH:
        tempLocale = Locale(ENGLISH, 'US');
        break;
      case MALAYALAM:
        tempLocale = Locale(MALAYALAM, 'IN');
        break;
      default:
        tempLocale = Locale(ENGLISH, 'US');
    }
    return tempLocale;
  }
}
