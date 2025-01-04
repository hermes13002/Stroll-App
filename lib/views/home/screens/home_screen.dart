import 'package:stroll_app/app/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomLayoutBuilder(
        child: Center(
          child: Text(
            'Home Screen'
          ),
        )
      )
    );
  }
}