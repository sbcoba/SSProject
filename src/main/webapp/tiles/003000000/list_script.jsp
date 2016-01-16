<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
	var apiUrl = '${ctx}/api/003000000/'
	var test = "";
	$(function() {
		var tab = $('#list')

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
		};

		var renderer = function(r, c, item) {
			switch (c) {
			case 0:
				return item.eNo;

			case 1:
				return item.eNm;

			case 2:
				return item.eId;

			case 3:
				return item.ePw;

			case 4:
				return item.eDept;

			case 5:
				return item.ePosi;

			case 6:
				return item.eInDt;

			default:
				return item.eOutDt;
			}
		};

		tab.tabulate({
			source : xhr,
			renderer : renderer,
			pagination : $('#paging'),
		}).on('loadfailure', function() {
			console.error(arguments);
			alert('Failed!');
		});

		tab.trigger('load');

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
