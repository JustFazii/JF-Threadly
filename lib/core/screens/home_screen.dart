import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:threadly/core/screens/profile_screen2.dart';
import 'package:threadly/core/screens/settings_screen.dart';
import 'package:threadly/core/widgets/round_icon_button.dart';
import 'package:threadly/features/chat/presentation/screens/chats_screen.dart';
import 'package:threadly/features/friends/presentation/screen/friends_screen.dart';
import 'package:threadly/features/posts/presentation/screens/post_screen.dart';
import 'package:threadly/features/posts/presentation/screens/videos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PostsScreen(),
    FriendsScreen(),
    VideosScreen(),
    ProfileScreen2(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAppBarText(),
              const SizedBox(width: 225),
              _buildAppBarChat(),
            ],
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 5,
          ),
          child: GNav(
            backgroundColor: Theme.of(context).colorScheme.background,
            color: Theme.of(context).colorScheme.primary,
            activeColor: Theme.of(context).colorScheme.background,
            tabBackgroundColor: Theme.of(context).colorScheme.primary,
            gap: 5,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: const EdgeInsets.all(17),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.group,
                text: 'Friends',
              ),
              GButton(
                icon: Icons.smart_display,
                text: 'Videos',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Account',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  Widget _buildAppBarText() => Text(
        'Threadly',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildAppBarChat() => InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ChatsScreen.routeName);
        },
        child: const RoundIconButton(
          icon: FontAwesomeIcons.facebookMessenger,
        ),
      );
}
