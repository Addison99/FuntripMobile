import 'package:flutter/material.dart';
import 'package:fun_trip_v2/view/HistoryScreen.dart';
import 'package:fun_trip_v2/view/NotificationScreen.dart';
import 'package:fun_trip_v2/view/SettingScreen.dart';
import 'package:fun_trip_v2/view/WalletScreen.dart';
import 'Map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget getBody() {
    if (_selectedIndex == 0) {
      return const Map();
    }
    else if (_selectedIndex == 1) {
      return const NotificationScreen();
    }
    else if(_selectedIndex == 2){
      return const HistoryScreen();
    }
    else if(_selectedIndex == 3){
      return const WalletScreen();
    }
    else{
      return const SettingScreen();
    }

  }

  void onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/fun_trip_logo.png',
          height: 120,
          width: 120,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: getBody(),
      drawer: drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          onTapHandler(index);
        },
        selectedItemColor: Colors.purple.shade500,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        showUnselectedLabels: false,
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xff764abc)),
            accountName: Text("Quyennv"),
            accountEmail: Text("QuyennvSE151339@fpt.edu.vn",
                style: TextStyle(fontWeight: FontWeight.bold)),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
          ),
          ListTile(
            leading: Icon(Icons.wallet),
            title: Text('Wallet'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
      ),
    );
  }
}
