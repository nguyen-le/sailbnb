WaterBnb.Views.BoatsIndex = Backbone.CompositeView.extend({
    template: JST["boats/index"],
    initialize: function() {
        this.listenTo( this.collection, 'sync', this.render );
        this.listenTo( this.collection, 'add', this.addItem );
        this.$displayArea = $('.display-area');
        this.collection.each( function(boat) {
           this.addItem(boat);
        }.bind(this) );
    },
    events: {
        "slide #search-price" : "updatePrice",
        "slidestop #search-price" : "updateFilter",
        "click .search-style" : "updateFilter",
        "click .search-size" : "updateFilter",
        "click #resetFilter" : "resetFilter"
    },
    addEventFeatured: function() {
        $('#featured').on("click", this.showFeatured.bind(this));
    },
    addFilters: function() {
        this.$searchSlider = this.$searchArea.find('#search-price');
        this.$dateStart = this.$searchArea.find('.date-start');
        this.$dateStop = this.$searchArea.find('.date-stop');
        this.$priceMin = this.$searchArea.find('#price-min');
        this.$priceMax = this.$searchArea.find('#price-max');
        this.$dateStart.datepicker();
        this.$dateStop.datepicker();
        this.$searchSlider.slider({
            animate: 'fast',
            range: true,
            min: 0,
            max: 5000,
            values: [0,5000],
            step: 100
        });
    },
    addItem: function(model) {
        var boat = this.collection.get(model.id);
        var view = new WaterBnb.Views.IndexItem({ model: boat });
        this.addSubview( '.display-area', view);
    },
    clearMarkers: function() {
        for (var i = 0; i < this.markers.length; i++) {
            this.markers[i].setMap(null);
        }
    },
    render: function() {
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
        this.attachSubviews();
        this.renderMap();
        this.$searchArea = $('#search-area');
        this.addFilters();
        this.addEventFeatured();
        return this;
    },
    renderFilteredBoatsAndMap: function () {
        this.removeSubviews(".display-area");
        this.filteredCollection.forEach( function(boat) {
           this.addItem(boat);
        }.bind(this) );
        this.setMarkers(this.map, this.filteredCollection);
    },
    renderMap: function() {
        var mapOptions = {
             center: { lat: 37.4, lng: -122.5},
             zoom: 9
        };
        this.map = new google.maps.Map(this.$('#map-canvas')[0],
                     mapOptions);
        this.markers = [];
        if (this.collection.length > 0) {
            this.setMarkers(this.map, this.collection.models);
        }
    },
    resetFilter: function() {
        this.removeSubviews(".display-area");
        this.collection.models.forEach( function(boat) {
           this.addItem(boat);
        }.bind(this) );
        this.setMarkers(this.map, this.collection.models);
    },
    setMarkers: function(map, collection) {
        this.clearMarkers();
        this.markers = [];
        for (var i = 0; i < collection.length; i++) {
            boat = collection[i];
            var myLatLng = new google.maps.LatLng(boat.get('lat'), boat.get('long'));
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
            });
            this.markers.push(marker);
        }
    },
    showFeatured: function() {
        this.filteredCollection = this.collection.filter( function(boat) {
            return boat.get('featured') === true;
        }.bind(this));
    },
    updateFilter: function() {
        var details = $('#search-form').serializeJSON();
        if (!details.size) {
            details.size = ["4", "8", "10"];
        }
        this.updatePrice();
        this.filteredCollection = this.collection.filter( function(boat) {
            return boat.get('price') >= this.priceArray[0] &&
                boat.get('price') <= this.priceArray[1] &&
                _.include(details.styles, boat.get('style')) &&
                _.include(details.size, boat.get('size'));
        }.bind(this));
        this.renderFilteredBoatsAndMap();
    },
    updatePrice: function () {
        this.priceArray = this.$searchSlider.slider("values");
        this.$priceMin.html('$' + this.priceArray[0]);
        if (this.priceArray[1] === 5000) {
            this.$priceMax.html('$' + this.priceArray[1] + "+");
        } else {
            this.$priceMax.html('$' + this.priceArray[1]);
        }
    },
});
