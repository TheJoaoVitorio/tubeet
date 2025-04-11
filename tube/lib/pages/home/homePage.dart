import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tube/components/header/header.dart';
import 'package:tube/components/bottomNavigationbar/bottomNavigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Página Inicial")),
    const Center(child: Text("Em Alta")),
    const Center(child: Text("Inscrições")),
    const Center(child: Text("Biblioteca")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: header(),
      body:
          isMobile
              ? _pages[_selectedIndex]
              : Row(
                children: [
                  NavigationRail(
                    selectedIndex: _selectedIndex,                    
                    onDestinationSelected: _onItemTapped,
                    selectedIconTheme: IconThemeData(color: Colors.blue),
                    selectedLabelTextStyle: GoogleFonts.oswald(color: Colors.blue),
                    labelType: NavigationRailLabelType.selected,
                    destinations: const [
                      NavigationRailDestination(                        
                        icon: Icon(LucideIcons.house),
                        selectedIcon: Icon(
                          LucideIcons.house,                
                        ),
                        label: Text("Início"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.trending_up_outlined),
                        selectedIcon: Icon(Icons.trending_up),
                        label: Text("Em Alta"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.subscriptions_outlined),
                        selectedIcon: Icon(Icons.subscriptions),
                        label: Text("Inscrições"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.video_library_outlined),
                        selectedIcon: Icon(Icons.video_library),
                        label: Text("Biblioteca"),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(child: _pages[_selectedIndex]),
                ],
              ),
      bottomNavigationBar:
          isMobile
              ? BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(LucideIcons.house),                                        
                    activeIcon: Icon(LucideIcons.house),
                    label: 'Início',
                    backgroundColor: Colors.blue
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up_outlined),
                    activeIcon: Icon(Icons.trending_up),
                    label: 'Em Alta',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.subscriptions_outlined),
                    activeIcon: Icon(Icons.subscriptions),
                    label: 'Inscrições',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_library_outlined),
                    activeIcon: Icon(Icons.video_library),
                    label: 'Biblioteca',
                  ),
                ],
              )
              : null,
    );
  }
}
