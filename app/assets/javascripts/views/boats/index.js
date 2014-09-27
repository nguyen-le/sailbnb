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
    render: function() {
        var content = this.template({ boats: this.collection });
        this.$el.html(content);
        this.attachSubviews();
        this.renderMap();
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
