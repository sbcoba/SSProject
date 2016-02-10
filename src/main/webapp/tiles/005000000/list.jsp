<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
    <%@ include file="../../inc/common.jsp"%>
	<div id="gridbox" style="width:90%;height:145px;background-color:white;"></div>
	<div style="margin-top:10px">
		<button class="btn btn-default" type="button" data-toggle="modal"
			data-target="#formModal" onclick="fixMvGrid.addRow('i_'+fixMvGrid.getRowsNum(), '', fixMvGrid.getRowsNum());">추가</button>
		<button class="btn btn-default" type="button" data-toggle="modal"
			data-target="#formModal" onclick="fixMvGrid.deleteSelectedItem();">삭제</button>
		<button class="btn btn-default" type="button" data-toggle="modal"
			data-target="#formModal" onclick="save();">적용</button>
	</div>
			