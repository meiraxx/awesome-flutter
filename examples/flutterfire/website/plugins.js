module.exports = [
  {
    name: 'AdMob',
    pub: 'firebase_admob',
    firebase: 'admob',
    documentation: '',
    status: 'Deprecated',
    support: {
      web: false,
      mobile: true,
      macos: false,
    },
  },
  {
    name: 'Analytics',
    pub: 'firebase_analytics',
    firebase: 'analytics',
    status: 'Beta',
    documentation: 'https://firebase.flutter.dev/docs/analytics/overview',
    support: {
      web: true,
      mobile: true,
      macos: false,
    },
  },
  {
    name: 'App Check',
    pub: 'firebase_app_check',
    firebase: 'https://firebase.google.com/docs/app-check',
    documentation: 'https://firebase.flutter.dev/docs/app-check/overview',
    status: 'Preview',
    support: {
      web: true,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Authentication',
    pub: 'firebase_auth',
    firebase: 'auth',
    status: 'Stable',
    documentation: 'https://firebase.flutter.dev/docs/auth/overview',
    support: {
      web: true,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Cloud Firestore',
    pub: 'cloud_firestore',
    firebase: 'firestore',
    status: 'Stable',
    documentation: 'https://firebase.flutter.dev/docs/firestore/overview',
    support: {
      web: true,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Cloud Functions',
    pub: 'cloud_functions',
    firebase: 'functions',
    status: 'Stable',
    documentation: 'https://firebase.flutter.dev/docs/functions/overview',
    support: {
      web: true,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Cloud Messaging',
    pub: 'firebase_messaging',
    firebase: 'cloud-messaging',
    status: 'Stable',
    documentation: 'https://firebase.flutter.dev/docs/messaging/overview',
    support: {
      web: true,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Cloud Storage',
    pub: 'firebase_storage',
    firebase: 'storage',
    status: 'Stable',
    documentation: 'https://firebase.flutter.dev/docs/storage/overview',
    support: {
      web: true,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Core',
    pub: 'firebase_core',
    firebase: '',
    status: 'Stable',
    documentation: 'https://firebase.flutter.dev/docs/core/usage',
    support: {
      web: true,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Crashlytics',
    pub: 'firebase_crashlytics',
    firebase: 'crashlytics',
    status: 'Stable',
    documentation: 'https://firebase.flutter.dev/docs/crashlytics/overview',
    support: {
      web: false,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Realtime Database',
    pub: 'firebase_database',
    firebase: 'database',
    status: 'Beta',
    documentation: 'https://firebase.flutter.dev/docs/database/overview',
    support: {
      web: false,
      mobile: true,
      macos: true,
    },
  },
  {
    name: 'Dynamic Links',
    pub: 'firebase_dynamic_links',
    firebase: 'dynamic-links',
    status: 'Beta',
    documentation:
      'https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_dynamic_links/README.md',
    support: {
      web: false,
      mobile: true,
      macos: false,
    },
  },
  {
    name: 'In-App Messaging',
    pub: 'firebase_in_app_messaging',
    firebase: 'in-app-messaging',
    status: 'Beta',
    documentation:
      'https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_in_app_messaging/README.md',
    support: {
      web: false,
      mobile: true,
      macos: false,
    },
  },
  {
    name: 'ML Custom',
    pub: 'firebase_ml_custom',
    //ml-custom page is a 404
    firebase: 'ml',
    status: 'Beta',
    documentation:
      'https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_ml_custom/README.md',
    support: {
      web: false,
      mobile: true,
      macos: false,
    },
  },
  {
    name: 'ML Kit Vision',
    pub: 'firebase_ml_vision',
    firebase: 'ml-kit',
    status: 'Deprecated',
    documentation: '',
    support: {
      web: false,
      mobile: true,
      macos: false,
    },
  },
  {
    name: 'Performance Monitoring',
    pub: 'firebase_performance',
    firebase: 'performance',
    status: 'Beta',
    documentation: 'https://firebase.flutter.dev/docs/performance/overview',
    support: {
      web: false,
      mobile: true,
      macos: false,
    },
  },
  {
    name: 'Remote Config',
    pub: 'firebase_remote_config',
    firebase: 'remote-config',
    status: 'Beta',
    documentation: 'https://firebase.flutter.dev/docs/remote-config/overview',
    support: {
      web: false,
      mobile: true,
      macos: true,
    },
  },
];