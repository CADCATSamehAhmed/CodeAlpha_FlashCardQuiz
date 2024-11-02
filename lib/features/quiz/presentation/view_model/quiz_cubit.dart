import 'package:flutter_bloc/flutter_bloc.dart';

abstract class QuizStates {}
class QuizInitialState extends QuizStates {}
class ChangeQuizIndexState extends QuizStates {}
class AppChangModeState extends QuizStates {}
class LogoutLoadingState extends QuizStates {}
class LogoutSuccessState extends QuizStates {}
class LogoutErrorState extends QuizStates {}

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit() : super(QuizInitialState());
  static QuizCubit? _quizCubit;
  int quizIndex = 0;

  static QuizCubit get(context) {
    _quizCubit ??= BlocProvider.of(context);
    return _quizCubit!;
  }

  void changeQuizIndex(int index) {
    quizIndex = index;
    emit(ChangeQuizIndexState());
  }
}
