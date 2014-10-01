WaterBnb.Collections.RentalRequests = Backbone.Collection.extend({
    model: WaterBnb.Models.RentalRequest,
    initialize: function(model, options) {
        if (options) this.boat = options.boat;
    },
    url: "/api/boats/rental_requests",
});
