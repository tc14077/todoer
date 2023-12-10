import 'package:flutter/material.dart';

/// using Material Design 3 Typography system.
/// [Material Design spec](https://m3.material.io/styles/typography/tokens)

class DisplayLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const DisplayLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.displayLarge,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class DisplayMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const DisplayMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.displayMedium,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class DisplaySmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const DisplaySmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.displaySmall,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class HeadlineLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const HeadlineLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.headlineLarge,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class HeadlineMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const HeadlineMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.headlineMedium,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class HeadlineSmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const HeadlineSmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.headlineSmall,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class TitleLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TitleLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.titleLarge,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class TitleMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TitleMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.titleMedium,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class TitleSmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TitleSmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.titleSmall,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BodyLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const BodyLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.bodyLarge,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BodyMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const BodyMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class BodySmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const BodySmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.bodySmall,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class LabelLargeText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LabelLargeText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.labelLarge,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class LabelMediumText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LabelMediumText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.labelMedium,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class LabelSmallText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LabelSmallText(
    this.data, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? Theme.of(context).textTheme.labelSmall,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
