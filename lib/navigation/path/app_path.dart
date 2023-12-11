class AppPath {
  static const main = '/main';
  static const home = '$main/home';

  static const createBooking = '$home/createBooking';
  static const editBooking = '$home/editBooking/:eventId';

  static const settings = '$main/settings';
  static const appTheme = '$settings/app_theme';
}


extension AppPathHelper on String {
  String getAppPathWithParams({required List<String> params}) {
    if (params.isEmpty) {
      return this;
    }
    final pathSegments = this.split('/');
    final updatedPathSegments = pathSegments.map((e) {
      if (e.startsWith(':')) {
        if (params.isEmpty) {
          throw ArgumentError(
              'params length miss match with pathParamSegments');
        }
        return params.removeAt(0);
      }
      return e;
    });
    return Uri(pathSegments: updatedPathSegments).toString();
  }
}