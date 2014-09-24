WaterBnb.Routers.Router = Backbone.Router.extend({
    initialize: function(options) {
       this.$rootEl = options.$rootEl;
       this.navbar();
    },
    routes: {
        '' : 'index',
    },
    index: function () {
        WaterBnb.boats.fetch();
        var view = new WaterBnb.Views.BoatsIndex({
            collection: WaterBnb.boats
        });
        this._swapView(view);
    },
    _swapView: function(view) {
        if (this._currentView) this._currentView.remove();
        this._currentView = view;
        this.$rootEl.html(view.render().$el);
    },
    navbar: function() {
        console.log('navbar loaded');
    }
});
