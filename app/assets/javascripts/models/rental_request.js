WaterBnb.Models.RentalRequest = Backbone.Model.extend({
    initialize: function (attributes, options) {
        if (options) this.boat = options.boat;
    },
    urlRoot: function() {
        return "/api/boats/" + this.boat.id + "rental_requests";
    },
});
