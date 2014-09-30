WaterBnb.Views.BoatNew = Backbone.CompositeView.extend({
    className: "new-boat-form",
    template: JST["boats/new"],
    initialize: function() {
    },
    events: {
        "submit form" : "createBoat",
        "click .fp-upload" : "uploadimg",
    },
    createBoat: function() {
        event.preventDefault();
        var success = function() {
            Backbone.history.navigate("#/boats/" + this.model.id, { trigger: true });
        };
        var attrs = $(event.target).serializeJSON();
        WaterBnb.boats.create( this.model.set(attrs), {
            success: success.bind(this),
            wait: true,
        });
    },
    uploadimg: function () {
        filepicker.pickMultiple(
            function(Blobs){
                console.log(JSON.stringify(Blobs));
            }
        );
    },
    render: function() {
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        return this;
    },
});
