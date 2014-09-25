WaterBnb.Views.BoatsIndex = Backbone.CompositeView.extend({
    template: JST["boats/index"],
    initialize: function() {
        this.listenTo( this.collection, 'sync', this.render );
        this.listenTo( this.collection, 'add', this.addItem );
        this.$displayArea = $('.display-area');
        if (this.collection) {
            this.collection.each( function(boat) {
               this.addItem(boat);
            }.bind(this) );
            this.render();
        }
    },
    render: function() {
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
        this.attachSubviews();
        return this;
    },
    addItem: function(model) {
        var boat = WaterBnb.boats.getOrFetch(model.id);
        var view = new WaterBnb.Views.IndexItem({ model: boat });
        this.addSubview( '.display-area', view);
    },
});
