import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/ScreenDownloads/screen_download.dart';
import 'package:netflix/screens/ScreenHome/screen_home.dart';
import 'package:netflix/screens/ScreenPrime/screen_prime.dart';
import 'package:netflix/screens/ScreenSearch/screen_search.dart';
import 'package:netflix/screens/ScreenSubscription/screen_subscription.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  int selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    HomeScreen(),
    ScreenPrime(),
    ScreenSubscription(),
    ScreenDownload(),
    ScreenSearch(),
  ];


  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.outfit(fontSize: 12),
        unselectedLabelStyle: GoogleFonts.outfit(fontSize: 12),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Prime", icon: Icon(Icons.star)),
          BottomNavigationBarItem(label: "Subscription", icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(label: "Downloads", icon: Icon(Icons.download)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}



class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Subscription Screen", style: TextStyle(fontSize: 20, color: Colors.white)));
  }
}

class DownloadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Downloads Screen", style: TextStyle(fontSize: 20, color: Colors.white)));
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Search Screen", style: TextStyle(fontSize: 20, color: Colors.white)));
  }
}
