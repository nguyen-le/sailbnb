WaterBnb.Views.BoatsIndex = Backbone.View.extend({
    template: JST["boats/index"],
    initialize: function() {
    },
    render: function() {
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
        return this;
    }
});
