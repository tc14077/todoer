import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoer/enum/app_theme_options.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeOptions> {
  AppThemeCubit() : super(AppThemeOptions.light);

  void toggleTheme() {
    if (state == AppThemeOptions.light) {
      emit(AppThemeOptions.dark);
      return;
    }
    emit(AppThemeOptions.light);
  }
}
