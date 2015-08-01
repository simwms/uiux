/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'uiux',
    environment: environment,
    printNamespace: "/print",
    simwmsNamespace: "api",
    namespace: "apiv2",
    baseURL: '/',
    locationType: 'auto',
    contentSecurityPolicy: { 
      'connect-src': "'self' https://*.amazonaws.com http://*.simwms.com https://*.herokuapp.com",
      "img-src": "*",
      "media-src": "'self' http://localhost:*",
      "font-src": "*",
      "style-src": "'self' 'unsafe-inline'",
      "script-src": "'self'",
      "frame-src": "'self'"
    },
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'staging') {  
    ENV.host = "https://safe-forest-2497.herokuapp.com";
    ENV.simwmsHost = "https://safe-forest-2497.herokuapp.com";
    ENV.locationType = 'hash';
    ENV.baseURL = '/uiux';
  }

  if (environment === 'production') {
    ENV.host = "https://safe-forest-2497.herokuapp.com";
    ENV.simwmsHost = "http://api.simwms.com";
    ENV.locationType = 'hash';
  }

  return ENV;
};
