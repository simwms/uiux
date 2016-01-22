/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'uiux',
    environment: environment,
    printNamespace: "/print",
    namespace: "api",
    roxieNamespace: "master",
    roxieHost: "https://pacific-ravine-5812.herokuapp.com",
    s3Bucket: "simwms",
    s3StorageClass: "REDUCED_REDUNDANCY",
    baseURL: '/',
    host: "http://localhost:4000",
    cookieKey: "_apiv4_key",
    printHost: "http://localhost:4000",
    printNamespace: "print",
    socketNamespace: "ws://localhost:4000/socket",
    locationType: 'auto',
    contentSecurityPolicy: { 
      'connect-src': "'self' * http://localhost:4000 ws://localhost:4000",
      "img-src": "*",
      "media-src": "'self' *",
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
    ENV.printHost = "https://evening-springs-7575.herokuapp.com";
    ENV.host = "https://evening-springs-7575.herokuapp.com";
    ENV.locationType = 'hash';
  }

  if (environment === 'production') {
    ENV.printHost = "https://evening-springs-7575.herokuapp.com";
    ENV.host = "https://evening-springs-7575.herokuapp.com";
    ENV.locationType = 'hash';
  }

  if (environment === 'sample') {
    ENV.sampleApp = true;
  }

  return ENV;
};
