WaterBnb.Views.BoatNew = Backbone.CompositeView.extend({
    template: JST["boats/new"],
    initialize: function() {
    },
    render: function() {
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        return this;
    },
});
