<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
    var apiUrl = '${ctx}/api/001000000/';

    $(function() {
        var xhr = function(data) {
            return $.ajax({
                url : apiUrl + 'page.do',
                data : {
                    page : data.page,
                    limit : 10
                },
                dataType : 'json',
                type : 'GET',
                cache : false,
            });
        }

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
        }

        var cellClass = function(r, c, item) {
            switch (c) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                    return 'text-center text-middle';

                default:
                    return 'text-center text-middle';
            }
        }

        $('#list').tabulate({
            source : xhr,
            renderer : renderer,
            cellClass : cellClass,
            pagination : $('#pagination'),
        }).on('loadfailure', function() {
            console.error(arguments);
            alert('Failed!');
        });

        $('#list').trigger('load');

        //Grid
        mygrid = new dhtmlXGridObject('gridbox');

        mygrid.setImagePath("${ctx}/img/dhtmlx/");                 
        mygrid.setHeader("Sales,Book title,Author,Price");//the headers of columns  
        mygrid.setInitWidths("100,250,150,100");          //the widths of columns  
        mygrid.setColAlign("right,left,left,left");       //the alignment of columns   
        mygrid.setColTypes("ro,ed,ed,ed");                //the types of columns  
        mygrid.setColSorting("int,str,str,int");          //the sorting types   
        mygrid.init();      //finishes initialization and renders the grid on the page 
        
        data={
                rows:[
                    { id:1, data: ["A Time to Kill", "John Grisham", "100"]},
                    { id:2, data: ["Blood and Smoke", "Stephen King", "1000"]},
                    { id:3, data: ["The Rainmaker", "John Grisham", "-200"]}
                ]
            };
            mygrid.parse(data,"json"); //takes the name and format of the data source
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

