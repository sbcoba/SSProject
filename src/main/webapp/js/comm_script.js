

jQuery(document).ready(function() {

	
/*   DatePicker (날짜 input박스 달력 셋팅) */ 
$(".cDatePicker").each(function(){ 
	 $(this).datepicker({
		showOn : "both",
		buttonImage : "/SSProject/img/icon/calendar.gif",
//		buttonImageOnly : true,
		changeYear : true,
		changeMonth : true,
		dateFormat : "yy-mm-dd",
		dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
		dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		//minDate : "-3M",//현재기준 이전 제한 일수 (숫자, "-3D", "-3M", "-3Y"로 표현가능)
		//maxDate : 2     //현재기준 이후 제한 일수 (숫자, "+3D", "+3M", "+3Y"로 표현가능)
     }); 
  }); 
});	

/* Selectize 셋팅 */ 
var ctrlSelecize = [];
function setSelectize(objNm, cdTpVal)
{
	var jsonVal;
	$.ajax({
		url : '/SSProject/com/api/selectizeOptions.do',
		data : {cdTp : cdTpVal},
		dataType : 'JSON',
		type : 'GET',
		cache : false,
		success : function(data) {
			jsonVal = JSON.stringify(data);
			$select = $('#'+ objNm).selectize({
							valueField:  'CD_V',
						    labelField:  'CD_NM',
						    searchField: 'CD_NM',
						    options : eval(jsonVal),
						}); 
			ctrlSelecize[objNm] = $select[0].selectize;
		},
		error : function(xhr, status, error) {
			alert("에러발생");
		}
	});
}
function getDhxOptions(cdTpVal)
{
	var arrOpt = [];
	$.ajax({
		url : '/SSProject/com/api/selectizeOptions.do',
		data : {cdTp : cdTpVal},
		dataType : 'JSON',
		type : 'GET',
		cache : false,
		async: false,
		success : function(data) {
			for(var i=0; i < data.length; i++)
			{
				arrOpt[i] = [ data[i].CD_V, data[i].CD_NM ]; 
			}
		},
		error : function(xhr, status, error) {
			alert("에러발생");
		}
	});
	return arrOpt;
}

Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

function toTimeObject(time) { //parseTime(time)
    var year  = time.substr(0,4);
    var month = time.substr(4,2) - 1; // 1월=0,12월=11
    var day   = time.substr(6,2);
    return new Date(year,month,day);
}

function fmtDate(date, fmt)
{
	var rt_val = "";
	if(date != null && date != "")
	{
		if(date.length < 8)
			rt_val = date;
		else 
			rt_val = toTimeObject(date).format(fmt);
	}else{
		rt_val = "";
	}
	return rt_val;
}
function defultFmtDate(date)
{
	return fmtDate(date, "yyyy-MM-dd");
}