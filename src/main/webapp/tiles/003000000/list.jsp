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
							<th width="15%">사원번호</th>
							<th width="10%">사원명</th>
							<th width="15%">아이디</th>
							<th width="12%">비밀번호</th>
							<th width="12%">부서</th>
							<th width="12%">직책</th>
							<th width="12%">입사일</th>
							<th width="12%">퇴사일</th>
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
			<ul id="paging" class="pagination"></ul>
		</div>
		<div class="col-xs-2 text-right list-btn text-primary">
			<button class="btn btn-default" type="button" data-toggle="modal"
				data-target="#formModal" onclick="insertAct();">등록</button>
			<button class="btn btn-default" type="button" data-toggle="modal"
				data-target="#formModal" onclick="updateAct();">수정</button>
			<button class="btn btn-default" type="button" data-toggle="modal"
				data-target="#formModal" onclick="deleteAct();">삭제</button>
			
		</div>
	</div>
	<!-- /.row -->
	<!-- Modal -->
	<div id="insertForm" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<form class="form-horizontal" id="emp" method="post">
		<input type="hidden" name="act">
		<input type="hidden" name="hENo">
		
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">사원정보 등록</h4>
				</div>
				<div class="modal-body">
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">사원번호</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall" name="eNo"
									placeholder="자동생성" disabled>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">사원명</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall" name="eNm">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">아이디</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="formGroupInputSmall" name="eId"
									placeholder="공란 시 사원번호와 동일하게 등록">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label">부서</label>
							<div class="col-sm-8">
								<select name="eDept" id="eDept" class='selectize-control' placeholder="부서를 선택 해주세요."></select>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">직책</label>
							<div class="col-sm-8">
								<select name="ePosi" id="ePosi" class='selectize-control' placeholder="직책을 선택 해주세요."></select>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">입사일</label>
							<div class="col-sm-8">
								<input class="form-control cDatePicker" type="text" id="date_1" name="eInDt" maxlength="10" data-mask="0000-00-00" data-mask-selectonfocus="true" >
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label" for="formGroupInputSmall">퇴사일</label>
							<div class="col-sm-8">
								<input class="form-control cDatePicker" type="text" id="date_2" name="eOutDt" maxlength="10" data-mask="0000-00-00" data-mask-selectonfocus="true">
							</div>
						</div>

				</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-default">등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
		</form>
	</div>
</div>
<!-- modal end -->
</div>
<!-- page.contents -->

