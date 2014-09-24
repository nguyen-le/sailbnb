WaterBnb.Collections.Boats = Backbone.Collection.extend({
    url: '/api/boats',
    model: WaterBnb.Models.Boat,
});

WaterBnb.boats = new WaterBnb.Collections.Boats();
