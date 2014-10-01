WaterBnb.Views.RequestNew = Backbone.CompositeView.extend({
    template: JST["rental_requests/new"],
    initialize: function() {
        this.listenTo( this.model, "sync", this.render );
    },
    events: {
        "submit form" : "evRequest",
        "change .date-start" : "evDateStart"
    },
    evDateStart: function() {
        this.$leave.datepicker({
            dateFormat: "mm/dd/yy",
            minDate: this.$start.val(),
            numberOfMonths: [1,2],
        });
        setTimeout( function() {
            this.$leave.trigger("focus");    
        }.bind(this), 0);
    },
    evRequest: function(event) {
        event.preventDefault();
        $submit = $('#submit-rent-req');
        $submit.css("background-color", "#5cb85c");
        $submit.val("Request Submitted");
        console.log("submitted");
    },
    addAffix: function() {
        this.$rentReq = $('#boat-show-rent-req');
        this.$rentReq.affix({
            offset: {
                top: this.$rentReq.offset().top - 110,
            },
        });
    },
    addDate: function() {
        this.$start = $('.date-start');
        this.$leave = $('.date-stop');
        this.$start.datepicker({
            dateFormat: "mm/dd/yy",
            minDate: 0,
            numberOfMonths: [1,2],

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
        var content = this.template({req: this.model});
        this.$el.html(content);
        setTimeout(this.addInputs.bind(this), 100);
        setTimeout(this.addAffix.bind(this), 100);
        return this;
    },
});
