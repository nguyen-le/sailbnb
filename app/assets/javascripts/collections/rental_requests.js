WaterBnb.Collections.RentalRequests = Backbone.Collection.extend({
    model: WaterBnb.Models.RentalRequest,
    initialize: function(model, options) {
        if (options) this.boat = options.boat;
    },
    url: function() {
        return "/api/boats/" + this.boat.id + "/rental_requests";
    },
});
