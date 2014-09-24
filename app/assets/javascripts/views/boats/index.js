WaterBnb.Views.BoatsIndex = Backbone.CompositeView.extend({
    template: JST["boats/index"],
    initialize: function() {
        this.listenTo( this.collection, 'sync', this.render );
        this.listenTo( this.collection, 'add', this.addItem );
        this.$displayArea = $('.display-area');
    },
    render: function() {
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
				this.attachSubviews();
        return this;
    },
    indexItemView: function(model) {
        //var view = new WaterBnb.Views.IndexItemView({ model: model });
        //this.subviews.push(view)
        //$('.subview-space').append(view.render().$el);
    },
    addItem: function(model) {
        var view = new WaterBnb.Views.IndexItem({ model: model });
        this.addSubview( '.display-area', view);
    }
});
