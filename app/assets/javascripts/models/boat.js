WaterBnb.Models.Boat = Backbone.Model.extend({
    urlRoot: '/api/boats',
    owner: function() {
        if (!this._owner) {
            this._owner = new WaterBnb.Models.User([], { boat: this });
        }
        return this._owner;
    },
    parse: function(resp) {
        if (resp.owner) {
            this.owner().set(resp.owner, { parse: true });
            delete resp.owner;
        }
        return resp;
    }
});
