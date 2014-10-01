WaterBnb.Views.RequestNew = Backbone.CompositeView.extend({
    template: JST["rental_requests/new"],
    initialize: function() {
        this.listenTo( this.model, "sync", this.render );
    },
    events: {
        "submit form" : "evRequest"
    },
    evRequest: function(event) {
        event.preventDefault();
        $submit = $('#submit-rent-req');
        $submit.css("background-color", "#5cb85c");
        $submit.html("Request Submitted");
        console.log("submitted");
    },
    addDate: function() {
        this.$dateStart = $('.date-start');
        this.$dateStop = $('.date-stop');
        this.$dateStart.datepicker({
            dateFormat: "mm/dd/yy",
            minDate: 0
        });
        this.$dateStop.datepicker({
            dateFormat: "mm/dd/yy",
            minDate: 0
        });
    },
    addGuestPicker: function() {
        this.$guestPicker = $('#num-guest-dd');
        for (var i = 1; i <= 10; i++) {
            $o = $('<option>');
            $o.attr('value', i);
            if (i === 10) {
                $o.html("10+");
            } else {
                $o.html(i);
            }
            this.$guestPicker.append($o);
        }
    },
    addInputs: function() {
        this.addDate();
        this.addGuestPicker();
    },
    render: function() {
        var content = this.template();
        this.$el.html(content);
        setTimeout(this.addInputs.bind(this), 100);
        return this;
    },
});
