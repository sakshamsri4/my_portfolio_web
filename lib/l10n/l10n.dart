import 'package:flutter/widgets.dart';
import 'package:my_portfolio_web/gen/l10n/app_localizations.dart';

export 'package:my_portfolio_web/gen/l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
