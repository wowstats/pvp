(function () {
  'use strict';

  // Load the config
  require(['config'], function () {
    // Load the application after the config
    require(['cs!loader'], function (loader) {
      loader.init();
    });
  });

})();
