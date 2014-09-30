WaterBnb.Views.BoatShow = Backbone.CompositeView.extend({
    template: JST["boats/show"],
    initialize: function() {
        this.images = this.model.images();
        this.requests = this.model.rentalRequests();
        this.listenTo( this.model, 'sync', this.render );
        this.listenTo( this.images, 'add', this.render );
        this.listenTo( this.requests, 'add', this.addItem );
        this.$requestArea = $('#boat-show-rent-req');
        this.requests.each( function(req) {
            this.addItem(req);
        }.bind(this) );
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
