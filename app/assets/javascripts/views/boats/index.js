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
    },
    updatePrice: function (attribute) {
        this.$priceMin.html('$' + this.$searchSlider.slider("values")[0]);
        this.$priceMax.html('$' + this.$searchSlider.slider("values")[1]);
    },
    render: function() {
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
        this.attachSubviews();
        this.renderMap();
        this.$searchArea = $('#search-area');
        this.addFilters();
        return this;
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
            max: 1000,
            values: [0,1000]
        });
    },
    addItem: function(model) {
        var boat = WaterBnb.boats.getOrFetch(model.id);
        var view = new WaterBnb.Views.IndexItem({ model: boat });
        this.addSubview( '.display-area', view);
    },
    renderMap: function() {
          var mapOptions = {
            center: { lat: 37.4, lng: -122.5},
            zoom: 9
          };
          var map = new google.maps.Map(this.$('#map-canvas')[0],
              mapOptions);
    }
});
