WaterBnb.Models.RentalRequest = Backbone.Model.extend({
    initialize: function (attributes, options) {
        if (options) this.boat = options.boat;
    },
    urlRoot: "/api/rental_requests",
});
