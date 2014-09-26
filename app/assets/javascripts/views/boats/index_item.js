WaterBnb.Views.IndexItem = Backbone.CompositeView.extend({
    tagName: "li",
    className: "index-list col-md-6",
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
