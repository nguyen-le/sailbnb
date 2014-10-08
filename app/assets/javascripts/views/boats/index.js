WaterBnb.Views.BoatsIndex = Backbone.CompositeView.extend({
    template: JST["boats/index"],
    initialize: function() {
        this.listenTo( this.collection, 'sync', this.render );
        this.listenTo( this.collection, 'add', this.addItem );
        this.$displayArea = $('.display-area');
        this.collection.each( this.addItem.bind(this) );
        this.addFeatureLink();
        setTimeout( this.addSailingBoat.bind(this), 1000);
    },
    events: {
        "slide #search-price" : "updatePrice",
        "slidestop #search-price" : "updateFilter",
        "click .search-style" : "updateFilter",
        "click .search-size" : "updateFilter",
        "click #resetFilter" : "pseudoResetFilter",
        "change .date-start" : "addFiltersDateLeave"
    },
    addDiscoBall: function () {
        $notif = $('#notifications');
        $ball = $('#ball');
        ballStyle = $('#ball')[0].style;
        $notif.on("mouseenter", function() {
            ballStyle.top = '0px';
            ballStyle.display = 'block';
            flick = null;
            flick = setInterval( function() {
                $ball.toggleClass('l-flick');
            }, 200 );
        });
        $notif.on("mouseleave", function() {
            ballStyle.top = '-200px';
            clearInterval(flick);
        });
    },
    clearIntervals: function() {
        $('#party-modal').on("click", function() {
            ballStyle.top = '-200px';
            clearInterval(flick);
            clearInterval(flick2);
            clearInterval(lightTog1);
            clearInterval(lightTog2);
            clearInterval(neonTog1);
            clearInterval(neonTog2);
            audio.load();
        });
    },
    addSailingBoat: function () {
        //this adds a moving boat animation
        //it is nothing but a little animation fun when clicking on your
        //notifications on the top right hand corner
        //slightly broken
        this.addDiscoBall();
        $light1   = $('#light-1');
        $light2   = $('#light-2');
        $ocean    = $('#moving-ocean');
        $neon     = $('#neon');
        waveStyle = $('#wave')[0].style;
        audio     = $('audio')[0];
        $notif.on("click", function() {
            $("#notif-num").addClass("read");
            flick2 = null;
            $notif.off("mouseleave");
            ballStyle.top = '0px';
            audio.play();
            var a = 0;
            var b = -4000;
            var c = -800;
            boatStyle = $('#moving-boat-div')[0].style;
            oceanStyle = $ocean[0].style;
            setInterval( function() {
               boatStyle.left = (a++)+"px";
            }, 35 );
            setInterval( function() {
                oceanStyle.left = (b++)+"px";
            }, 15 );
            setInterval( function() {
                waveStyle.left = (c++)+"px";
            }, 30 );
            lightTog1 = setInterval( function() {
               $light1.toggleClass("l-flash");
            },200 );
            setTimeout( function() {
                lightTog2 = setInterval( function() {
                   $light1.toggleClass("r-flash");
                },200 );
            }, 100 );
            setTimeout( function() {
                neonTog1 = setInterval( function() {
                   $neon.toggleClass("white-flash");
                },200 );
            }, 700 );
            //this.clearIntervals();
        }.bind(this));
    },
    addEventFeatured: function() {
        $('#featured').on("click", this.showFeatured.bind(this));
    },
    addFeatureLink: function () {
        $li = $('li#featured-li');
        $li.html("<a href=javascript:void(0) id=featured>Featured</a>");
    },
    addFiltersDate: function() {
        this.$start = this.$searchArea.find('.date-start');
        this.$leave = this.$searchArea.find('.date-stop');
        this.$start.datepicker({
            dateFormat: "mm/dd/yy",
            minDate: 0,
            numberOfMonths: [1,2]
        });
    },
    addFiltersDateLeave: function() {
        this.$leave.datepicker({
            dateFormat: "mm/dd/yy",
            minDate: this.$start.val(),
            numberOfMonths: [1,2],
        });
        setTimeout( function() {
            this.$leave.trigger("focus");
        }.bind(this), 0);
    },
    addFilterPrice: function() {
        this.$priceMin = this.$searchArea.find('#price-min');
        this.$priceMax = this.$searchArea.find('#price-max');
        this.$searchSlider = this.$searchArea.find('#search-price');
        this.$searchSlider.slider({
            animate: 'fast',
            range: true,
            min: 0,
            max: 5000,
            values: [0,20000],
            step: 100
        });
    },
    addFilters: function() {
        this.addFiltersDate();
        this.addFilterPrice();
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
        this.filteredCollection.forEach( this.addItem.bind(this) );
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
    pseudoResetFilter: function() {
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
        this.renderFilteredBoatsAndMap();
    },
    updateFilter: function() {
        this.uploadFilterDefaults();
        this.updatePrice();
        this.filteredCollection = this.collection.filter( function(boat) {
            return boat.get('price') >= this.priceArray[0] &&
                   boat.get('price') <= this.priceArray[1] &&
                   _.include(this.form.styles, boat.get('style')) &&
                   _.include(this.form.size, boat.get('size'));
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
    uploadFilterDefaults: function() {
        this.form = $('#search-form').serializeJSON();
        if (!this.form.size) this.form.size = ["4", "8", "10"];
        if (!this.form.start) this.form.start = new Date();
    },
});
