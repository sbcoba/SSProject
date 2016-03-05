<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- start: Meta -->
<meta charset="utf-8">
<title>Equipments Management System</title>
<meta name="description" content="Bootstrap Metro Dashboard">
<meta name="author" content="Dennis Ji">
<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-style">
<link href="${ctx}/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="${ctx}/css/style.css" rel="stylesheet" id="base-style">
<link href="${ctx}/css/style-responsive.css" rel="stylesheet" id="base-style-responsive">
<link href="${ctx}/css/selectize.bootstrap3.css" rel="stylesheet" id="selectize-bootstrap3">
<link href="${ctx}/js/dhtmlx/codebase/dhtmlx.css" rel="stylesheet" id="dthmlx">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
<style type="text/css">
.form-horizontal .control-label {/*등록 폼 Title 들여쓰기 조정*/
	width:110px;
}
.cDatePicker{/*날짜 input box*/
	width:150px;
	display:inline;
	margin-right:3px;
}
.ui-datepicker-trigger{/*달력호출 버튼*/
	height:29px
}
</style>

<!-- end: CSS -->


<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="css/ie.css" rel="stylesheet">
	<![endif]-->

<!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->

<!-- start: Favicon -->
<link rel="shortcut icon" href="/img/favicon.ico">
<!-- end: Favicon -->

</head>

<body>
<!-- start: Header -->
    <div class="navbar-inner">
<!--    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse"></a>
        <a class="brand" href="index.html"><span>비품관리 시스템</span></a> -->
        <!-- start: Header Menu -->
        <div class="nav-no-collapse header-nav">
            <ul class="horizon">
                <li class="dropdown hidden-phone">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#"> <i class="halflings-icon white warning-sign"></i>
                    </a>
                </li>
                <!-- start: Notifications Dropdown -->
                <li class="dropdown hidden-phone">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#"> <i class="halflings-icon white tasks"></i>
                    </a>
                </li>
                <!-- end: Notifications Dropdown -->
                <!-- start: Message Dropdown -->
                <li class="dropdown hidden-phone">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#"> <i class="halflings-icon white envelope"></i>
                    </a>
                </li>
                <!-- end: Message Dropdown -->
                <li>
                    <a class="btn" href="#"> <i class="halflings-icon white wrench"></i>
                    </a>
                </li>
                <!-- start: User Drop down -->
                <li class="dropdown">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#"> <i class="halflings-icon white user"></i> Dennis Ji <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-menu-title">
                            <span>Account Settings</span>
                        </li>
                        <li>
                            <a href="#"><i class="halflings-icon user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="login.html"><i class="halflings-icon off"></i> Logout</a>
                        </li>
                    </ul>
                </li>
                <!-- end: User Dropdown -->
            </ul>
        </div>
    </div>
<!-- end: Header Menu -->

    <div class="container-fluid-full">
        <div class="row-fluid" style="border:3 solid green">

            <!-- start: Main Menu -->
            <div id="sidebar-left" class="span2">
                <div class="nav-collapse sidebar-nav">
                    <ul class="nav nav-tabs nav-stacked main-menu">
                        <li>
                            <a href="${ctx}/content/001000000/list.do"><i class="icon-bar-chart"></i> <span class="hidden-tablet"> 공통분류코드</span></a>
                        </li>
                        <li>
                            <a href="${ctx}/content/002000000/list.do"><i class="icon-tasks"></i> <span class="hidden-tablet"> 비품분류코드</span></a>
                        </li>
                        <li>
                            <a href="${ctx}/content/003000000/list.do"><i class="icon-eye-open"></i> <span class="hidden-tablet"> 인사관리</span></a>
                        </li>
                         <li>
                            <a href="${ctx}/content/004000000/list.do"><i class="icon-star"></i> <span class="hidden-tablet"> 비품재고관리</span></a>
                        </li>
                         <li>
                            <a href="${ctx}/content/005000000/list.do"><i class="icon-eye-open"></i> <span class="hidden-tablet"> 비품변동관리</span></a>
                        </li>
                        <li>
                            <a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i> <span class="hidden-tablet"> Sub Menu </span> <span class="label label-important"> 3 </span></a>
                            <ul>
                                <li>
                                    <a class="submenu" href="${ctx}/content/002000001/list.do""><i class="icon-file-alt"></i> <span class="hidden-tablet">DHX TEST</span></a>
                                </li>
                                <li>
                                    <a class="submenu" href="${ctx}/content/002000002/list.do"><i class="icon-file-alt"></i> <span class="hidden-tablet">비품분류 DHX </span></a>
                                </li>
                                <li>
                                    <a class="submenu" href="submenu3.html"><i class="icon-file-alt"></i> <span class="hidden-tablet"> Sub Menu 3</span></a>
                                </li>
                            </ul>
                        </li>
<!-- 
                        <li>
                            <a href="form.html"><i class="icon-edit"></i> <span class="hidden-tablet"> Forms</span></a>
                        </li>
                        <li>
                            <a href="chart.html"><i class="icon-list-alt"></i> <span class="hidden-tablet"> Charts</span></a>
                        </li>
                        <li>
                            <a href="typography.html"><i class="icon-font"></i> <span class="hidden-tablet"> Typography</span></a>
                        </li>
                        <li>
                            <a href="gallery.html"><i class="icon-picture"></i> <span class="hidden-tablet"> Gallery</span></a>
                        </li>
                        <li>
                            <a href="table.html"><i class="icon-align-justify"></i> <span class="hidden-tablet"> Tables</span></a>
                        </li>
                        <li>
                            <a href="calendar.html"><i class="icon-calendar"></i> <span class="hidden-tablet"> Calendar</span></a>
                        </li>
                        <li>
                            <a href="file-manager.html"><i class="icon-folder-open"></i> <span class="hidden-tablet"> File Manager</span></a>
                        </li>
                        <li>
                            <a href="icon.html"><i class="icon-star"></i> <span class="hidden-tablet"> Icons</span></a>
                        </li>
                        <li>
                            <a href="login.html"><i class="icon-lock"></i> <span class="hidden-tablet"> Login Page</span></a>
                        </li> -->
                    </ul>
                </div>
            </div>
            <!-- end: Main Menu -->

            <noscript>
                <div class="alert alert-block span10">
                    <h4 class="alert-heading">Warning!</h4>
                    <p>
                        You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.
                    </p>
                </div>
            </noscript>

            <!-- start: Content -->
            <div id="content" class="span10">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i> <a href="index.html">Home</a> <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">Dashboard</a>
                    </li>
                </ul>
            <tiles:insertAttribute name="content" />
            </div>
            <!-- end: Content -->
        </div>
        <!--/#content.span10-->
    </div>
    <!--/fluid-row-->

    <div class="modal hide fade" id="myModal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">Ã</button>
            <h3>Settings</h3>
        </div>
        <div class="modal-body">
            <p>Here settings can be configured...</p>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Close</a> <a href="#" class="btn btn-primary">Save changes</a>
        </div>
    </div>
    <footer>
        <p>
            <span style="text-align: left; float: left"> &copy; 2015<a href="#">Management System</a>
            </span>
        </p>
    </footer>

    <!-- start: JavaScript-->
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/jquery.tabulatez.js"></script>
    <script src="${ctx}/js/jquery.mask.js"></script>
    <script src="${ctx}/js/dhtmlx/codebase/dhtmlx.js"></script>
    <script src="${ctx}/js/dhtmlx/codebase/dhtmlx_deprecated.js"></script>
    <script src="${ctx}/js/metro/jquery-migrate-1.0.0.min.js"></script>
    <script src="${ctx}/js/metro/jquery-ui-1.10.0.custom.min.js"></script>
    <script src="${ctx}/js/metro/jquery.ui.touch-punch.js"></script>
    <script src="${ctx}/js/metro/modernizr.js"></script>
    <script src="${ctx}/js/metro/bootstrap.min.js"></script>
    <script src="${ctx}/js/metro/jquery.cookie.js"></script>
    <script src='${ctx}/js/metro/fullcalendar.min.js'></script>
    <script src='${ctx}/js/metro/jquery.dataTables.min.js'></script>
    <script src="${ctx}/js/metro/excanvas.js"></script>
    <script src="${ctx}/js/metro/jquery.flot.js"></script>
    <script src="${ctx}/js/metro/jquery.flot.pie.js"></script>
    <script src="${ctx}/js/metro/jquery.flot.stack.js"></script>
    <script src="${ctx}/js/metro/jquery.flot.resize.min.js"></script>
    <script src="${ctx}/js/metro/jquery.chosen.min.js"></script>
    <script src="${ctx}/js/metro/jquery.uniform.min.js"></script>
    <script src="${ctx}/js/metro/jquery.cleditor.min.js"></script>
    <script src="${ctx}/js/metro/jquery.noty.js"></script>
    <script src="${ctx}/js/metro/jquery.elfinder.min.js"></script>
    <script src="${ctx}/js/metro/jquery.raty.min.js"></script>
    <script src="${ctx}/js/metro/jquery.iphone.toggle.js"></script>
    <script src="${ctx}/js/metro/jquery.uploadify-3.1.min.js"></script>
    <script src="${ctx}/js/metro/jquery.gritter.min.js"></script>
    <script src="${ctx}/js/metro/jquery.imagesloaded.js"></script>
    <script src="${ctx}/js/metro/jquery.masonry.min.js"></script>
    <script src="${ctx}/js/metro/jquery.knob.modified.js"></script>
    <script src="${ctx}/js/metro/jquery.sparkline.min.js"></script>
    <script src="${ctx}/js/metro/counter.js"></script>
    <script src="${ctx}/js/metro/retina.js"></script>
    <script src="${ctx}/js/metro/custom.js"></script>
    <script src="${ctx}/js/comm_script.js"></script>
    <script src="${ctx}/js/selectize.js"></script>
    <!-- end: JavaScript-->
<tiles:insertAttribute name="script" />
</body>
</html>
