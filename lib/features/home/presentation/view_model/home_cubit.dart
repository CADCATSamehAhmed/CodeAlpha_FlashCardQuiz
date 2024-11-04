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
class DeleteFlashCardLoadingState extends HomeStates {}
class DeleteFlashCardSuccessState extends HomeStates {}
class DeleteAllFlashCardsLoadingState extends HomeStates {}
class DeleteAllFlashCardsSuccessState extends HomeStates {}

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

  Future<void> changeBottomNavBarIndex(int index) async {
    currentIndex = index;
    await getData();
    emit(ChangeNavBarIndexState());
  }

  Future<void> getData() async {
    scienceList=[];
    historyList=[];
    mathList=[];
    computerList=[];
    languageList=[];
    businessList=[];
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


  CollectionBox getCollectionBox(String cBoxString){
    var cBox = science;
    if(cBoxString == 'history'){cBox =history;}
    else if(cBoxString == 'math'){cBox =math;}
    else if(cBoxString == 'computer'){cBox =computer;}
    else if(cBoxString == 'language'){cBox =language;}
    else if(cBoxString == 'business'){cBox =business;}
    return cBox;
  }

  List getList(String cBoxString){
    var list = scienceList;
    if(cBoxString == 'history'){list =historyList;}
    else if(cBoxString == 'math'){list =mathList;}
    else if(cBoxString == 'computer'){list =computerList;}
    else if(cBoxString == 'language'){list =languageList;}
    else if(cBoxString == 'business'){list =businessList;}
    return list;
  }

  Future<void> putFlashCard(String category,String key,Map<dynamic,dynamic> value) async {
    emit(PutDataLoadingState());
    try{
      var cBox = getCollectionBox(category);
      await cBox.put(key, value);
      emit(PutDataSuccessState());
    }catch(e){
     rethrow;
    }
  }

  Future<void> deleteFlashCard(String category,String key,FlashCardModel flashCard) async {
    emit(DeleteFlashCardLoadingState());
    try{
      var cBox = getCollectionBox(category);
      List list = getList(category);
      list.remove(flashCard);
      await cBox.delete(key);
      emit(DeleteFlashCardSuccessState());
    }catch(e){
     rethrow;
    }
  }
  Future<void> deleteAllFlashCards() async {
    emit(DeleteAllFlashCardsLoadingState());
    try{
      await science.clear();
      await math.clear();
      await computer.clear();
      await history.clear();
      await language.clear();
      await business.clear();
      emit(DeleteAllFlashCardsSuccessState());
    }catch(e){
     rethrow;
    }
  }

}
