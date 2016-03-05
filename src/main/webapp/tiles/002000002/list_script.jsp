<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.List" %>
<%@ include file="../../inc/common.jsp"%>
<script>
	var apiUrl = '${ctx}/api/002000002/';
	var tab = $('#list')

	var grid;
//function doOnLoad(){
    // Grid가 표시될 Html Element의 ID(grid)를 지정하여 Grid Object를 생성한다.
    grid = new dhtmlXGridObject("grid");
    grid.setImagePath("${ctx}/js/dhtmlx/imgs");        
    //grid.setSkin("dhxacc_skyblue");        
    
    // Grid의 타이틀
    grid.setHeader("f_SEQ, f_NM, f_KIND, f_UNIT, f_YEAR, 비고");
    // Grid의 컬럼 폭
    grid.setInitWidths("100,150,120,100,100,100");
    // Grid의 컬럼별 정렬
    grid.setColAlign("center,center,center,center,center,center");
    // Grid의 컬럼별 속성(ro : Read Only, ed : Editable, txt : Text, ch : Check Box, co : Combo Box ...)
    grid.setColTypes("ed,ed,ed,ed,ed,ed");
    // Grid의 컬럼별 속성 타입(int : 숫자, str : 문자, date : 날짜)
    grid.setColSorting("str,str,str,str,str,str");
    grid.init();
		
	$(function() {			
		/*tabulate 선언(그리드 출력)*/
		   
		var xhr = function(data) {
			
			return $.ajax({
				url  : apiUrl + 'page.do',
				data : {
				page : data.page, //현재페이지 번호
				limit : 10		  //한 페이지당 표시할 건수
				},
				dataType : 'json',
				type : 'GET',
				cache : false,
			});
		};		
			
		var renderer = function(r, c, item) {
			switch (c) {//c는 각 칼럼 index고 return에는 json으로 넘어오는 name과 맞춰줌.
			case 0:
				return item.f_SEQ;
			case 1:
				return item.f_NM;
			case 2:
				return item.f_KIND;
			case 3:
				return item.f_UNIT;				
			case 4:
				return item.f_YEAR;
			}
		};
			
		tab.tabulate({
			source : xhr,
			renderer : renderer,
			pagination : $('#paging'),
		}).on('loadfailure', function() {//error 표시
			console.error(arguments);
			alert('Failed!');
		}).on("click", "tbody tr", function(e) {//클릭시 음영 및 사번 셋팅
			$("#list tbody tr").each(function() {
				$(this).removeClass("success");
			});//기존 선택된 음영 제거
			$(this).addClass("success");//선택된 row 음영 셋팅
			$("form#fix [name=hF_SEQ]").val($(this).children("td:first").text());//#list tbody에서 클릭한 row의 첫번째 td값(사번)
		}).on("render", function(e) {//렌더시 기존 선택한 사번값 초기화
			$("form#fix [name=hF_SEQ]").val('');
		});
		
		tab.trigger('load');

		/* 비품종류 셀렉트박스 */
		setSelectize('f_KIND', 'F_KIND');

		/* 비품종류 셀렉트박스 */
		setSelectize('f_UNIT', 'F_UNIT');
		
		/* 내용연수 셀렉트박스 */
		setSelectize('f_YEAR', 'F_YEAR');		
			
		/* 부서 셀렉트박스 
		setSelectize('eDept', 'DEPT_CD');*/

		/* 직책 셀렉트박스 
		setSelectize('ePosi', 'POSI_CD');*/
		//function(data) {
						
			$.ajax({
			url  : apiUrl + 'page.do',
			data : {
			page : 1, //현재페이지 번호
			limit : 10		  //한 페이지당 표시할 건수
			},
			dataType : 'json',
			type : 'GET',
			cache : false,  
			success:function(data){//불러왔을때 실행될 함수(data에 list값 json 파싱)	
			
				$.each(data.items, function(i) {//json 파싱
		 		 	//alert(data.items[i].f_SEQ+data.items[i].f_NM)	
					grid.addRow(i, [data.items[i].f_SEQ,data.items[i].f_NM, data.items[i].f_KIND,data.items[i].f_UNIT, data.items[i].f_YEAR]);		
			})		
			
		/* 	  	$.each(data, function(name, value) {//json 파싱
 		 		 		grid.addRow(0, [name["totalPages"],value[2,3]]);		
				})	
				 */
				//JSONobject jsonobject = new JSONobject()
				
			   	  // grid.addRow(0, [0,tag[0].tagName,tag[0].tagValue])					   	 
			      //alert(name.key + ":" +name.value);		
			      //alert(o);			      			     
			      
			   	  /*     data1={
				     	    rows:[
				     	        { id:1, data: ["A Time to Kill", "John Grisham", "100","200"]},
				     	        { id:2, data: ["Blood and Smoke", "Stephen King", "1000"]},
				     	        { id:3, data: ["The Rainmaker", "John Grisham", "-200"]}
				     	    ]
			   			    }				     	
				     	//grid.parse(data,"json"); //takes the name and format of the data source */
			    },
				error : function(data, status, error) {
					alert("에러발생");
				}
			});
		}); 
		
	function insertAct() {
		/*엘레멘트 초기화(비품등록을 위함)*/
		$("form#fix").find('input[type="text"], textarea, select').val('');
		for ( var i in ctrlSelecize)
			ctrlSelecize[i].clear();//셀렉티즈 초기화
		
		$("form#fix [name=act]").val("insert");
		
		//alert(actUrl1);
		$(".modal-title").text("비품정보 등록");
		$("button[type=submit]").val("등록");
		showInsertForm();
	}
	function updateAct(obj) {
		var _f_seq = $("form#fix [name=hF_SEQ]").val();
	
		if(_f_seq=="")
		{
			alert("수정 할 비품을 선택해 주세요.");
			return false;
		}

		$.ajax({//수정 할 비품정보 가져옴.
			url : apiUrl + 'getFixInfo.do?',
			data : {
			f_SEQ : _f_seq,
			},
			dataType : 'JSON',
			type : 'GET',
			cache : false,
			success : function(data) {
				$.each(data, function(name, value) {//json 파싱
					var tag = $("form#fix [name=" + name + "]");
				
					if (tag.length > 0) {//해당 요소가 존재 하면
						
						switch (tag[0].tagName) {//각 태그 유형에 맞게 값 할당
							case "INPUT":
								tag.val(value); 
								break;
							case "SELECT":
								ctrlSelecize[name].setValue(value);
								break;
						}
					}
				})
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
		
		$("form#fix [name=act]").val("update");
		$(".modal-title").text("비품정보 수정");
		$("button[type=submit]").text("수정");
		showInsertForm();
	}
	
	function deleteAct(){
		var _f_seq = $("form#fix [name=hF_SEQ]").val();
	
		
		if(_f_seq=="")
		{
			alert("삭제 할 비품을 선택해 주세요.");
			return false;
		}
		if(confirm("삭제 하시겠습니까?"))
		{
			$.ajax({
				url : apiUrl + "delete.do",	
				data : {
					f_SEQ : _f_seq,
				},
				dataType : 'json',
				type : 'POST',
				cache : false,
				success : function(data) {
					alert("삭제 완료 하였습니다.");
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
		}
		tab.trigger('load');
	}
	
	function showInsertForm() {
		$('#insertForm').modal();
	}	
		
	$('form#fix').submit(
			//insert, update, 유무에 따라 act.do호출
			function() {
				/* if ($('input[name=eNm]').val() == "") {
					alert("사원명을 입력해 주세요.");
					return false;
				}
				if ($('input[name=eDept]').val() == "") {
					alert("부서를 선택해 주세요.");
					return false;
				}
				if ($('input[name=ePosi]').val() == "") {
					alert("직책을 선택해 주세요.");
					return false;
				}
				if ($('input[name=eInDt]').val() == "") {
					alert("입사일을 입력해 주세요.");
					return false;
				} 
				$('input[name=eInDt]').val(
						$('input[name=eInDt]').val().replace(/-/g, ''))
				$('input[name=eOutDt]').val(
						$('input[name=eOutDt]').val().replace(/-/g, ''))
				*/
				var actUrl = $("form#fix [name=act]").val() == "insert" ? "insert.do" : "update.do"; 

				dataString = $("form#fix").serialize();
				dataString = dataString.replace("hF_SEQ=", "f_SEQ=");
				$.ajax({
					url : apiUrl + actUrl,	
					data : dataString,
					dataType : 'json',
					type : 'POST',
					cache : false,
				});
			});		
	
	function pagejAct() {	

		var params = {'test1'   : "test1", 'test2': "test2"};
		  $.ajax({
	      url: apiUrl + 'url.do?',
	      type: 'POST',
	      data: JSON.stringify(params),  
	      dataType: 'json', 
	      timeout: 2000, 
	      async:false, 
	      contentType: "application/json", 
	      errorMsg: "데이터 조회시 오류발생.",
	      success:function(jsonObj){
	      console.log(jsonObj);
	      }
	      });
	
	}
	
	
	
</script>
