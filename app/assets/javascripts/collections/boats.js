WaterBnb.Collections.Boats = Backbone.Collection.extend({
    url: '/api/boats',
    model: WaterBnb.Models.Boat,
    initialize: function(model, options) {
        if (options) this.owner = options.owner;
    },
    getOrFetch: function(id) {
        var boat = WaterBnb.boats.get(id);
        if (boat) {
            boat.fetch();
        } else {
            boat = new WaterBnb.Models.Boat({ id:id });
            boat.fetch();
        }
        return boat;
    }
});

WaterBnb.boats = new WaterBnb.Collections.Boats();
