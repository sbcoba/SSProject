<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
	var apiUrl = '${ctx}/api/003000000/'

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
		})/* .on('render', cellEllipsis).trigger('load'); */
	});

	function showInsertForm() {
		$('#insertForm').modal();
	}
	$('#emp').submit(function(){
		dataString = $("#emp").serialize();
		$.ajax({
			url : apiUrl + 'insert.do?',
			data: dataString,
			dataType : 'json',
			type: 'POST',
			cache : false,
			succes : function(data) {
							alert("hi");
			}
		});
	});

</script>
