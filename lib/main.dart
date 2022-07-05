import 'dart:io';

import 'package:capstone_project_jti/ui/about_page.dart';
import 'package:capstone_project_jti/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:capstone_project_jti/page_view.dart';
import 'package:capstone_project_jti/firebase_options.dart';

/* Common */
import 'package:capstone_project_jti/common/navigation.dart';
import 'package:capstone_project_jti/common/style.dart';

/* Data */
import 'package:capstone_project_jti/data/api/destination_api_service.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/data/db/database_helper.dart';
import 'package:capstone_project_jti/data/preferences/preferences_helper.dart';
import 'package:capstone_project_jti/data/api/culinary_api_service.dart';
import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:capstone_project_jti/data/api/hotel_api_service.dart';
import 'package:capstone_project_jti/data/model/hotel.dart';

/* Helper */
import 'package:capstone_project_jti/helpers/background_service.dart';
import 'package:capstone_project_jti/helpers/notification_helper.dart';

/* Provider */
import 'package:capstone_project_jti/provider/destination/database_destination_provider.dart';
import 'package:capstone_project_jti/provider/preferences_provider.dart';
import 'package:capstone_project_jti/provider/scheduling_provider.dart';
import 'package:capstone_project_jti/provider/destination/destination_notifier.dart';
import 'package:capstone_project_jti/provider/destination/search_destination_notifier.dart';
import 'package:capstone_project_jti/provider/firebase_auth_methods.dart';
import 'package:capstone_project_jti/provider/culinary/search_culinary_notifier.dart';
import 'package:capstone_project_jti/provider/culinary/culinary_notifier.dart';
import 'package:capstone_project_jti/provider/hotel/hotel_notifier.dart';
import 'package:capstone_project_jti/provider/hotel/search_hotel_notifier.dart';

/* UI */
import 'package:capstone_project_jti/ui/auth/login_page.dart';
import 'package:capstone_project_jti/ui/auth/register_page.dart';
import 'package:capstone_project_jti/ui/favorite_page.dart';
import 'package:capstone_project_jti/ui/destination/detail_page.dart';
import 'package:capstone_project_jti/ui/destination/rekomendasi_page.dart';
import 'package:capstone_project_jti/ui/destination/search_page.dart';
import 'package:capstone_project_jti/ui/destination/terbaru_page.dart';
import 'package:capstone_project_jti/ui/culinary/detail_page.dart';
import 'package:capstone_project_jti/ui/culinary/home_page.dart';
import 'package:capstone_project_jti/ui/culinary/rekomendasi_page.dart';
import 'package:capstone_project_jti/ui/culinary/terbaru_page.dart';
import 'package:capstone_project_jti/ui/culinary/search_page.dart';
import 'package:capstone_project_jti/ui/hotel/detail_page.dart';
import 'package:capstone_project_jti/ui/hotel/home_page.dart';
import 'package:capstone_project_jti/ui/hotel/rekomendasi_page.dart';
import 'package:capstone_project_jti/ui/hotel/search_page.dart';
import 'package:capstone_project_jti/ui/hotel/terbaru_page.dart';

/* External */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    systemNavigationBarColor: primaryColor,
  ));

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseDestinationProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(
          create: (_) => SchedulingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(sharedPreferences: SharedPreferences.getInstance()),
          ),
        ),

        /* Destination */

        ChangeNotifierProvider<DestinationProvider>(
          create: (_) => DestinationProvider(apiService: DestinationApiService()),
        ),
        ChangeNotifierProvider<SearchDestinationProvider>(
          create: (_) => SearchDestinationProvider(apiService: DestinationApiService()),
        ),

        /* Hotel */
        ChangeNotifierProvider<HotelProvider>(
          create: (_) => HotelProvider(apiService: HotelApiService()),
        ),
        ChangeNotifierProvider<SearchDestinationProvider>(
          create: (_) => SearchDestinationProvider(apiService: DestinationApiService()),
        ),
        ChangeNotifierProvider<SearchHotelProvider>(
          create: (_) => SearchHotelProvider(apiService: HotelApiService()),
        ),

        /* Culinary */

        ChangeNotifierProvider<CulinaryProvider>(
          create: (_) => CulinaryProvider(apiService: CulinaryApiService()),
        ),
        ChangeNotifierProvider<SearchCulinaryProvider>(
          create: (_) => SearchCulinaryProvider(apiService: CulinaryApiService()),
        ),
      ],
      child: Consumer<PreferencesProvider>(builder: (context, provider, child) {
        return MaterialApp(
          title: 'Jogja Travel Information',
          debugShowCheckedModeBanner: false,
          theme: provider.themeData,
          navigatorKey: navigatorKey,
          home: const SplashScreenPage(),
          routes: {
            /* Auth */
            RegisterPage.routeName: (context) => const RegisterPage(),
            LoginPage.routeName: (context) => const LoginPage(),

            /* Main */
            MyPageView.routeName: (context) => const MyPageView(),
            FavoritePage.routeName: (context) => const FavoritePage(),
            AboutPage.routeName: (context) => const AboutPage(),

            /* Destination */
            DestinationSearchPage.routeName: (context) => const DestinationSearchPage(),
            DestinationDetailPage.routeName: (context) =>
                DestinationDetailPage(destinations: ModalRoute.of(context)?.settings?.arguments as DestinationResult),
            DestinationTerbaruPage.routeName: (context) =>
                DestinationTerbaruPage(destination: ModalRoute.of(context)?.settings?.arguments as DestinationResult),
            DestinationRekomendasiPage.routeName: (context) => DestinationRekomendasiPage(
                destination: ModalRoute.of(context)?.settings?.arguments as DestinationResult),

            /* Hotel */
            HotelSearchPage.routeName: (context) => const HotelSearchPage(),
            HotelHomePage.routeName: (context) => const HotelHomePage(),
            HotelDetailPage.routeName: (context) =>
                HotelDetailPage(hotels: ModalRoute.of(context)?.settings?.arguments as HotelResult),
            HotelTerbaruPage.routeName: (context) =>
                HotelTerbaruPage(hotel: ModalRoute.of(context)?.settings?.arguments as HotelResult),
            HotelRekomendasiPage.routeName: (context) =>
                HotelRekomendasiPage(hotel: ModalRoute.of(context)?.settings?.arguments as HotelResult),

            /* Culinary */
            CulinaryHomePage.routeName: (context) =>
                CulinaryHomePage(culinaries: ModalRoute.of(context)?.settings?.arguments as CulinaryResult),
            CulinarySearchPage.routeName: (context) => const CulinarySearchPage(),
            CulinaryDetailPage.routeName: (context) =>
                CulinaryDetailPage(culinaries: ModalRoute.of(context)?.settings?.arguments as CulinaryResult),
            CulinaryTerbaruPage.routeName: (context) =>
                CulinaryTerbaruPage(culinary: ModalRoute.of(context)?.settings?.arguments as CulinaryResult),
            CulinaryRekomendasiPage.routeName: (context) =>
                CulinaryRekomendasiPage(culinary: ModalRoute.of(context)?.settings?.arguments as CulinaryResult),
          },
        );
      }),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return const MyPageView();
    }
    return const LoginPage();
  }
}
