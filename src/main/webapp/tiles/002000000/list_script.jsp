<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
	var apiUrl = '${ctx}/api/002000000/';
		var test = "";
		
	$(function() {		
		var tab = $('#list')
		
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
		}).on('loadfailure', function() {
			alert('Failed!');
		});

		tab.trigger('load');

		/* 부서 셀렉트박스 
		setSelectize('eDept', 'DEPT_CD');*/

		/* 직책 셀렉트박스 
		setSelectize('ePosi', 'POSI_CD');*/
		
		
	});
	$('#form').submit(function() {
		dataString = $("#form").serialize();
		$.ajax({
			type:"POST",
			data:dataString,
			url : apiUrl + 'insert.do?',
			dataType : 'json',
			cache : false,
			succes : function(data) {
				alert("hi");
			}
		});
	})

	function showInsertForm() {
		$('#insertForm').modal();
	}
</script>
