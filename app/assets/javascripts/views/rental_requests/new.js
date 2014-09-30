WaterBnb.Views.RequestNew = Backbone.CompositeView.extend({
    template: JST["rental_requests/new"],
    initialize: function() {
        this.listenTo( this.collection, "sync", this.render );
        this.$requestArea = $('#boat-show-rent-req');
        this.collection.each( function(req) {
            this.addItem(req);
        }.bind(this) );
    },
    render: function() {
        var content = this.template();
        this.$el.html(content);
        return this;
    },
});
