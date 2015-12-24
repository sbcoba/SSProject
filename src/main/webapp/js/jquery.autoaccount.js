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
        TAB: 9,
        ENTER: 13,
        ARROW_DOWN: 40
    };

    var methods = {
        init: function(options) {
            return this.each(function() {
                var $self = $(this);
                var $icon = $('img[data-autoaccount-field="icon"]', $self)
                var $acId = $('input[data-autoaccount-field="acId"]', $self);
                var $acNm = $('input[data-autoaccount-field="acNm"]', $self);
                // pick up settings from data attributes
                var attributeOptions = [];
                for ( var key in $.fn.autoaccount.defaults) {
                    if ($self.data(key)) {
                        attributeOptions[key] = $self.data(key);
                    }
                }
                var settings = $.extend({}, $.fn.autoaccount.defaults, attributeOptions, options);

                $self.data('autoaccount-settings', settings);
                $self.addClass('ui-autoaccount');

                $icon.click(function() {
                    _dhxWinAccountSelector($acId.val(), function(acId, acNm) {
                        $acId.val(acId);
                        $acNm.val(acNm);
                        $acId.trigger({
                            type: 'keyup',
                            keyCode: 13
                        });
                    });
                });
                $acId.blur(function(e) {
                    var acId = null;
                    var acNm = '';

                    if (this.value == '') {
                        acId = $self.attr('data-autoaccount-acId');

                        if (':first' == acId) {
                            acId = BASIC_DATA.acIdCombo.options[0].value;
                            acNm = BASIC_DATA.acIdCombo.options[0].text.name;
                        } else if (':last' == acId) {
                            var lastIdx = BASIC_DATA.acIdCombo.options.length - 1;
                            acId = BASIC_DATA.acIdCombo.options[lastIdx].value;
                            acNm = BASIC_DATA.acIdCombo.options[lastIdx].text.name;
                        }
                    } else {
                        acId = this.value;
                    }

                    if (acNm == '') {
                        for ( var i in BASIC_DATA.acIdCombo.options) {
                            if (BASIC_DATA.acIdCombo.options[i].value == acId) {
                                acNm = BASIC_DATA.acIdCombo.options[i].text.name;
                            }
                        }
                    }

                    $acId.val(acId);
                    $acNm.val(acNm);

                    if (acNm == '') {
                        _dhxWinAccountSelector(acId, function(acId, acNm, cause) {
                            $acId.val(acId);
                            $acNm.val(acNm);
                            if (cause == 'GRID_ENTER_KEY') {
                                $acId.focus();
                            } else {
                                $acId.trigger({
                                    type: 'keyup',
                                    keyCode: _key.ENTER
                                });
                            }
                        });
                    }
                });
            });
        },
    };

    // Private methods

    function _dhxWinAccountSelector(acId, call) {
        var dhxWins = window.sfDhxWins;

        if (!dhxWins) {
            dhxWins = new dhtmlXWindows();
            window.sfDhxWins = dhxWins;
            dhxWins.attachViewportTo('content');

            var w = dhxWins.createWindow('codeSelector', 420, 65, 320, 300);
            w.center();
            w.setText('계정 선택');
            w.setModal(true);
            w.allowMove();
            w.button('close').attachEvent('onClick', function() {
                dhxWins.window('codeSelector').hide();
                dhxWins.window('codeSelector').setModal(false);
                return false;
            });
            w.button('park').hide();
            w.button('minmax').hide();
            w.attachEvent('onHide', function(win) {
                grid.clearSelection();
            });
            w.call = call;

            var l = w.attachLayout({
                pattern: '2E',
                cells: [{
                    id: 'a',
                    header: false
                }, {
                    id: 'b',
                    header: false
                }]
            });
            l.setSeparatorSize(0, 0);
            l.cells('a').setHeight(34);
            l.cells('a').attachObject('code-search-form');

            var grid = l.cells('b').attachGrid();
            grid.setColumnIds('rId,acId,acNm');
            grid.setHeader('ID,코드,계정과목');
            grid.setInitWidths('0,50,*');
            grid.setColAlign('left,center,left');
            grid.setColTypes('rotxt,rotxt,rotxt');
            grid.attachEvent('onRowDblClicked', function(rId, cInd) {
                _dhxGridOnSelect(grid, rId, 'GRID_MOUSE', w);
            });
            grid.attachEvent('onKeyPress', function(keyCode) {
                if (keyCode == _key.ENTER) {
                    var rId = grid.getSelectedRowId();
                    _dhxGridOnSelect(grid, rId, 'GRID_ENTER_KEY', w);
                    return false;
                }
                return true;
            });
            grid.initAndLoad({
                data: BASIC_DATA.acIdGrid,
                multiSelect: false
            });

            $('#code-search-form').submit(function(e) {
                e.preventDefault();
            });
            $('#code-search-form input[name="keyword"]').keyup(function(e) {
                if (w.isHidden()) {
                    e.preventDefault();
                    return;
                }

                var keyCode = e.keyCode;
                var keyword = this.value;
                var filtering = false;

                if (keyCode == _key.ARROW_DOWN) {
                    $(this).blur();
                    grid.setActive(true);
                } else if (keyCode == _key.ENTER) {
                    var rId = grid.getSelectedRowId();
                    if (rId) {
                        _dhxGridOnSelect(grid, rId, 'INPUT_ENTER_KEY', w);
                    } else {
                        filtering = true;
                    }
                } else {
                    filtering = true;
                }

                if (filtering) {
                    grid.filterBy(1, function(data) {
                        return data.toString().indexOf(keyword) >= 0 || grid.cells(data, 2).getValue().indexOf(keyword) >= 0;
                    });
                    grid.selectRow(0);
                }
            });
        } else {
            var w = dhxWins.window('codeSelector');

            if (!w.isHidden()) {
                return;
            }

            w.show();
            w.setModal(true);
            w.call = call;
        }

        $('#code-search-form input[name="keyword"]').focus().val(acId).trigger({
            type: 'keyup',
            keyCode: _key.ENTER
        });
    }

    function _dhxGridOnSelect(grid, rId, cause, w) {
        var acId = grid.cells(rId, 1).getValue();
        var acNm = grid.cells(rId, 2).getValue();

        if (w.call) {
            w.call(acId, acNm, cause);
        }

        w.hide();
        w.setModal(false);
    }

    // Plugin entry
    $.fn.autoaccount = function(method) {
        if (!this.length) {
            return this;
        }

        if (methods[method]) {
            if (!this.hasClass('ui-autoaccount')) {
                return this;
            }
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.autoaccount');
        }
    };

    // Global defaults
    $.fn.autoaccount.defaults = {};
}));