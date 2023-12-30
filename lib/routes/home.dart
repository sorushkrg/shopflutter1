import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:storeshop/routes/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  var _currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        children: [
        
          // Container(
          //   color: Colors.amber,
          // ),
          
           ProfilePage(),
           Container(
            color: Colors.blue,
            child: InkWell(
                onTap: () {
                  setState(() {
                    _signOut();
                  });
                },
                child: const Center(child: Text("sorush"))),
          ),
          
        ],
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Colors.blue,
            activeTitleColor: Colors.blue.shade600,
          ),
          BottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Account'),
            backgroundColorOpacity: 0.1,
            activeColor: Colors.greenAccent.shade700,
          ),
          const BottomBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Shop'),
            activeColor: Colors.red,
          ),
          
        ],
      ),
    );
  }
}
