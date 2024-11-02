import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeStates {}
class HomeInitialState extends HomeStates {}
class ChangeNavBarIndexState extends HomeStates {}
class AppChangModeState extends HomeStates {}
class LogoutLoadingState extends HomeStates {}
class LogoutSuccessState extends HomeStates {}
class LogoutErrorState extends HomeStates {}

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit? _homeCubit;
  int currentIndex = 0;

  static HomeCubit get(context) {
    _homeCubit ??= BlocProvider.of(context);
    return _homeCubit!;
  }

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarIndexState());
  }
}
