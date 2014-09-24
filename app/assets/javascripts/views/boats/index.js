WaterBnb.Views.BoatsIndex = Backbone.CompositeView.extend({
    template: JST["boats/index"],
    initialize: function() {
        this.listenTo( this.collection, 'sync', this.render );
        this.listenTo( this.collection, 'add', this.addItem );
        this.$itemArea = $('.display-area');
    },
    render: function() {
        this.collection.models.forEach( function(model) {
            this.addItem(model);
            console.log(model.get('name'));
        }.bind(this) );
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
        return this;
    },
    indexItemView: function(model) {
        //var view = new WaterBnb.Views.IndexItemView({ model: model });
        //this.subviews.push(view)
        //$('.subview-space').append(view.render().$el);
    },
    addItem: function(model) {
        var view = new WaterBnb.Views.IndexItem({ model: model });
        this.$itemArea.append(view.render().$el);
    }
});
