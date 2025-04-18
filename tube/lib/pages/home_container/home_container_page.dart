import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tube/components/carousel_card/carousel_card.dart';
import 'package:tube/components/header/header.dart';
import 'package:tube/pages/subscription/subscription_page.dart';
import 'package:tube/pages/treading/threading_Page.dart';

class HomeContainerPage extends StatefulWidget {
  const HomeContainerPage({super.key});

  @override
  State<HomeContainerPage> createState() => _HomeContainerPageState();
}

class _HomeContainerPageState extends State<HomeContainerPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // HomePage(),
    Threadingpage(),
    Subscriptionpage(),
    const Center(child: Text("Biblioteca")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 616;

    return Scaffold(
      appBar: Header(),
      body:
          isMobile
              ? _pages[_selectedIndex]
              : Row(
                children: [
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onItemTapped,
                    selectedIconTheme: IconThemeData(color: Colors.blue),
                    selectedLabelTextStyle: GoogleFonts.oswald(
                      color: Colors.blue,
                    ),
                    indicatorShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    labelType: NavigationRailLabelType.selected,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(LucideIcons.house),
                        selectedIcon: Icon(LucideIcons.house),
                        label: Text("Início"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.whatshot),
                        selectedIcon: Icon(Icons.whatshot),
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
                    backgroundColor: Colors.blue,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.whatshot),
                    activeIcon: Icon(Icons.whatshot),
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
