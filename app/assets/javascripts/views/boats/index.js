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
        $searchSlider = this.$searchArea.find('#search-price');
        $priceMin = this.$searchArea.find('#price-min');
        $priceMax = this.$searchArea.find('#price-max');
        $priceMin.html('$' + $searchSlider.slider("values")[0]);
        $priceMax.html('$' + $searchSlider.slider("values")[1]);
    },
    render: function() {
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
        this.attachSubviews();
        $('#search-price').slider({
            animate: 'fast',
            range: true,
            min: 0,
            max: 1000,
            values: [0,1000]
        });
        this.renderMap();
        this.$searchArea = $('#search-area');
        return this;
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
