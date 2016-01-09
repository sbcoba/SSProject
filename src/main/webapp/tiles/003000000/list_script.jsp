<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../inc/common.jsp"%>
<script>
	var apiUrl = '${ctx}/api/001000000/'

	$(function() {
		$('#list').tabulate({
			source : function(data) {
				return alert("hi");
				$.ajax({
					url : baseApiUrl + 'page.do?',
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
</script>
