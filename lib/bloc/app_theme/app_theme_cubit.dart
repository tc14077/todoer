import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoer/enum/app_theme_options.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeOption> {
  AppThemeCubit() : super(AppThemeOption.light);

  void toggleTheme() {
    if (state == AppThemeOption.light) {
      emit(AppThemeOption.dark);
      return;
    }
    emit(AppThemeOption.light);
  }
}
