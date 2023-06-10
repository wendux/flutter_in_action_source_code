
dart run intl_generator:extract_to_arb --output-dir=l10n-arb lib/l10n/localization_intl.dart
flutter pub pub run intl_generator:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/localization_intl.dart l10n-arb/intl_*.arb