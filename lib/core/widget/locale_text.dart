import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extension/string_extension.dart';

///Text widget for localization
class LocaleText extends StatelessWidget {
  const LocaleText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text.locale);
  }
}
