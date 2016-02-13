<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../../inc/common.jsp"%>

<!-- page.contents -->
 
<script>
    var grid;
    function doOnLoad(){
        // Grid가 표시될 Html Element의 ID(grid)를 지정하여 Grid Object를 생성한다.
        grid = new dhtmlXGridObject("grid");
        grid.setImagePath("${ctx}/js/dhtmlx/imgs");        
        //grid.setSkin("dhxacc_skyblue");        
        
        // Grid의 타이틀
        grid.setHeader("Sales,Book Title,Author,Price,In Store,Shipping,Bestseller,Date of Publication");
        // Grid의 컬럼 폭
        grid.setInitWidths("50,150,120,80,80,80,80,100");
        // Grid의 컬럼별 정렬
        grid.setColAlign("right,left,left,right,center,left,center,center");
        // Grid의 컬럼별 속성(ro : Read Only, ed : Editable, txt : Text, ch : Check Box, co : Combo Box ...)
        grid.setColTypes("ro,ed,txt,price,ch,co,ra,ro");
        // Grid의 컬럼별 속성 타입(int : 숫자, str : 문자, date : 날짜)
        grid.setColSorting("int,str,str,int,str,str,str,date");
        grid.init();
 
        // XML 데이터를 로딩하고, 로딩이 완료되면 alert이 표시된다.
        grid.load("", function(){
          //  alert("로딩 완료");
        });
 
        data={
        	    rows:[
        	        { id:1, data: ["A Time to Kill", "John Grisham", "100","200"]},
        	        { id:2, data: ["Blood and Smoke", "Stephen King", "1000"]},
        	        { id:3, data: ["The Rainmaker", "John Grisham", "-200"]}
        	    ]
        	};
        	grid.parse(data,"json"); //takes the name and format of the data source
        
        
        
    }
</script>
<title>Grid</title>
</head>
<body onload="doOnLoad();">
 
    <div id="grid" style="width:800px; height:500px;"></div>
 

	<!-- modal end -->
<!-- page.contents -->
