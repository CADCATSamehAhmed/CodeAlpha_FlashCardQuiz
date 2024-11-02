import 'package:flash_card_quiz/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          );
        }
    );
  }
}

class HiveExample extends StatefulWidget {
  const HiveExample({super.key});

  @override
  HiveExampleState createState() => HiveExampleState();
}

class HiveExampleState extends State<HiveExample> {
  late Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('myBox');
  }

  void saveData() {
    box.put('myList', ['apple', 'banana', 'cherry']);
  }

  List<String>? getData() {
    return box.get('myList') as List<String>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save List to Hive'),
            ),
            ElevatedButton(
              onPressed: () {
                final list = getData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Retrieved: ${list?.join(', ')}')),
                );
              },
              child: const Text('Retrieve List from Hive'),
            ),
          ],
        ),
      ),
    );
  }
}