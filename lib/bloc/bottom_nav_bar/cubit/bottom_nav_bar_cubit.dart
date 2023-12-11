import 'package:bloc/bloc.dart';
import 'package:todoer/navigation/path/app_path.dart';

class BottomNavBarCubit extends Cubit<bool> {
  BottomNavBarCubit() : super(true);

  void appPathUpdate(String appPath) {
    if (appPath == AppPath.home ||
        appPath == AppPath.settings ||
        appPath == AppPath.calendarView) {
      emit(true);
      return;
    }
    emit(false);
  }
}
