WaterBnb.Views.BoatShow = Backbone.CompositeView.extend({
    template: JST["boats/show"],
    initialize: function() {
        this.listenTo( this.model, 'sync', this.render );
    },
    events: {
        "click .fp-upload" : "uploadimg",
    },
    render: function() {
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        return this;
    },
    uploadimg: function () {
        filepicker.pickMultiple(
            function(Blobs){
                console.log(JSON.stringify(Blobs));
            }
        );
    },
});
