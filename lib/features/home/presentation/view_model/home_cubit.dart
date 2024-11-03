import 'package:flash_card_quiz/core/constants/vars.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


abstract class HomeStates {}
class HomeInitialState extends HomeStates {}
class ChangeNavBarIndexState extends HomeStates {}
class GetDataLoadingState extends HomeStates {}
class GetDataSuccessState extends HomeStates {}
class PutDataLoadingState extends HomeStates {}
class PutDataSuccessState extends HomeStates {}

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit? _homeCubit;
  int currentIndex = 0;
  late CollectionBox science;
  late CollectionBox history;
  late CollectionBox math;
  late CollectionBox computer;
  late CollectionBox language;
  late CollectionBox business;
  List<FlashCardModel> scienceList=[];
  List<FlashCardModel> historyList=[];
  List<FlashCardModel> mathList=[];
  List<FlashCardModel> computerList=[];
  List<FlashCardModel> languageList=[];
  List<FlashCardModel> businessList=[];

  static HomeCubit get(context) {
    _homeCubit ??= BlocProvider.of(context);
    return _homeCubit!;
  }

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarIndexState());
  }
  Future<void> getData() async {
    emit(GetDataLoadingState());
    science = await collection.openBox<Map>('science');
    history = await collection.openBox<Map>('history');
    math = await collection.openBox<Map>('math');
    computer = await collection.openBox<Map>('computer');
    language = await collection.openBox<Map>('language');
    business = await collection.openBox<Map>('business');
    final scienceMap =await science.getAllValues();
    scienceMap.forEach((key,value){
      scienceList.add(FlashCardModel.fromMap(value));
    });
    final historyMap =await history.getAllValues();
    historyMap.forEach((key,value){
      historyList.add(FlashCardModel.fromMap(value));
    });
    final mathMap =await math.getAllValues();
    mathMap.forEach((key,value){
      mathList.add(FlashCardModel.fromMap(value));
    });
    final languageMap =await language.getAllValues();
    languageMap.forEach((key,value){
      languageList.add(FlashCardModel.fromMap(value));
    });
    final computerMap =await computer.getAllValues();
    computerMap.forEach((key,value){
      computerList.add(FlashCardModel.fromMap(value));
    });
    final businessMap =await business.getAllValues();
    businessMap.forEach((key,value){
      businessList.add(FlashCardModel.fromMap(value));
    });
    emit(GetDataSuccessState());
  }

  Future<void> putFlashCard(int cBoxId,String key,Map<dynamic,dynamic> value) async {
    emit(PutDataLoadingState());
    try{
      var cBox = science;
      if(cBoxId == 1){cBox =history;}
      else if(cBoxId == 2){cBox =math;}
      else if(cBoxId == 3){cBox =computer;}
      else if(cBoxId == 4){cBox =language;}
      else if(cBoxId == 5){cBox =business;}
      await cBox.put(key, value);
    }catch(e){
     rethrow;
    }
    emit(PutDataSuccessState());
  }

}
