import 'package:intl/intl.dart';
import 'package:todoer/data/database/app_database.dart';

abstract class PrefillTextHelper {
  String getBookingConfirmationMessage({
    required Event event,
    required String contactName,
    List<Invitee>? invitees,
  });
}

class PrefillTextHelperImpl implements PrefillTextHelper {
  static final PrefillTextHelperImpl _instance = PrefillTextHelperImpl._();

  PrefillTextHelperImpl._();

  factory PrefillTextHelperImpl() {
    return _instance;
  }
  @override
  String getBookingConfirmationMessage({
    required Event event,
    required String contactName,
    List<Invitee>? invitees,
  }) {
    return '你好 $contactName！感謝你預約Plannable免費試玩手縫書體驗班，時間為${DateFormat('dd/MM, HH:mm').format(event.happenedAt)}，人數${invitees?.length}位，期待你的到來！若有任何問題，歡迎隨時與我們聯繫！';
  }
}
