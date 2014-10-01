WaterBnb.Views.BoatShow = Backbone.CompositeView.extend({
    template: JST["boats/show"],
    initialize: function() {
        this.images = this.model.images();
        this.requests = this.model.rentalRequests();
        this.listenTo( this.model, 'sync', this.render );
        this.listenTo( this.model, 'sync', this.addForm );
        this.listenTo( this.images, 'add', this.render );
        this.$requestArea = $('#boat-show-rent-req');
        this.removeFeatured();
    },
    events: {
        "click .fp-upload" : "uploadimg",
    },
    addForm: function() {
        var req = new WaterBnb.Models.RentalRequest({}, { boat: this.model });
        var view = new WaterBnb.Views.RequestNew({ model: req });
        this.addSubview('#boat-show-rent-req', view);
    },
    removeFeatured: function () {
        $('li#featured-li').empty();
    },
    render: function() {
        var content = this.template({ boat: this.model });
        this.$el.html(content);
        this.attachSubviews();
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
