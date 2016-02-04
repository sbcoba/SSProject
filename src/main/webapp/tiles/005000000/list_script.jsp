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
	var fixMvGrid, fixStGrid, fixStWins, dp;
	$(function() {
		fixMvGrid = new dhtmlXGridObject('gridbox');
		fixMvGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
		fixMvGrid.setHeader("&nbsp;,분류코드, 등록번호, 정리일자, 운영부서, 최초, 최종, 수량, 운영자, 비치건물, 비치호실, 부속기타, 처분, 반납, 이동");
		fixMvGrid.setInitWidths("40,80,80,80,80,50,50,50,80,80,100,120,50,50,50");
 		fixMvGrid.setColAlign("center,left,left,center,left,right,right,right,center,left,left,left,right,right,right");
		fixMvGrid.setColTypes("cntr,ed,ro,dhxCalendar,combo,edn,edn,edncl,ed,combo,ed,ed,edncl,edncl,edncl");
		fixMvGrid.setColSorting("na,str,str,date,str,int,int,int,str,str,str,str,int,int,int");
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
		
		deptCombo = fixMvGrid.getColumnCombo(9);
		deptCombo.enableFilteringMode(true);
		deptCombo.addOption(getDhxOptions("FIT_CD"));
		
		
        
		/* $.ajax({
			url : apiUrl + "page.do",	
			dataType : 'json',
			type : 'POST',
			cache : false,
			
			success : function(data) {
				fixMvGrid.parse(data, "json");
				fixMvGrid.addRow((new Date()).valueOf(), "", fixMvGrid.getRowsNum());
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		}); */
		fixMvGrid.load(apiUrl + "page.do", "json");
		
		dp = new dataProcessor(apiUrl + "dhtmlx.do"); // lock feed url
		dp.setTransactionMode("POST", false);
		dp.setUpdateMode("off");//셀값을 바꿀때 실시간 db 적용 여부
		dp.init(fixMvGrid);
		
	
		fixMvGrid.attachEvent("onEditCell", function(stage,rId,cInd,nValue,oValue)//비품변동(main) 비품코드 edit시
		{
		    if(stage == 1 && cInd == 1)
		    {
		    	fixStWins = new dhtmlXWindows();
				var id = "FixMv";

// 				fixStWins.createWindow(id, x, y, w, h);
				fixStWins.createWindow(id, 300, 100, 800, 500);

				fixStWins.window(id).setText("비품재고관리");
				fixStWins.window(id).setModal(true);
				var fixStGrid = fixStWins.window(id).attachGrid();
				fixStGrid.setImagePath("${ctx}/js/dhtmlx/skins/web/imgs/");
				fixStGrid.setHeader("비품명, 등록번호, 구입과목, 규격, 용도, 제작회사, 수량, 시작번호, 끝번호");
				fixStGrid.setInitWidths("80,80,80,80,80,80,80,80,80");
				fixStGrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
				fixStGrid.setColSorting("str,str,str,str,str,str,str,str,str");
				fixStGrid.init();
				/* $.ajax({
					url : '${ctx}/api/005000001/' + "page.do",	
					dataType : 'json',
					type : 'POST',
					cache : false,
					
					success : function(data) {
						fixStGrid.parse(data, "json");
					},
					error : function(xhr, status, error) {
						alert("에러발생");
					}
		    	}); */
		    	fixStGrid.load('${ctx}/api/005000001/' + "page.do", "json");
				fixStGrid.attachEvent("onRowDblClicked", function(sRId,sCInd){//window에서 비품재고 더블클릭시 main grid에 값 세팅
					fixMvGrid.cells(rId, 1).setValue(fixStGrid.cells(sRId, 0).getValue());//비품분류코드
					fixMvGrid.cells(rId, 2).setValue(fixStGrid.cells(sRId, 1).getValue());//등록번호
					fixStWins.unload();
				})
		    }else{
		    	return true;//return이 없으면 다른 칼럼 값 셋팅 안됨.
		    }
		});
		
	});
	//dhtmlx 그리드 사용자 정의 셀 type(edncl)
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
	eXcell_edncl.prototype = new eXcell_edn
	
	function save()
	{
		dp.sendData();
		console.log(dp.getSyncState());
	}
</script>