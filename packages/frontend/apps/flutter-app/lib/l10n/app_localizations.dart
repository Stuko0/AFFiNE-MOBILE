String t(String key) => AppLocalizations.current.translate(key);

class AppLocalizations {
  static final AppLocalizations _instance = AppLocalizations._();
  static AppLocalizations get current => _instance;

  AppLocalizations._();

  late Map<String, String> _strings;

  void setLocale(String locale) {
    _strings = locale == 'es' ? _es : _en;
  }

  String translate(String key) => _strings[key] ?? key;

  static final Map<String, String> _en = {
    'app.name': 'AFFiNE',
    'signIn.title': 'Sign in to your workspace',
    'signIn.button': 'Sign In',
    'signIn.magicLink': 'Sign in with magic link',
    'signIn.noAccount': "Don't have an account?",
    'signUp.title': 'Create Account',
    'signUp.button': 'Create Account',
    'signUp.haveAccount': 'Already have an account?',
    'signIn.magic': 'Sign In',
    'workspace.select': 'Select a workspace',
    'workspace.noWorkspaces': 'No workspaces yet',
    'documents.title': 'All Documents',
    'documents.empty': 'No documents yet',
    'collections.title': 'Collections',
    'collections.empty': 'No collections',
    'tags.title': 'Tags',
    'tags.empty': 'No tags',
    'journals.title': 'Journals',
    'search.title': 'Search',
    'search.hint': 'Search documents...',
    'settings.title': 'Settings',
    'settings.appearance': 'Appearance',
    'settings.profile': 'Profile',
    'settings.subscription': 'Subscription',
    'settings.about': 'About',
    'ai.title': 'AI Copilot',
    'ai.hint': 'Ask AI Copilot...',
    'ai.empty': 'Ask anything about your workspace',
    'general.loading': 'Loading...',
    'general.error': 'An error occurred',
    'general.retry': 'Retry',
    'general.save': 'Save',
    'general.cancel': 'Cancel',
    'general.delete': 'Delete',
  };

  static final Map<String, String> _es = {
    'app.name': 'AFFiNE',
    'signIn.title': 'Inicia sesión en tu espacio de trabajo',
    'signIn.button': 'Iniciar sesión',
    'signIn.magicLink': 'Iniciar con magic link',
    'signIn.noAccount': '¿No tienes cuenta?',
    'signUp.title': 'Crear cuenta',
    'signUp.button': 'Crear cuenta',
    'signUp.haveAccount': '¿Ya tienes cuenta?',
    'signIn.magic': 'Iniciar sesión',
    'workspace.select': 'Selecciona un espacio',
    'workspace.noWorkspaces': 'No hay espacios aún',
    'documents.title': 'Documentos',
    'documents.empty': 'No hay documentos aún',
    'collections.title': 'Colecciones',
    'collections.empty': 'No hay colecciones',
    'tags.title': 'Etiquetas',
    'tags.empty': 'No hay etiquetas',
    'journals.title': 'Diario',
    'search.title': 'Buscar',
    'search.hint': 'Buscar documentos...',
    'settings.title': 'Ajustes',
    'settings.appearance': 'Apariencia',
    'settings.profile': 'Perfil',
    'settings.subscription': 'Suscripción',
    'settings.about': 'Acerca de',
    'ai.title': 'AI Copilot',
    'ai.hint': 'Pregunta a AI Copilot...',
    'ai.empty': 'Pregunta algo sobre tu espacio de trabajo',
    'general.loading': 'Cargando...',
    'general.error': 'Ocurrió un error',
    'general.retry': 'Reintentar',
    'general.save': 'Guardar',
    'general.cancel': 'Cancelar',
    'general.delete': 'Eliminar',
  };
}
