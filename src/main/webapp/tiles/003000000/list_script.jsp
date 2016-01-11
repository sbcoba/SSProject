<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
	var apiUrl = '${ctx}/api/003000000/'
	var test = "";
	var test1 = "";
	$(function() {
		$('#list').tabulate({
			source : function(data) {
				return alert("hi");
				$.ajax({
					url : apiUrl + 'page.do?',
					dataType : 'json',
					cache : false
				});
			},/*
									            renderer: function(r, c, item, dataSet) {
									                switch (c) {
									                    case 0:
									                        return escapeHtml(item.acId);
									                }
									            },
									            cellClass: function(r, c, item, dataSet) {
									                switch (c) {
									                    case 0:
									                    case 1:
									                    case 2:
									                        return 'text-center text-middle';

									                    case 4:
									                    case 5:
									                        return 'cell-ellipsis text-center text-middle ';

									                    default:
									                        return 'text-middle';
									                }
									            }, */
			pagination : $('#pagination')
		});/* .on('render', cellEllipsis).trigger('load'); */
		
		/* 부서 셀렉트박스 */
		setSelectize('eDept', 'DEPT_CD');
		
		/* 직책 셀렉트박스 */
		setSelectize('ePosi', 'POSI_CD');
	});

	function showInsertForm() {
		$('#insertForm').modal();
	}
	$('#emp').submit(
			function() {
				if ($('input[name=eNm]').val() == "") {
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

				dataString = $("#emp").serialize();
				$.ajax({
					url : apiUrl + 'insert.do?',
					data : dataString,
					dataType : 'json',
					type : 'POST',
					cache : false,
					success : function(data) {
						alert("hi");
					}
				});
			});
</script>
