import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  ///Function for localization texts
  String get locale => this.tr();
}
