import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/vars.dart';
import 'core/shared_preferences/bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  collection = await BoxCollection.open(
    'MyFirstHiveBox',
    {'science','math','history','computer','language','other'},
    path: appDocumentDir.path,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit()..getData(),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashView(),
            );
          }
      ),
    );
  }
}