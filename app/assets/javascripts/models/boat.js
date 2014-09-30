WaterBnb.Models.Boat = Backbone.Model.extend({
    urlRoot: "/api/boats",
    owner: function() {
        if (!this._owner) {
            this._owner = new WaterBnb.Models.User([], { boat: this });
        }
        return this._owner;
    },
    images: function() {
        if (!this._images) {
            this._images = new WaterBnb.Collections.Images([], { boat: this });
        }
        return this._images;
    },
    rentalRequests: function() {
        if (!this._rentalRequests) {
            this._rentalRequests = new WaterBnb.Collections.RentalRequests(
                [],
                { boat: this }
            );
        }
        return this._rentalRequests;
    },
    parse: function(resp) {
        this.parseOwner(resp);
        this.parseImages(resp);
        this.parseRentalRequests(resp);
        return resp;
    },
    parseOwner: function(resp) {
        if (resp.owner) {
            this.owner().set(resp.owner, { parse: true });
            delete resp.owner;
        }
    },
    parseImages: function(resp) {
        if (resp.images) {
            this.images().set(resp.images, { parse: true });
            delete resp.images;
        }
    },
    parseRentalRequests: function(resp) {
        if (resp.rental_requests) {
            this.rentalRequests().set(resp.rental_requests, { parse: true });
            delete resp.rental_requests;
        }
    }

});
