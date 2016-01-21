<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../inc/common.jsp"%>
<script>
	var apiUrl = '${ctx}/api/003000000/'
	var tab = $('#list')
	$(function() {
		/*tabulate 선언(그리드 출력)*/
		var xhr = function(data) {
			return $.ajax({
				url : apiUrl + 'page.do',
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
				return defultFmtDate(item.eInDt);

			default:
				return defultFmtDate(item.eOutDt);

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
			$("form#emp [name=hENo]").val($(this).children("td:first").text());//#list tbody에서 클릭한 row의 첫번째 td값(사번)
		}).on("render", function(e) {//렌더시 기존 선택한 사번값 초기화
			$("form#emp [name=hENo]").val('');
		});

		tab.trigger('load');

		/* 부서 셀렉트박스 */
		setSelectize('eDept', 'DEPT_CD');

		/* 직책 셀렉트박스 */
		setSelectize('ePosi', 'POSI_CD');

	});
	function insertAct() {
		/*엘레멘트 초기화(신규등록을 위함)*/
		$("form#emp").find('input[type="text"], textarea, select').val('');
		for ( var i in ctrlSelecize)
			ctrlSelecize[i].clear();//셀렉티즈 초기화
		
		$("form#emp [name=act]").val("insert");
		$(".modal-title").text("사원정보 등록");
		$("button[type=submit]").val("등록");
		showInsertForm();
	}
	function updateAct(obj) {
		var _eNo = $("form#emp [name=hENo]").val();
		if(_eNo=="")
		{
			alert("수정 할 사원을 선택해 주세요.");
			return false;
		}
		
		$.ajax({//수정 할 사원정보 가져옴.
			url : apiUrl + 'getEmpInfo.do?',
			data : {
				eNo : _eNo,
			},
			dataType : 'JSON',
			type : 'GET',
			cache : false,
			success : function(data) {
				$.each(data, function(name, value) {//json 파싱
					var tag = $("form#emp [name=" + name + "]");
					
					if (tag.length > 0) {//해당 요소가 존재 하면
						switch (tag[0].tagName) {//각 태그 유형에 맞게 값 할당
							case "INPUT":
								if(name == "eInDt" || name == "eOutDt")
								{
									value = defultFmtDate(value);
								}
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
		
		$("form#emp [name=act]").val("update");
		$(".modal-title").text("사원정보 수정");
		$("button[type=submit]").text("수정");
		showInsertForm();
	}
	function deleteAct(){
		var _eNo = $("form#emp [name=hENo]").val();
		if(_eNo=="")
		{
			alert("삭제 할 사원을 선택해 주세요.");
			return false;
		}
		if(confirm("삭제 하시겠습니까?"))
		{
			$.ajax({
				url : apiUrl + "delete.do",	
				data : {
					eNo : _eNo,
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
	$('form#emp').submit(
			//insert, update, 유무에 따라 act.do호출
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
				
				var actUrl = $("form#emp [name=act]").val() == "insert" ? "insert.do" : "update.do"; 

				dataString = $("form#emp").serialize();
				dataString = dataString.replace("hENo=", "eNo=");
				$.ajax({
					url : apiUrl + actUrl,	
					data : dataString,
					dataType : 'json',
					type : 'POST',
					cache : false,
				});
			});
</script>
