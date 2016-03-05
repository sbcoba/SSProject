<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<style>
	.even{
		background-color:#E6E6FA;
	}
	.uneven{
		background-color:#F0F8FF;
	}
</style>
<script>
	var apiUrl = '${ctx}/api/005000000/'
	var fixMvGrid, popGrid, popWins, dp;
	var markedArray;
	$(function() {
		fixMvGrid = new dhtmlXGridObject('gridbox');
		fixMvGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
		fixMvGrid.setHeader("&nbsp;,분류코드, 등록번호, 정리일자, 운영부서, 최초, 최종, 수량, 운영자사번, 운영자, 비치건물, 비치호실, 부속기타, 처분, 반납, 이동");
		fixMvGrid.setInitWidths("40,90,90,80,80,50,50,50,50,80,80,100,120,50,50,50");
 		fixMvGrid.setColAlign("center,left,left,center,left,right,right,right,center,center,left,left,left,right,right,right");
		fixMvGrid.setColTypes("cntr,ed,ro,dhxCalendar,combo,edn,edn,edn,ro,ed,combo,ed,ed,edn,edn,edn");
		fixMvGrid.setColSorting("na,str,str,date,str,int,int,int,str,str,str,str,str,int,int,int");
		fixMvGrid.setColumnHidden(8,true);//pro
		fixMvGrid.setColumnColor("#CCE2FE");
		fixMvGrid.enableColumnAutoSize(true);
		fixMvGrid.enableAutoHeight(true);
		fixMvGrid.setDateFormat("%Y-%m-%d", "%Y-%m-%d")
		fixMvGrid.setNumberFormat("0,000",12);
		fixMvGrid.setNumberFormat("0,000",13);
		fixMvGrid.setNumberFormat("0,000",14);
		fixMvGrid.init();
		
		deptCombo = fixMvGrid.getColumnCombo(4);
		deptCombo.enableFilteringMode(true);
		deptCombo.addOption(getDhxOptions("DEPT_CD"));
		
		fitCombo = fixMvGrid.getColumnCombo(10);
		fitCombo.enableFilteringMode(true);
		fitCombo.addOption(getDhxOptions("FIT_CD"));
		
		fixMvGrid.load(apiUrl + "page.do", "json");
		
		markedArray = fixMvGrid.getStateOfView();
		
		dp = new dataProcessor(apiUrl + "dhtmlx.do"); // lock feed url
		dp.setUpdateMode("off");//셀값을 바꿀때 실시간 db 적용 여부
		dp.init(fixMvGrid);
		dp.setTransactionMode("POST", false);
		
		dp.defineAction("error", function(obj){
			alert((fixMvGrid.getRowIndex(obj.rid)+1) + "번째 저장 실패");
			
			fixMvGrid.setRowTextStyle(obj.rid, "color: red; font-weight: bold;");
		});
// 		dp.attachEvent("onAfterUpdate", function(id, action, tid, response) {
// 		    alert("onAfterUpdate");
// 		    return true;
// 		});
	/* 	dp.attachEvent("onRowMark", function() {
			alert("onRowMark");
		    return true;
		});
		dp.attachEvent("onBeforeUpdate", function() {
			alert("onBeforeUpdate");
		    return true;
		}); */
		dp.attachEvent("onValidatationError", function(id, details) {
			alert("onValidatationError");
		    return true;
		});
// 		dp.attachEvent("onAfterUpdateFinish", function() {
// 			alert("onAfterUpdateFinish");
// 		    return true;
// 		});//setTransactionMode(true)일때 사용
		dp.attachEvent("onFullSync", function() {
			alert("저장 완료.");
		    return true;
		})
	
		fixMvGrid.attachEvent("onEditCell", function(stage,rId,cInd,nValue,oValue)//비품변동(main) 비품코드 edit시
		{
			if(stage == 1)
			{
			    if(cInd == 1)//분류코드
			    {
			    	popWins = new dhtmlXWindows();
					var id = "FixMv";
	
	// 				popWins.createWindow(id, x, y, w, h);
					popWins.createWindow(id, 300, 100, 800, 500);
	
					popWins.window(id).setText("비품재고관리");
					popWins.window(id).setModal(true);
					var popGrid = popWins.window(id).attachGrid();
					popGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
					popGrid.setHeader("비품명, 등록번호, 구입과목, 규격, 용도, 제작회사, 수량, 시작번호, 끝번호");
					popGrid.setInitWidths("80,80,80,80,80,80,80,80,80");
					popGrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
					popGrid.setColSorting("str,str,str,str,str,str,str,str,str");
					popGrid.init();
			    	popGrid.load('${ctx}/api/005000001/' + "page.do", "json");
			    	
					popGrid.attachEvent("onRowDblClicked", function(sRId,sCInd){//window에서 비품재고 더블클릭시 main grid에 값 세팅
						if(fixMvGrid.getSelectedId().indexOf("i_") != -1)
						{
							fixMvGrid.cells(rId, 1).setValue(popGrid.cells(sRId, 0).getValue());//비품분류코드
							fixMvGrid.cells(rId, 2).setValue(popGrid.cells(sRId, 1).getValue());//등록번호
							popWins.unload();
						}else{
							alert("기존 정보는 분류코드를 변경할 수 없습니다.");
						}
					})
			    }else if(cInd == 9){//운영자
			    	popWins = new dhtmlXWindows();
					var id = "Emp";
	
	// 				popWins.createWindow(id, x, y, w, h);
					popWins.createWindow(id, 300, 100, 450, 500);
					popWins.window(id).setText("인사정보");
					popWins.window(id).setModal(true);
					var popGrid = popWins.window(id).attachGrid();
					popGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
					popGrid.setHeader("사원번호, 사원명, 직책, 입사일, 퇴사일");
					popGrid.setInitWidths("80,80,80,80,80");
					popGrid.setColTypes("ro,ro,ro,ro,ro");
					popGrid.setColSorting("str,str,str,date,date");
					popGrid.init();
			    	popGrid.load('${ctx}/api/003000000/' + "dhxEmp.do", "json");
			    	
					popGrid.attachEvent("onRowDblClicked", function(sRId,sCInd){//window에서 비품재고 더블클릭시 main grid에 값 세팅
						fixMvGrid.cells(rId, 8).setValue(popGrid.cells(sRId, 0).getValue());//비품분류코드
						fixMvGrid.cells(rId, 9).setValue(popGrid.cells(sRId, 1).getValue());//등록번호
						popWins.unload();
					})
			    }
		    }else{
		    	return true;//return이 없으면 다른 칼럼 값 셋팅 안됨.
		    }
		});
		
	});
	
/* 	//dhtmlx 그리드 사용자 정의 셀 type(edncl)
	function eXcell_edncl(cell){
		this.base = eXcell_edn;
		this.base(cell)
		this.setValue = function(val){
				if(!val || val.toString()._dhx_trim()=="")
					val="0";
				if(val>=0)
					this.cell.style.color = "green";
				else
					this.cell.style.color = "red";
				this.cell.innerHTML = this.grid._aplNF(val,this.cell._cellIndex);
		}
	}
	
	eXcell_edncl.prototype = new eXcell_edn */
	
	function save()
	{
		dp.sendData();
	}
</script>