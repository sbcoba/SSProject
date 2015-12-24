(function(factory) {
    if (typeof exports === 'object' && exports && typeof module === 'object' && module && module.exports === exports) {
        // Browserify. Attach to jQuery module.
        factory(require('jquery'));
    } else if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery'], factory);
    } else {
        // Browser globals
        factory(jQuery);
    }
}(function($) {
    var _key = {
        BACKSPACE: 8,
        TAB: 9,
        ENTER: 13,
        ESC: 27,
        END: 35,
        HOME: 36,
        ARROW_LEFT: 37,
        ARROW_UP: 38,
        ARROW_RIGHT: 39,
        ARROW_DOWN: 40,
        DELETE: 46,
        NUM0: 48,
        NUM9: 57,
        NP_NUM0: 96,
        NP_NUM9: 105,
        F1: 112,
        F12: 123
    };

    var methods = {
        init: function(options) {
            return this.each(function() {
                var $self = $(this);
                var $input = $('input[type="text"][data-autodate-field]', $self);
                var $full = $('input[data-autodate-field="full"]', $self);
                var $year = $('input[data-autodate-field="year"]', $self);
                var $month = $('input[data-autodate-field="month"]', $self);
                var $date = $('input[data-autodate-field="date"]', $self);
                var pair = $self.attr('data-autodate-pair');
                var defYear = $self.attr('data-autodate-year');
                var defMonth = $self.attr('data-autodate-month');
                var defDate = $self.attr('data-autodate-date');
                // pick up settings from data attributes
                var attributeOptions = [];
                for ( var key in $.fn.autodate.defaults) {
                    if ($self.data(key)) {
                        attributeOptions[key] = $self.data(key);
                    }
                }

                var settings = $.extend({}, $.fn.autodate.defaults, attributeOptions, options);

                $full.datepicker({
                    dateFormat: 'yymmdd',
                    onSelect: function(dateText) {
                        var yy = parseInt(dateText.substring(0, 4), 10);
                        var mm = parseInt(dateText.substring(4, 6), 10);
                        var dd = parseInt(dateText.substring(6, 8), 10);

                        $year.val(yy);
                        $month.val(mm);
                        $date.val(dd);
                    },
                    buttonImage: ctx + '/img/icon-bubble.png',
                    buttonImageOnly: true,
                    showOn: 'both',
                    beforeShow: function(e) {
                        $("#ui-datepicker-div").css("visibility", "hidden");
                        setTimeout(function() {
                            $("#ui-datepicker-div").offset({top: $(e).parent().offset().top});
                            $("#ui-datepicker-div").css("visibility", "visible");
                       }, 50);
                    }
                });

                $input.keydown(function(e) {
                    var keyCode = e.keyCode;

                    // 숫자가 아니면서 사용할 키
                    if ($.inArray(keyCode, [_key.BACKSPACE, _key.TAB, _key.ENTER, _key.ESC, _key.DELETE]) >= 0 || e.ctrlKey || e.metaKey || (keyCode >= _key.END && keyCode <= _key.ARROW_DOWN) || (keyCode >= _key.F1 && keyCode <= _key.F12)) {
                        return;
                    }

                    // 무시할 키
                    if ((e.shiftKey || (keyCode < _key.NUM0 || keyCode > _key.NUM9)) && (keyCode < _key.NP_NUM0 || keyCode > _key.NP_NUM9)) {
                        e.preventDefault();
                        return;
                    }

                    var n = (keyCode >= _key.NP_NUM0) ? keyCode - _key.NP_NUM0 : keyCode - _key.NUM0;
                    var val = parseInt(this.value + n, 10);
                    var dateField = $(this).attr('data-autodate-field');
                    var curDate = new Date();

                    if (dateField == 'year') {
                        if (('' + val).length > 4) {
                            this.value = '';
                        }
                    } else if (dateField == 'month') {
                        if ($year.val() == '') {
                            $year.val(curDate.getFullYear());
                        }
                        if (val < 1 || val > 12) {
                            this.value = '';
                        }
                    } else if (dateField == 'date') {
                        if ($year.val() == '') {
                            $year.val(curDate.getFullYear());
                        }
                        if ($month.val() == '') {
                            $month.val(curDate.getMonth() + 1);
                        }

                        var lastDate = _lastDate($year.val(), $month.val());
                        if (val < 1 || val > lastDate) {
                            this.value = '';
                        }
                    }
                }).keyup(function(e) {
                    var keyCode = e.keyCode;

                    if (this.value == '') {
                        if ($.inArray(keyCode, settings.nextKeys) >= 0) {
                            var dateField = $(this).attr('data-autodate-field');
                            var curDate = new Date();

                            switch (dateField) {
                                case 'date':
                                    if ($date.val() == '') {
                                        var d = defDate;

                                        if (':empty' != d) {
                                            if (':last' == d) {
                                                d = _lastDate($year.val(), $month.val());
                                            }
                                            if (!d && pair) {
                                                d = $('input[data-autodate-field="date"]', pair).val();
                                            }

                                            $date.val(d || curDate.getDate());
                                        }
                                    }
                                case 'month':
                                    if ($month.val() == '') {
                                        var m = defMonth;

                                        if (':empty' != m) {
                                            if (!m && pair) {
                                                m = $('input[data-autodate-field="month"]', pair).val();
                                            }

                                            $month.val(m || (curDate.getMonth() + 1));
                                        }
                                    }
                                case 'year':
                                    if ($year.val() == '') {
                                        var y = defYear;

                                        if (':empty' != y) {
                                            if (!y && pair) {
                                                y = $('input[data-autodate-field="year"]', pair).val();
                                            }

                                            $year.val(y || curDate.getFullYear());
                                        }
                                    }
                            }
                            /*
                            if ($.inArray(dateField, ['year', 'month', 'date']) >= 0 && $year.val() == '') {
                                var y = defYear;

                                if (':empty' != y) {
                                    if (!y && pair) {
                                        y = $('input[data-autodate-field="year"]', pair).val();
                                    }

                                    $year.val(y || curDate.getFullYear());
                                }
                            }
                            if ($.inArray(dateField, ['month', 'date']) >= 0 && $month.val() == '') {
                                var m = defMonth;

                                if (':empty' != m) {
                                    if (!m && pair) {
                                        m = $('input[data-autodate-field="month"]', pair).val();
                                    }

                                    $month.val(m || (curDate.getMonth() + 1));
                                }
                            }
                            if ($.inArray(dateField, ['date']) >= 0 && $date.val() == '') {
                                var d = defDate;

                                if (':empty' != d) {
                                    if (':last' == d) {
                                        d = _lastDate($year.val(), $month.val());
                                    }
                                    if (!d && pair) {
                                        d = $('input[data-autodate-field="date"]', pair).val();
                                    }

                                    $date.val(d || curDate.getDate());
                                }
                            }
                            */
                        }
                    } else {
                        var val = parseInt(this.value, 10) || 0;
                        var dateField = $(this).attr('data-autodate-field');

                        if ($.inArray(keyCode, settings.nextKeys) >= 0) {
                            if (dateField == 'date') {
                                var lastDate = _lastDate($year.val(), $month.val());

                                if (lastDate < val) {
                                    val = lastDate;
                                }
                            } else {
                                var lastDate = _lastDate($year.val(), $month.val());

                                if ($date.val() != '' && lastDate < $date.val()) {
                                    $date.val(lastDate);
                                }
                            }
                        }

                        this.value = val;
                    }
                }).blur(function() {
                    var full = '';

                    if ($year.val()) {
                        full += $year.val();
                    }
                    if ($month.val()) {
                        full += $month.val().leadingZero('00');
                    }
                    if ($date.val()) {
                        full += $date.val().leadingZero('00');
                    }

                    $full.val(full);
                }).focus(function() {
                    var dateField = $(this).attr('data-autodate-field');

                    switch (dateField) {
                        case 'month':
                            $month.val('');
                        case 'date':
                            $date.val('');
                    }
                });
            });
        },
    };

    // Private methods
    function _lastDate(y, m) {
        return new Date(y, m, 0).getDate();
    }

    // Plugin entry
    $.fn.autodate = function(method) {
        if (!this.length) {
            return this;
        }

        if (methods[method]) {
            if (!this.hasClass('ui-autodate')) {
                return this;
            }
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.autodate');
        }
    };

    // Global defaults
    $.fn.autodate.defaults = {
        nextKeys: [_key.TAB, _key.ENTER]
    };
}));