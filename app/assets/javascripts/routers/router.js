WaterBnb.Routers.Router = Backbone.Router.extend({
    initialize: function(options) {
       this.$rootEl = options.$rootEl;
       this.navbar();
    },
    routes: {
        '' : 'index',
        'boats/new' : 'new',
        'boats/:id' : 'show',
    },
    index: function () {
        WaterBnb.boats.fetch();
        var view = new WaterBnb.Views.BoatsIndex({
            collection: WaterBnb.boats
        });
        this._swapView(view);
    },
    new: function () {
        var boat = new WaterBnb.Models.Boat();
        var view = new WaterBnb.Views.BoatNew({ model: boat });
        this._swapView(view);
    },
    show: function (id) {
        var boat = WaterBnb.boats.getOrFetch(id);
        var view = new WaterBnb.Views.BoatShow({
            model: boat
        });
        this._swapView(view);
    },
    _swapView: function(view) {
        if (this._currentView) this._currentView.remove();
        this._currentView = view;
        this.$rootEl.html(view.render().$el);
    },
    navbar: function() {
        var $navbar = $('.navbar-right');
        var $li = $('<li>');
        var $a = $('<a id=list-boat href=javascript:void(0)>');
        $a.html("List my yacht");
        $li.html($a);
        $navbar.append($li);
        $a.on("click", function() {
            Backbone.history.navigate("#/boats/new", { trigger: true });
        });
    }
});
