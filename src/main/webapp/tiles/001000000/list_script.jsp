<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
    var apiUrl = '${ctx}/api/001000000/';

    $(function() {
        var xhr = function() {
            return $.ajax({
                url : apiUrl + 'page.do',
                data : {
                    currPage : arguments[0].page,
                    pageSize : 10
                },
                dataType : 'json',
                type : 'GET',
                cache : false,
            });
        };

        var renderer = function(r, c, item) {
            switch (c) {
            case 0:
                return item.cdTp;

            case 1:
                return item.cdV;

            case 2:
                return item.cdNm;

            case 3:
                return item.cdSort;

            case 4:
                return item.cdUse;

            default:
                return;
            }
        };

        $('#list').tabulate({
            source : xhr,
            renderer : renderer,
            pagination : $('#pagination'),
        }).on('loadfailure', function() {
            console.error(arguments);
            alert('Failed!');
        });

        $('#list').trigger('load');

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
</script>

