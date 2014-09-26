WaterBnb.Models.User = Backbone.Model.extend({
    urlRoot: "/api/users",
    initialize: function(model, options) {
    },
    boats: function() {
        if (!this._boats) {
            this._boats = new WaterBnb.Collections.Boats([], {
                owner: this
            });
        }
        return this._boats;
    },
    parse: function(resp) {
        if (resp.boats) {
            this.boats().set(resp.boats, { parse: true });
            delete resp.boats;
        }
        return resp;
    }
});
