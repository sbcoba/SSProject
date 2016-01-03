<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../../inc/common.jsp"%>
<!-- page.contents -->
<div>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<table id="list"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="col-width-num">사원번호</th>
							<th class="col-width-name">사원명</th>
							<th class="col-width-id">아이디</th>
							<th class="col-width-name">비밀번호</th>
							<th class="col-width-email">부서</th>
							<th class="col-width-tel">직책</th>
							<th class="col-width-tel">입사일</th>
							<th class="col-width-tel">퇴사일</th>
					</thead>
					</tr>
					<tbody>
					</tbody>
				</table>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>

	<div class="row">
		<div class="col-xs-2 list-btn text-primary"></div>
		<div class="col-xs-8 text-center">
			<ul id="pagination" class="pagination"></ul>
		</div>
		<div class="col-xs-2 text-right list-btn text-primary">
			<button class="btn btn-default" type="button" data-toggle="modal"
				data-target="#formModal" onclick="showInsertForm();">등록</button>
		</div>
	</div>
	<!-- /.row -->
	<!-- Modal -->
	<div id="insertForm" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">코드등록</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">사원번호</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall"
									placeholder="자동생성" disabled>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">사원명</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">아이디</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall"
									placeholder="공란 시 사원번호와 동일하게 등록">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">부서</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">직책</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">입사일</label>
							<div class="col-sm-8">
								<input class="form-control cDatePicker" type="text" id="date_1" style="width:150px" readonly>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">퇴사일</label>
							<div class="col-sm-8">
								<input class="form-control cDatePicker" type="text" id="date_2" style="width:150px" readonly>
							</div>
						</div>
					</form>
				</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default">Register</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- modal end -->
</div>
<!-- page.contents -->

