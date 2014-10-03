WaterBnb.Views.BoatsIndex = Backbone.CompositeView.extend({
    template: JST["boats/index"],
    initialize: function() {
        this.listenTo( this.collection, 'sync', this.render );
        this.listenTo( this.collection, 'add', this.addItem );
        this.$displayArea = $('.display-area');
        this.collection.each( this.addItem.bind(this) );
        this.addFeatureLink();
        setTimeout( this.addNotifications.bind(this), 1000);
    },
    events: {
        "slide #search-price" : "updatePrice",
        "slidestop #search-price" : "updateFilter",
        "click .search-style" : "updateFilter",
        "click .search-size" : "updateFilter",
        "click #resetFilter" : "pseudoResetFilter",
        "change .date-start" : "addFiltersDateLeave"
    },
    addNotifications: function () {
        $notif = $('#notifications');
        $ball = $('#ball');
        ballStyle = $('#ball')[0].style;
        $ball2 = $('#ball2');
        $light1 = $('#light-1');
        $light2 = $('#light-2');
        $ocean = $('#moving-ocean');
        $neon = $('#neon');
        $notif.on("mouseenter", function() {
            ballStyle.top = '0px';
            ballStyle.display = 'block';
            flick = null;
            flick = setInterval( function() {
                console.log("flick");
                $ball.toggleClass('l-flick');
            }, 200 );
        }.bind(this));
        $notif.on("mouseleave", function() {
            ballStyle.top = '-200px';
            clearInterval(flick);
        });
        $notif.on("click", function() {
            flick2 = null;
            flick2 = setInterval( function() {
                $ball2.toggleClass('r-flick');
            }, 250);
            $notif.off("mouseleave");
            ballStyle.top = '0px';
            audio = $('audio')[0];
            audio.play();
            var a = 0;
            var b = 0;
            boatStyle = $('#moving-boat-div')[0].style;
            oceanStyle = $ocean[0].style;
            setInterval( function() {
               boatStyle.left = (a++)+"px";
            }, 40 );
            setInterval( function() {
                oceanStyle = (b++)+"px";
            }, 20 );
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
            }, 4700 );
            setTimeout( function() {
                neonTog2 = setInterval( function() {
                   $light2.toggleClass("l2-flash");
                   $neon.toggleClass("purple-flash");
                },100 );
            }, 8000 );
            setTimeout( function() {
                clearInterval(lightTog3);
                clearInterval(neonTog2);
                $light2.removeClass("l2-flash");
                $neon.removeClass("purple-flash");
            }, 11600 );
            setTimeout( function() {
                lightTog3 = setInterval( function() {
                   $light2.toggleClass("l2-flash");
                   $neon.toggleClass("purple-flash");
                },100 );
            }, 21700 );
            $('#party-modal').on("click", function() {
                ballStyle.top = '-200px';
                clearInterval(flick);
                clearInterval(flick2);
                clearInterval(lightTog1);
                clearInterval(lightTog2);
                clearInterval(lightTog3);
                audio.load();
            });
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
            values: [0,5000],
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
