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
	var apiUrl = '${ctx}/api/004000000/'
	var fixStGrid, popGrid, popWins, dp;
	var markedArray;
	$(function() {
		fixStGrid = new dhtmlXGridObject('gridbox');
		fixStGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
		fixStGrid.setHeader("NO,등록번호, 분류번호, 취득일자, 정리일자, 모델번호, 제조번호, 규격,제조회사,구입과목,용도,수량,단가,금액,일련번호_시작,일련번호_끝,비고");
		fixStGrid.setInitWidths("40,80,80,80,80,80,70,70,80,90,80,80,80,80,90,90");
 		fixStGrid.setColAlign("center,center,center,center,center,center,center,center,center,center,center,right,right,right,center,center,center");
		fixStGrid.setColTypes("cntr,ed,ed,dhxCalendar,dhxCalendar,ed,ed,edn,ed,combo,combo,ed,ed,edn,edn,edn,edn");
		fixStGrid.setColSorting("na,str,str,date,date,str,str,str,str,combo,combo,int,int,str,str,str,str");
		//fixStGrid.setColumnHidden(8,true);//pro
		fixStGrid.setColumnColor("#CCE2FE");
		fixStGrid.enableColumnAutoSize(true);  
		fixStGrid.enableAutoHeight(true);
		fixStGrid.setDateFormat("%Y-%m-%d", "%Y-%m-%d")
		fixStGrid.setNumberFormat("0,000",11);
		fixStGrid.setNumberFormat("0,000",12);
		fixStGrid.setNumberFormat("0,000",13);
		fixStGrid.init();
		
		deptCombo = fixStGrid.getColumnCombo(9);
		deptCombo.enableFilteringMode(true);
		deptCombo.addOption(getDhxOptions("JF_BUY_ITEM")); 
		

		fitCombo = fixStGrid.getColumnCombo(10);
		fitCombo.enableFilteringMode(true);
		fitCombo.addOption(getDhxOptions("F_KIND")); 
	
		fixStGrid.load(apiUrl + "page.do", "json");
		
		markedArray = fixStGrid.getStateOfView();
		
		dp = new dataProcessor(apiUrl + "dhtmlx.do"); // lock feed url
		dp.setUpdateMode("off");//셀값을 바꿀때 실시간 db 적용 여부
		dp.init(fixStGrid);
		dp.setTransactionMode("POST", false);
		
		dp.defineAction("error", function(obj){
			alert((fixStGrid.getRowIndex(obj.rid)+1) + "번째 저장 실패");
			
			fixStGrid.setRowTextStyle(obj.rid, "color: red; font-weight: bold;");
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
	
		fixStGrid.attachEvent("onEditCell", function(stage,rId,cInd,nValue,oValue)//비품변동(main) 비품코드 edit시
		{
			if(stage == 1)
			{
			    if(cInd == 1)//분류코드
			    {
			    	popWins = new dhtmlXWindows();
					var id = "FixSt";
					var col_title = '비품명, 등록번호, 구입과목, 규격, 용도, 제작회사, 수량, 시작번호, 끝번호';
	// 				popWins.createWindow(id, x, y, w, h);
					popWins.createWindow(id, 300, 100, 800, 500);
	
					popWins.window(id).setText("비품재고관리");
					popWins.window(id).setModal(true);
					var popGrid = popWins.window(id).attachGrid();
					popGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
				//	popGrid.setHeader("비품명, 등록번호, 구입과목, 규격, 용도, 제작회사, 수량, 시작번호, 끝번호");
					popGrid.setHeader(col_title);
					popGrid.setInitWidths("80,80,80,80,80,80,80,80,80");
					popGrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
					popGrid.setColSorting("str,str,str,str,str,str,str,str,str");
					popGrid.init();
			    	popGrid.load('${ctx}/api/005000001/' + "page.do", "json");
			    	
					popGrid.attachEvent("onRowDblClicked", function(sRId,sCInd){//window에서 비품재고 더블클릭시 main grid에 값 세팅
						if(fixStGrid.getSelectedId().indexOf("i_") != -1)
						{
							fixStGrid.cells(rId, 1).setValue(popGrid.cells(sRId, 0).getValue());//비품분류코드
							fixStGrid.cells(rId, 2).setValue(popGrid.cells(sRId, 1).getValue());//등록번호
							popWins.unload();
						}else{
							alert("기존 정보는 분류코드를 변경할 수 없습니다.");
						}
					})
			    }else if(cInd == 2){//운영자
			    	popWins = new dhtmlXWindows();
					var id = "Fix";
	
	// 				popWins.createWindow(id, x, y, w, h);
					popWins.createWindow(id, 300, 100, 450, 500);	
					popWins.window(id).setText("비품분류코드 정보");
					popWins.window(id).setModal(true);
					var popGrid = popWins.window(id).attachGrid();
					popGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
					popGrid.setHeader("분류번호, 비품명, 품종, 단위, 내용연수");
					popGrid.setInitWidths("80,80,80,80,80");
					popGrid.setColTypes("ro,ro,ro,ro,ro");
					popGrid.setColSorting("str,str,str,date,date");
					popGrid.init();
			    	popGrid.load('${ctx}/api/004000000/' + "dhxfseq.do", "json");			    	
					popGrid.attachEvent("onRowDblClicked", function(sRId,sCInd){//window에서 비품재고 더블클릭시 main grid에 값 세팅
						fixStGrid.cells(rId, 2).setValue(popGrid.cells(sRId, 0).getValue());//비품분류코드
					//	fixStGrid.cells(rId, 10).setValue(popGrid.cells(sRId, 2).getValue());//등록번호
						popWins.unload();
					})
			    }
		    }else{
		    	return true;//return이 없으면 다른 칼럼 값 셋팅 안됨.
		    }
		});		
	});
/*
 
 	///dhtmlx 그리드 사용자 정의 셀 type(edncl)
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