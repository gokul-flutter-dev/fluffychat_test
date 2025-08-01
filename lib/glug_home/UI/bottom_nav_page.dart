import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavPage extends StatefulWidget {
   final Widget child;
  const BottomNavPage({super.key, required this.child});
 
  @override
  State<BottomNavPage> createState() => _HomePageState();
}

class _HomePageState extends State<BottomNavPage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

   int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.routerDelegate.currentConfiguration.uri.toString();
    if (location.startsWith('/glugHome')) {
      return 0;
    }
    if (location.startsWith('/rooms')) {
      return 1;
    }
    if (location.startsWith('/account')) {
      return 2;
    }
    return 0;
  }
  void onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/glugHome');
      case 1:
        return context.go('/rooms');
      case 2:
        return context.go('/account');
      default:
        return context.go('/home');
    }
  }
}