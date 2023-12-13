import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

abstract class WhatsappHelper {
  Future<void> launchWhatsapp({
    required String countryCode,
    required String phoneNumber,
    String? prefillText,
  });

  Uri getWhatsappUri({
    required String countryCode,
    required String phoneNumber,
    String? prefillText,
  });
}

class WhatsappHelperImpl implements WhatsappHelper {
  static final WhatsappHelperImpl _instance = WhatsappHelperImpl._();

  WhatsappHelperImpl._();

  factory WhatsappHelperImpl() {
    return _instance;
  }

  static const iosUniversalLinkHost = 'https://wa.me';
  static const androidDeepLinkHost = 'whatsapp://send';

  @override
  Future<bool> launchWhatsapp({
    required String countryCode,
    required String phoneNumber,
    String? prefillText,
  }) async {
    final whatsappUri = getWhatsappUri(
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      prefillText: prefillText,
    );
    if (await canLaunchUrl(whatsappUri)) {
      return await launchUrl(whatsappUri);
    } else {
      throw Exception('Failed to open the whatsapp');
    }
  }

  @override
  Uri getWhatsappUri({
    required String countryCode,
    required String phoneNumber,
    String? prefillText,
  }) {
    //remove symbol and padding 0 from country code
    final normalizedCountryCode = countryCode
        .replaceAll(RegExp(r'[^\d]+'), '')
        .replaceAll(RegExp(r'^0+'), '');
    final normalizedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]+'), '');

    if (Platform.isAndroid) {
      final prefillTextQuery = prefillText != null ? '&text=$prefillText' : '';
      return Uri.parse(
        '${WhatsappHelperImpl.androidDeepLinkHost}?phone=$normalizedCountryCode$normalizedPhoneNumber$prefillTextQuery',
      );
    } else if (Platform.isIOS) {
      final prefillTextQuery = prefillText != null
          ? '&text=${Uri.encodeQueryComponent(prefillText)}'
          : '';
      return Uri.parse(
        '${WhatsappHelperImpl.iosUniversalLinkHost}/$normalizedCountryCode$normalizedPhoneNumber$prefillTextQuery',
      );
    } else {
      throw Exception('Unsupported platform');
    }
  }
}
