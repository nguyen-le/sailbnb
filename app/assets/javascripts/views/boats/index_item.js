WaterBnb.Views.IndexItem = Backbone.CompositeView.extend({
    className: "index-item",
    template: JST["boats/indexitem"],
    initialize: function() {
        this.listenTo( this.model, 'sync', this.render );
    },
    render: function() {
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        return this;
    }
});
