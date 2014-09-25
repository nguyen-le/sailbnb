WaterBnb.Views.BoatNew = Backbone.CompositeView.extend({
    className: "new-boat-form",
    template: JST["boats/new"],
    initialize: function() {
    },
    events: {
        "submit form" : "evCreateBoat",
    },
    evCreateBoat: function() {
        event.preventDefault();
        alert("submitting");
    },
    render: function() {
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        return this;
    },
});
