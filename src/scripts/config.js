(function () {
  'use strict';

  require.config({
    // # Paths
    paths: {
      // ## Requirejs plugins
      text: '../../bower_components/requirejs-text/text',
      hbs: '../../bower_components/require-handlebars-plugin/hbs',
      cs: '../../bower_components/require-cs/cs',

      // ## Core Libraries
      jquery: '../../bower_components/jquery/dist/jquery',
      underscore: '../../bower_components/lodash/dist/lodash',
      backbone: '../../bower_components/backbone/backbone',
      'hbs/handlebars': '../../bower_components/require-handlebars-plugin/hbs/handlebars',

      // ## Backbone plugins
      'backbone-associations': '../../bower_components/backbone-associations/backbone-associations',

      // ## CoffeeScript Compiler
      'coffee-script': '../../bower_components/coffee-script/index'
    },

    // # Packages
    packages: [{
      name: 'less',
      location: '../../bower_components/require-less',
      main: 'less'
    }],

    // Handlebars Requirejs Plugin Configuration
    // Used when loading templates `'hbs!...'`.
    hbs: {
      templateExtension: 'html',
      helperPathCallback: function (name) {
        return 'cs!helpers/handlebars/' + name;
      }
    }
  });

})();
