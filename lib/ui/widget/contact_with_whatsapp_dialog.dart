import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../system/themed_text.dart';

class ContactWithWhatsAppDialog extends StatelessWidget {
  const ContactWithWhatsAppDialog({
    super.key,
    required this.contactName,
    required this.onContactWithWhatsAppTap,
    required this.onContactWithConfirmationMessageWithWhatsAppTap,
    required this.onCancelTap,
  });

  final String contactName;
  final VoidCallback onContactWithWhatsAppTap;
  final VoidCallback onContactWithConfirmationMessageWithWhatsAppTap;
  final VoidCallback onCancelTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: TitleMediumText('Wanna contact '),
            ),
            WidgetSpan(
              child: TitleMediumText(
                contactName,
                fontWeight: FontWeight.bold,
              ),
            ),
            const WidgetSpan(
              child: TitleMediumText('?'),
            ),
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: IconButton(
              onPressed: () => onContactWithWhatsAppTap(),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              icon: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 24),
                child: SvgPicture.asset(
                  'assets/whatsapp.svg',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
              child: LabelMediumText(
                'WhatsApp with confirmation message',
                fontWeight: FontWeight.bold,
                textColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () =>
                  onContactWithConfirmationMessageWithWhatsAppTap(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const LabelMediumText(
                fontWeight: FontWeight.bold,
                'Cancel',
              ),
              onPressed: () => onCancelTap(),
            ),
          )
        ],
      ),
    );
  }
}