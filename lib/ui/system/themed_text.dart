import 'package:flutter/material.dart';

/// using Material Design 3 Typography system.
/// [Material Design spec](https://m3.material.io/styles/typography/tokens)

class DisplayLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const DisplayLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class DisplayMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const DisplayMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class DisplaySmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const DisplaySmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class HeadlineLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const HeadlineLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class HeadlineMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const HeadlineMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class HeadlineSmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const HeadlineSmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class TitleLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const TitleLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class TitleMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const TitleMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class TitleSmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const TitleSmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BodyLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const BodyLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BodyMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const BodyMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BodySmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const BodySmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class LabelLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const LabelLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class LabelMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const LabelMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class LabelSmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? textColor;

  const LabelSmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
    this.fontWeight,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: fontWeight,
                color: textColor,
              ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
