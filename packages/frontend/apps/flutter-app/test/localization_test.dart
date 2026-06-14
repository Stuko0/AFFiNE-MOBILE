import 'package:flutter_test/flutter_test.dart';
import 'package:affine_app/l10n/app_localizations.dart';

void main() {
  group('AppLocalizations', () {
    late AppLocalizations l10n;

    setUp(() {
      l10n = AppLocalizations.current;
      l10n.setLocale('en');
    });

    test('returns key for unknown key', () {
      expect(l10n.translate('nonexistent'), 'nonexistent');
    });

    test('returns English translation', () {
      expect(l10n.translate('app.name'), 'AFFiNE');
      expect(l10n.translate('signIn.button'), 'Sign In');
      expect(l10n.translate('documents.title'), 'All Documents');
    });

    test('switches to Spanish', () {
      l10n.setLocale('es');
      expect(l10n.translate('signIn.button'), 'Iniciar sesión');
      expect(l10n.translate('documents.title'), 'Documentos');
      expect(l10n.translate('settings.title'), 'Ajustes');
    });

    test('switches back to English', () {
      l10n.setLocale('es');
      expect(l10n.translate('signIn.title'), 'Inicia sesión en tu espacio de trabajo');
      l10n.setLocale('en');
      expect(l10n.translate('signIn.title'), 'Sign in to your workspace');
    });
  });
}
