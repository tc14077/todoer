import 'package:flutter/material.dart';

import '../data/setting/general_setting_item.dart';
import '../navigation/path/app_path.dart';

enum GeneralSettingItems { appTheme }

extension GeneralSettingItemsExtension on GeneralSettingItems {
  GeneralSettingItem get model {
    switch (this) {
      case GeneralSettingItems.appTheme:
        return GeneralSettingItem(
          appPath: AppPath.appTheme,
          displayName: 'Themes',
          icon: const Icon(Icons.dark_mode),
        );
    }
  }
}
