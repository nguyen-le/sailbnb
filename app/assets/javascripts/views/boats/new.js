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
        var attrs = $(event.target).serializeJSON();
        this.model.set(attrs);
        WaterBnb.boats.create( this.model, {
            success: function() {
                 Backbone.history.navigate("#/boats/"+this.model.id, { trigger: true });
            },
            error: function(resp) {
                console.log(resp);
            }
        });
        alert("submitting");
    },
    render: function() {
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        return this;
    },
});
