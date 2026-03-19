import 'package:flutter_bloc/flutter_bloc.dart';

enum MainTab { home, courses, eduline, community, profile }

class MainCubit extends Cubit<MainTab> {
  MainCubit() : super(MainTab.home);

  void changeTab(MainTab tab) {
    emit(tab);
  }
}
