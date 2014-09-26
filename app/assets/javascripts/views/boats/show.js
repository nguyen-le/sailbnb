WaterBnb.Views.BoatShow = Backbone.CompositeView.extend({
    template: JST["boats/show"],
    initialize: function() {
        this.collection = this.model.images();
        this.listenTo( this.model, 'sync', this.render );
        this.listenTo( this.collection, 'add', this.render );
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
        var that = this;
        filepicker.pickMultiple(
            function(Blobs){
            var image = new WaterBnb.Models.Image();
            that.collection.create({
                boat_id: that.model.id,
                filepicker_url: Blobs[0].url
            });
            }
        );
    },
});
