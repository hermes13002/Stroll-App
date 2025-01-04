import 'package:stroll_app/app/imports.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll_app/views/home/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      BonfireScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icons/poker_cards.svg"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[300],
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/home": (final context) => HomeScreen(),
            "/bonfire": (final context) => const BonfireScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icons/bonfire.svg"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[300],
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/home": (final context) => HomeScreen(),
            "/bonfire": (final context) => const BonfireScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icons/chat.svg"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[300],
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/home": (final context) => HomeScreen(),
            "/bonfire": (final context) => const BonfireScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/icons/user.svg"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[300],
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/home": (final context) => HomeScreen(),
            "/bonfire": (final context) => const BonfireScreen(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.all(8),
      backgroundColor: AppColors.bottomNavColor,
      isVisible: true,
      decoration: NavBarDecoration(
        colorBehindNavBar: AppColors.secondaryColor,
      ),
      animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style5, // Choose the nav bar style with this property
    );
  }
}