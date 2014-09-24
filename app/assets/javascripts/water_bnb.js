window.WaterBnb = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
      new WaterBnb.Routers.Router({ $rootEl: $('#container') });
      Backbone.history.start();
  }
};

$(document).ready(function(){
  WaterBnb.initialize();
});
