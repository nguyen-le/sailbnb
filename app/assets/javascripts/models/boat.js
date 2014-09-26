WaterBnb.Models.Boat = Backbone.Model.extend({
    urlRoot: '/api/boats',
    owner: function() {
        if (!this._owner) {
            this._owner = new WaterBnb.Models.User([], { boat: this });
        }
        return this._owner;
    },
    images: function() {
        if (!this._images) {
            this._images = new WaterBnb.Collections.Images({ boat: this });
        }
        return this._images;
    },
    parse: function(resp) {
        if (resp.owner) {
            this.owner().set(resp.owner, { parse: true });
            delete resp.owner;
        }
        if (resp.images) {
            this.images().set(resp.images, { parse: true });
            delete resp.images;
        }
        return resp;
    }
});
