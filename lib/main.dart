import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app2/screens/audio_page.dart';
import 'package:news_app2/screens/news_page.dart';
import 'package:news_app2/screens/today_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List listPage = [
    const TodayPage(),
    const NewsPage(),
    const AudioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listPage[currentIndex] == null
            ? const Center(child: CircularProgressIndicator())
            : listPage[currentIndex],
        bottomNavigationBar: bottomNavyBar());
  }

  BottomNavyBar bottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      onItemSelected: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: const Icon(Icons.date_range_outlined),
            title: const Text("Today",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
            activeColor: Colors.red,
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: const Icon(Icons.newspaper),
            title: const Text(
              "News+",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            activeColor: Colors.red,
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: const Icon(Icons.headset_outlined),
            title: const Text("Audio", style: TextStyle(color: Colors.white)),
            textAlign: TextAlign.center,
            activeColor: Colors.red,
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: const Icon(Icons.library_books_outlined),
            title: const Text("My Page", style: TextStyle(color: Colors.white)),
            textAlign: TextAlign.center,
            activeColor: Colors.red,
            inactiveColor: Colors.black),
      ],
    );
  }
}
