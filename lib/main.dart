import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_instagram_app/models/main_class.dart';
import 'package:flutter_instagram_app/screens/home-page/home_page.dart';
import 'package:flutter_instagram_app/screens/registration_page/registration_page.dart';
import 'package:flutter_instagram_app/screens/search-page/search_page_data.dart/search_page_data.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainClass(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchPageImageData(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/main-page': (context) => MainPage(),
          '/home-page': (context) => HomePage(),
        },
        onGenerateRoute: (settings) => MaterialPageRoute<void>(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('Произошла непредвиденная ошибка!'),
              ),
            );
          },
        ),
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegistrationPage(),
    );
  }
}
