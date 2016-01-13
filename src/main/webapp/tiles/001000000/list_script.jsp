<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
    var apiUrl = '${ctx}/api/001000000/';

    $(function () {
        $('#list').tabulate({
            source: xhr,
            renderer: renderer,
            pagination: $('#paging'),
            success: function(str) {
                switch(str) {
                    case 'next':
                        return 'Aage';

                    case 'prev':
                        return 'Peeche';
                }
            }
        }).on('renderer').trigger('load');
        });

        //$('#list').trigger('load');
    });

    function showInsertForm() {
        $('#insertForm').modal();
    }

    $('#form').submit(function() {
        $.ajax({
            url : apiUrl + 'insert.do?' + $('#form').serialize(),
            type : 'GET',
            dataType : 'json',
            cache : false,
            success : function() {
            }
        });
    })

    var xhr = function() {
            $.ajax({
            url : apiUrl + 'page.do',
            type : 'GET',
            dataType : 'json',
            cache : false,
            success : function() {
                console.log("hi");
            }
        });
    };

    var renderer = function (r, c, item) {
        switch(c) {
            case 0:
                return item.sr;

            case 1:
                return item.name;

            case 2:
                return item.location;

            default:
                return item.language;
        }
    };
</script>

