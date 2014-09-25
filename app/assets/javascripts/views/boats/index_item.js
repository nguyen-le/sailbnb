WaterBnb.Views.IndexItem = Backbone.CompositeView.extend({
    className: "col-md-5",
    template: JST["boats/indexitem"],
    initialize: function() {
        this.listenTo( this.model, 'sync', this.render );
    },
    render: function() {
        console.log(this.model);
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        return this;
    }
});
