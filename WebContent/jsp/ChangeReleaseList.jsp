<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Change Release List</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<%-- END 12 Oct added combogrid jquery libraries--%>
        <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<style>
.navbar-inverse .navbar-nav>li>a {
            color: #767676;
            font-size:14px;
            border:2px solid #e7f4c1;
            padding:10px 5px;
        }
        .navbar-inverse .navbar-nav>li>a:hover{
            color: #6b8f00;
            border:1px solid #98bf21;
            background-color:#f1f1f1;
            transition: all 0.3s ease 0s;
        }
/* div#sometext{ */
/* height: 4em; */
/* width: 30em; */
/* -moz-border-radius: 1em 4em 1em 4em; */
/* border-radius: 1em 4em 1em 4em; */
/* background:#E2E5E5; */
/* line-height: 2em; */
/* } */

/* div#add_property_div{ */
/* height: 2em; */
/* width: 50em; */
/* -moz-border-radius: 1em 4em 1em 4em; */
/* border-radius: 1em 4em 1em 4em; */
/* background:#E2E5E5; */
/* line-height: 2em; */
label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
}
.sub_container_expand {
    width:95%;
    margin:0 auto;
    left: 150px;
    border:0px solid #d3d3d3;
}

.sub_container_expand div {
    width:80%;
}
.sub_container_expand .sub_header {
    background-color:#d3d3d3;
    width:99%;
    padding: 2px;
    cursor: pointer;
    font-weight: bold;
}
.sub_container_expand .content {
    padding : 5px;
}


.container_expand {
    width:95%;
    margin:0 auto;
    left: 150px;
    border:1px solid #d3d3d3;
}
.container_expand div {
    width:100%;
}
.container_expand .header {
    background-color:gray;
    padding: 2px;
    cursor: pointer;
    font-weight: bold;
}
.container_expand .content {
    padding : 5px;
}
#form_submit_button {
    width: 15em;  height: 2em;
}
.mousetoHand
 {
 color:#5B3C1D;
 font-family:Arial;
 font-size:12pt;
 cursor:pointer;
 text-decoration:none;

}

.tooltip {
    text-decoration:none;
    position:relative;
}
.tooltip span {
    display:none;
}
.tooltip:hover span {
    display:block;
    position:fixed;
    overflow:hidden;
    background-color:yellow;
    font-family:Arial;
 font-size:8pt;
}

div.terms {
	width:540px;
	height:150px;
	border:1px solid #ccc;
	background:#f2f2f2;
	padding-top: 15px;
	padding: 0px 0px;
	overflow:auto;
	top: 5px;
	left: 10px;
}
div.terms p,
div.terms li {font:normal 11px/15px arial;color:#333;}
div.terms h3 {font:bold 14px/19px arial;color:#000;}
div.terms h4 {font:bold 12px/17px arial;color:#000;}
div.terms strong {color:#000;}
</style>
	<script type="text/javascript"
		src="<c:url value="/javascript/utils.js"/>">

		
	</script>
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/Properties.htm?user_request_action_param=edit_properties_action_param&seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&seq_item_id_param=${modelUc.seqItemId}&system_type_param=${modelUc.systemType}&system_type_param=${modelUc.systemType}&request_id_param=${modelUc.requestId}&response_id_param=${modelUc.responseId}&property_for_param=${modelUc.propertyFor}&row_no_param=${modelUc.rowNo}&col_no_param=${modelUc.columnNo}&error_message_param=${modelUc.error}&sequenceVersion=${modelUc.sequenceVersion}"/>
</c:if>
</head>
<body onunload="javascript:closeWaitWindow()" onclick="javascript:bodyOnClick()" onkeypress="javascript:bodyOnKeyPress(event)" onload="initSkin();">
<script type="text/javascript">
$(document).ready(function() {
	$("#tool_tip").hide();

	$("#tool_tip")
	.fadeIn(9000);
	
	var tooltips = document.querySelectorAll('.tooltip span');

	window.onmousemove = function (e) {
	    var x = (e.clientX + 20) + 'px',
	        y = (e.clientY + 20) + 'px';
	    for (var i = 0; i < tooltips.length; i++) {
	        tooltips[i].style.top = y;
	        tooltips[i].style.left = x;
	    }
	};
	
 $("#copy_submit_button").click(function(){
	 $.post("CopyProperties.htm",
				{
		 			user_request_action_param:'prop_copy',
		 			system_id_param:document.getElementById('copy_system_id_param').value,
		 			request_id_param:document.getElementById('copy_request_id_param').value,
		 			response_id_param:document.getElementById('copy_response_id_param').value,
		 			system_type_param:document.getElementById('system_type_param').value,
					property_for_param:document.getElementById('property_for_param').value
				},
				function(data,status){
					
					//var content=$("#prop_menu_place_holder").html();
					var $response=$(data);
					
					$("#descriptionTA").val($response.filter("#descriptionTA").val());
					$("#sampleTA").val($response.filter("#sampleTA").val());
					$("#sampleFailureTA").val($response.filter("#sampleFailureTA").val());
					$("#imageUrl").val($response.filter("#imageUrl").val());
					$("#failureImageUrl").val($response.filter("#failureImageUrl").val());

					for (var i=1; i<=100; i++)
						{
							if($response.filter("#propertyIdName"+i) ==null || $response.filter("#propertyIdName"+i).length<=0){
								break;
							}else{
								$("#propertyIdName"+i).val($response.filter("#propertyIdName"+i).val());
								$("#propertyIdValue"+i).val($response.filter("#propertyIdValue"+i).val());
							}
						}//end for
					
				});
});

 $("#form_submit_button").click(function(){
	  //alert("The button was clicked.");
	        var taVal=$("textarea#descriptionTA").val();
	        var sampleVal=$("textarea#sampleTA").val();
	        var sampleFailureVal=$("textarea#sampleFailureTA").val();
			//alert("Before"+taVal);
		$("input#description_param").val(taVal);
		$("input#sample_param").val(sampleVal);
		$("input#sample_failure_param").val(sampleFailureVal);
			//alert("Changed"+$("input#description_param").val());
			
			document.getElementById("subscription_order_form").submit();
	});
 
$(".header").click(function () {

    $header = $(this);
    //getting the next element
    $content = $header.next();
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
    $content.slideToggle(500, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
        $header.text(function () {
            //change text based on condition
            return $content.is(":visible") ? " - "+this.id : " + "+this.id;
        });
    });

});  

$(".sub_header").click(function () {

    $header = $(this);
    //getting the next element
    $content = $header.next();
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
    $content.slideToggle(500, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
        $header.text(function () {
            //change text based on condition
            return $content.is(":visible") ? " - "+this.id : " + "+this.id;
        });
    });

}); 

$( "#comboGrid_system").combogrid({
// 	url: '/eseq-100/SearchSystems.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
	url: 'SearchSystems.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
	colModel: [
	           {'columnName':'systemId','width':'0','label':''},
	           {'columnName':'systemName','width':'50','label':'System'},
	           {'columnName':'systemDescription','width':'0','label':''}
	           ],
	select: function( event, ui ) {

	//$( "#"+document.getElementById('selectedComboGrid').value ).val( ui.item.requestName );
	//$("#"+document.getElementById('selectedComboGrid').value).empty().append(ui.item.systemName);
	$("#comboGrid_system").val(ui.item.systemName);
	document.getElementById('copy_system_id_param').value=ui.item.systemId;
	if(ui.item.systemDescription!=null && ui.item.systemDescription!='null'){
// 		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection.png\"  onclick=\"showProperties('prop_menu_view_system_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"','prop_copy_view', event);\">  ");
		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection.png\"  onclick=\"showProperties('prop_menu_view_system_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"_SEPERATOR_0','prop_copy_view', event);\">  ");
	}else{
// 		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection_gray.png\"  onclick=\"showProperties('prop_menu_view_system_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"','prop_copy_view', event);\">  ");
		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection_gray.png\"  onclick=\"showProperties('prop_menu_view_system_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"_SEPERATOR_0','prop_copy_view', event);\">  ");
	}
	return false;
	}
	});

$( "#comboGrid_response").combogrid({
// 	url: '/eseq-100/SearchResponses.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
	url: 'SearchResponses.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
	colModel: [
				{'columnName':'responseId','width':'0','label':''},
				{'columnName':'responseName','width':'50','label':'Response'},
				{'columnName':'responseDescription','width':'0','label':''},
	           {'columnName':'systemId','width':'0','label':''},
	           {'columnName':'systemName','width':'50','label':'System'},
	           {'columnName':'systemDescription','width':'0','label':''}
	           
	           ],
	select: function( event, ui ) {

	//$( "#"+document.getElementById('selectedComboGrid').value ).val( ui.item.requestName );
	//$("#"+document.getElementById('selectedComboGrid').value).empty().append(ui.item.systemName);
	$("#comboGrid_response").val(ui.item.responseName);
	document.getElementById('copy_response_id_param').value=ui.item.responseId;
	document.getElementById('copy_system_id_param').value=ui.item.systemId;

	if(ui.item.responseDescription!=null && ui.item.responseDescription!='null'){
// 		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection.png\"  onclick=\"showProperties('prop_menu_view_response_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"','prop_copy_view', event);\">  ");
		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection.png\"  onclick=\"showProperties('prop_menu_view_response_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"_SEPERATOR_0','prop_copy_view', event);\">  ");
	}else{
// 		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection_gray.png\"  onclick=\"showProperties('prop_menu_view_response_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"','prop_copy_view', event);\">  ");
		$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection_gray.png\"  onclick=\"showProperties('prop_menu_view_response_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"_SEPERATOR_0','prop_copy_view', event);\">  ");	
	}
	
	return false;
	}
	});

 $( "#comboGrid_request").combogrid({
// 		url: '/eseq-100/SearchRequests.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
		url: 'SearchRequests.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',				
		colModel: [
				   {'columnName':'requestId','width':'0','label':''},
		           {'columnName':'requestName','width':'50','label':'Request'},
		           {'columnName':'requestDescription','width':'0','label':''},
		           {'columnName':'systemId','width':'0','label':''},
		           {'columnName':'systemName','width':'50','label':'System'},
		           {'columnName':'systemDescription','width':'0','label':''},
		           {'columnName':'responseId','width':'0','label':''},
		           {'columnName':'responseName','width':'0','label':''},
		           {'columnName':'responseDescription','width':'0','label':''}
		           ],
		select: function( event, ui ) {

		//$( "#"+document.getElementById('selectedComboGrid').value ).val( ui.item.requestName );
		//$("#"+document.getElementById('selectedComboGrid').value).empty().append(ui.item.systemName);
		$("#comboGrid_request").val(ui.item.requestName);
		document.getElementById('copy_request_id_param').value=ui.item.requestId;
		document.getElementById('copy_system_id_param').value=ui.item.systemId;
		if(ui.item.requestDescription!=null && ui.item.requestDescription!='null'){
// 			$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection.png\"  onclick=\"showProperties('prop_menu_view_request_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"','prop_copy_view', event);\">  ");
			$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection.png\"  onclick=\"showProperties('prop_menu_view_request_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"_SEPERATOR_0','prop_copy_view', event);\">  ");
		}else{
// 			$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection_gray.png\"  onclick=\"showProperties('prop_menu_view_request_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"','prop_copy_view', event);\">  ");
			$("#img_information_injection").replaceWith( "<img  id=\"img_information_injection\" class=\"mousetoHand\" title=\"Information\" alt=\"Information\" height=\"20\" width=\"20\" src=\"/images/information_injection_gray.png\"  onclick=\"showProperties('prop_menu_view_request_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+ui.item.systemId+"_SEPERATOR_"+ui.item.requestId+"_SEPERATOR_"+ui.item.responseId+"_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_0_SEPERATOR_"+document.getElementById('system_type_param').value+"_SEPERATOR_0','prop_copy_view', event);\">  ");
		}
		
         
		return false;
		}
		});
	
		
});


function pushRelease() {
	document.getElementById('user_request_action_param').value='push_release';
	document.getElementById('release_form').submit();
}

function saveRelease() {
        document.getElementById('user_request_action_param').value='save_release';
        document.getElementById('release_form').submit();
}

function regenerateRelease() {
        document.getElementById('user_request_action_param').value='regenerate_release';
        document.getElementById('release_form').submit();
}

function showProperties( id, action_param, event) {
	//alert('--------------------------<adddd'+id);
	if(id.indexOf("SEQ_IF")>-1 || id.indexOf("SEQ_SECTION")>-1){
		$.post("ViewSeqSecDesc.htm",
				{
					properties_id_param:id,
					user_request_action_param:action_param,
					copy_properties_param:'true'
				},
				function(data,status){
					
					//var content=$("#prop_menu_place_holder").html();
					var $response=$(data);
					
					var propertyMenu = $response.filter("#response_prop_menu").html();
						
					
					$("#prop_menu_place_holder").empty().append( propertyMenu );
					//alert("ID_HTML after: " + $( "#prop_menu_place_holder" ).html());
					
					showMenu1('prop_menu_place_holder', event)
					
				});
	}else{
		$.post("ViewProperties.htm",
		{
			properties_id_param:id,
			copy_properties_param:'true'
		},
		function(data,status){
			
			//var content=$("#prop_menu_place_holder").html();
			var $response=$(data);
			
			var propertyMenu = $response.filter("#response_prop_menu").html();
				
			
			$("#prop_menu_place_holder").empty().append( propertyMenu );
			//alert("ID_HTML after: " + $( "#prop_menu_place_holder" ).html());
			
			showMenu1('prop_menu_place_holder', event)
			
		});
	}
}

	
</script>
<!-- Navigation -->
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#md-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/">
<img src="images/logo.png" alt="qSequence logo" class="img-responsive">
</a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="md-navbar-collapse-1">
<ul class="nav navbar-nav navbar-right">
<c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
<li>
<a href="<c:url value="/Dashboard.htm" />">Home</a>
</li>
<li>
<a href="<c:url value="/Login.htm" />">Login</a>
</li>
</c:if>
<c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
<li>
<a href="<c:url value="/Dashboard.htm" />">Home</a>
</li>
<li>
<a href="<c:url value="/Profile.htm" />">Profile</a>
</li>
<c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
	<li>
	<a href="<c:url value="/Admin.htm" />">Admin</a>
	</li>
</c:if>
<li>
<a href="<c:url value="/Logout.htm" />">Logout</a>
</li>
</c:if>
</ul>
</div>
<!-- /.navbar-collapse -->
</nav>
<div id="container">


<!--<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;height:100px ">-->
<c:if test="${modelUc.status=='saved'}">
<c:redirect url="/ChangeReleaseList.htm?user_request_action_param=retrieve_release&saveError=${modelUc.saveError}&seqMstIds=${modelUc.seqMstIds}&sysSeqIds=${modelUc.sysSeqIds}&consolidatedSysSeqIds=${modelUc.consolidatedSysSeqIds}&sequenceVersion=${modelUc.sequenceVersion}"/>
</c:if>
<c:if test="${modelUc.status=='pushed_to_development'}">
<c:redirect url="/ChangeReleaseList.htm?message=Successfully released sequence to development."/>
</c:if>
<c:if test="${modelUc.status=='pushed_to_production'}">
<c:redirect url="/ChangeReleaseList.htm?message=Successfully released sequence to production."/>
</c:if>
<c:if test="${modelUc.toolTip=='CREATE_SEQUENCE_TIP'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Enter name of the sequence & click the create sequence button, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='FIRST_SEQUENCE_SAVE'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on the sequence name to get started, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='ADD_SEQUENCE_DESC'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on   <img id="img1"  src="images/yellow_+_button.png"/>   to add description to the sequence</div>
</c:if>
        <form id="release_form" action="ChangeReleaseList.htm" method="post" >
        <input type="hidden" id="user_request_action_param" name="user_request_action_param" value="XXX" />
        <input type="hidden" name="sequenceVersion" value="${modelUc.sequenceVersion}" />
        <input type="hidden" name="sysSeqIds" value="${modelUc.sysSeqIds}" />
        <input type="hidden" name="seqMstIds" value="${modelUc.seqMstIds}" />
        <input type="hidden" name="consolidatedSysSeqIds" value="${modelUc.consolidatedSysSeqIds}" />
		<table align="center" width="900 px">
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>
				<table align="center" border="0"  width="900 px" >
					
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td style="text-align:center;"><h1>Change Release List</h1></td><td style="text-align:right;"><!-- <a href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${modelUc.seq_mst_id_param}"/>">&lt;&lt;&nbsp;Back</a> -->&nbsp;</td></tr>
		
        			<tr style="height:50px;text-align:center;"><td colspan="2" > 
        			<c:if test="${modelUc.sequenceVersion=='draft_release'}">
        				<button id="push_release" type="button" onclick="pushRelease();">Push to Dev</button>
        			</c:if>
        			<c:if test="${modelUc.sequenceVersion=='dev_release'}">
        				<button id="push_release" type="button" onclick="pushRelease();">Push to Prod</button>
        			</c:if>
        			<button id="save_release" type="button" onclick="saveRelease();">Save</button>
        			<button id="regenerate_release" type="button" onclick="regenerateRelease();">Regenerate release</button><br>
					</td></tr>
					<tr><td colspan="2">
						<div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
						<div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
					</td></tr>	
				</table>
			</td></tr>

        <tr><td>

		<c:set var="x" value="0" />
        	<table align="center"  width="900 px">
        		<c:if test="${modelUc.userRequestAction=='draft_release'}">
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><label for="sequenceName">Change Release list</label></td></tr>
	         		

         			<c:if test="${modelUc.releaseDisplayObjectSeqList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No changes found.</strong></font>
						</td>
						</tr>
         			</c:if>
				</c:if>
        	<c:if test="${modelUc.releaseDisplayObjectSeqList[0]!=null}">
        		
         		<c:forEach items='${modelUc.releaseDisplayObjectSeqList}' var="releaseDisplayObjectSeq">
         		
<%--          		<c:set var="changed" value="false" /> --%>
<%--          		<c:if test="${x=='0' && changed=='false'}"> --%>
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>
	        			<div class="container_expand">
						    <div id="${releaseDisplayObjectSeq.ucSeqMst.seqName}" class="header"><span>- ${releaseDisplayObjectSeq.ucSeqMst.seqName}</span>
								
						    </div>
						    <div class="content">
						    
						    <c:if test="${modelUc.sequenceVersion=='draft_release'}">
						    	<label>Sequence Name</label> : <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${releaseDisplayObjectSeq.ucSeqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${releaseDisplayObjectSeq.ucSeqMst.seqDescription}">${releaseDisplayObjectSeq.ucSeqMst.seqName}</a><br />
						    </c:if>
						    <c:if test="${modelUc.sequenceVersion=='dev_release'}">
						    	<label>Sequence Name</label> : <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${releaseDisplayObjectSeq.ucSeqMst.seqMstId}&sequenceVersion=SEQ"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${releaseDisplayObjectSeq.ucSeqMst.seqDescription}">${releaseDisplayObjectSeq.ucSeqMst.seqName}</a><br />
						    </c:if>	
								<div class="tooltip" ><label>Change</label> : ${releaseDisplayObjectSeq.ucSeqMst.changeTitle}<span>${releaseDisplayObjectSeq.ucSeqMst.changeNote}</span></div><br />
								<label>Created Date</label> : 	${releaseDisplayObjectSeq.ucSeqMst.createdDate}
								<c:if test="${releaseDisplayObjectSeq.releaseDisplaySubObjectSeqList==null and releaseDisplayObjectSeq.releaseDisplaySubObjectSeqList[0]==null}">
									<div class="sub_container_expand">
										<br><font color="red"><b>No change detected</b></font>
                                        <div class="content">
                                        </div>
                                    </div>
								</c:if>
								<c:if test="${releaseDisplayObjectSeq.releaseDisplaySubObjectSeqList!=null and releaseDisplayObjectSeq.releaseDisplaySubObjectSeqList[0]!=null}">
							    	<c:forEach items='${releaseDisplayObjectSeq.releaseDisplaySubObjectSeqList}' var="releaseDisplaySubObjectSeq">
										<div class="sub_container_expand">
								    		<div id="${releaseDisplaySubObjectSeq.requestName} - ${releaseDisplaySubObjectSeq.systemName}" class="sub_header"><span>- ${releaseDisplaySubObjectSeq.requestName} - ${releaseDisplaySubObjectSeq.systemName}</span>
								    		
											</div>
								    		<div class="content">
								    			<c:forEach items='${releaseDisplaySubObjectSeq.ucSeqReleaseList}' var="ucSeqRelease">
								        			<div style="background-color:green;width:99%;text-align: center;">Change : ${ucSeqRelease.changeTitle}</div>
								        			<table width="825px">
								        				<c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
									        				<tr style=" color: black;font-weight:bold;"><td width="33%">Change From</td><td  width="33%">Change To</td><td width="33%">Comments</td></tr>
									        				<tr><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        				<c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
								        				<tr style="color: black;font-weight:bold;"><td width="66%" colspan="2">Description</td><td width="33%">Comments</td></tr>
								        				<tr><td width="66%" colspan="2"><div class="terms">${ucSeqRelease.changeDescTo}</div></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        			</table>
								        		</c:forEach> 
								    			<c:forEach items='${releaseDisplaySubObjectSeq.consumerUcSeqReleaseList}' var="ucSeqRelease">
								        			<div style="background-color:yellow;width:99%;text-align: center;">Change : ${ucSeqRelease.changeTitle}</div>
								        			<table width="825px">
								        				<c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
									        				<tr style=" color: black;"><td width="33%">Change From</td><td  width="33%">Change To</td><td width="33%">Comments</td></tr>
									        				<tr><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        				<c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
								        				<tr style=" color: black;"><td width="66%" colspan="2">Description</td><td width="33%">Comments</td></tr>
								        				<tr><td width="66%" colspan="2"><div class="terms">${ucSeqRelease.changeDescTo}</div></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        			</table>
								        		</c:forEach> 
											</div>
										</div>
									</c:forEach>
							    </c:if>
						    </div>
						</div>
					</td>
					
<%-- 					<c:set var="changed" value="true" /> --%>
<%-- 					<c:set var="x" value="1" /> --%>
        		</tr>
<%--         		</c:if> --%>

<%--          		<c:if test="${x=='1' && changed=='false'}"> --%>
<!--         		<tr style="background-color:#E8E8E8; color: black;"> -->
<!--         			<td> -->
<!--         			<div class="container_expand"> -->
<%-- 						    <div id="${releaseDisplayObjectSeq.ucSeqMst.seqName}" class="header"><span>- ${releaseDisplayObjectSeq.ucSeqMst.seqName}</span> --%>
								
<!-- 						    </div> -->
<!-- 						    <div class="content"> -->
<%-- 						    	Sequence Name : <a class="tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${releaseDisplayObjectSeq.ucSeqMst.seqMstId}&sequenceVersion=DRAFT"/>">${releaseDisplayObjectSeq.ucSeqMst.seqName}<span>${releaseDisplayObjectSeq.ucSeqMst.seqDescription}</span></a><br /> --%>
<%-- 								Change : <div class="tooltip"  align="center">${releaseDisplayObjectSeq.ucSeqMst.changeTitle}<span>${releaseDisplayObjectSeq.ucSeqMst.changeNote}</span></div><br /> --%>
<%-- 								Created Date : 	${releaseDisplayObjectSeq.ucSeqMst.createdDate} --%>
<%-- 						    	<c:forEach items='${releaseDisplayObjectSeq.releaseDisplaySubObjectSeqList}' var="releaseDisplaySubObjectSeq"> --%>
<!-- 									<div class="container_expand"> -->
<%-- 							    		<div id="${releaseDisplaySubObjectSeq.requestName} - ${releaseDisplaySubObjectSeq.systemName}" class="header"><span>- ${releaseDisplaySubObjectSeq.requestName} - ${releaseDisplaySubObjectSeq.systemName}</span> --%>
							    			
<!-- 										</div> -->
<!-- 							    		<div class="content"> -->
<%-- 							    			<c:forEach items='${releaseDisplaySubObjectSeq.ucSeqReleaseList}' var="ucSeqRelease"> --%>
<%-- 							        			<label>Change</label> : ${ucSeqRelease.changeTitle} --%>
<!-- 							        			<table width="825px"> -->
<!-- 							        				<tr style="background-color:green; color: black;"><td width="33%">Change From</td><td  width="33%">Change To</td><td width="33%">Comments</td></tr> -->
<%-- 							        				<tr><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr> --%>
<!-- 							        			</table> -->
<%-- 							        		</c:forEach>  --%>
<!-- 										</div> -->
<!-- 									</div> -->
<%-- 								</c:forEach> --%>
<!-- 						    </div> -->
<!-- 						</div> -->
<!-- 					</td> -->
<%-- 					<c:set var="x" value="0" /> --%>
					
<!--         		</tr> -->
<%--         		</c:if> --%>
        		</c:forEach>
        		</c:if>
        <!--  processing SYS_SEQ -->		
        		<c:if test="${modelUc.releaseDisplayObjectSysSeqList[0]!=null}">
        		
         		<c:forEach items='${modelUc.releaseDisplayObjectSysSeqList}' var="releaseDisplayObjectSeq">
         		
<%--          		<c:set var="changed" value="false" /> --%>
<%--          		<c:if test="${x=='0' && changed=='false'}"> --%>
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>
	        			<div class="container_expand">
						    <div id="${releaseDisplayObjectSeq.ucSeqMst.seqName}" class="header"><span>- ${releaseDisplayObjectSeq.ucSeqMst.seqName}</span>
								
						    </div>
						    <div class="content">
						    <c:if test="${modelUc.sequenceVersion=='draft_release'}">
						    	<label>Sequence Name</label> : <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${releaseDisplayObjectSeq.ucSeqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${releaseDisplayObjectSeq.ucSeqMst.seqDescription}">${releaseDisplayObjectSeq.ucSeqMst.seqName}</a><br />
						    </c:if>
						    <c:if test="${modelUc.sequenceVersion=='dev_release'}">
						    	<label>Sequence Name</label> : <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${releaseDisplayObjectSeq.ucSeqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${releaseDisplayObjectSeq.ucSeqMst.seqDescription}">${releaseDisplayObjectSeq.ucSeqMst.seqName}</a><br />
						    </c:if>	
								<div class="tooltip" ><label>Change</label> : ${releaseDisplayObjectSeq.ucSeqMst.changeTitle}<span>${releaseDisplayObjectSeq.ucSeqMst.changeNote}</span></div><br />
								<label>Created Date</label> : 	${releaseDisplayObjectSeq.ucSeqMst.createdDate}
								<c:if test="${releaseDisplayObjectSeq.releaseDisplaySubObjectSysSeqList==null and releaseDisplayObjectSeq.releaseDisplaySubObjectSysSeqList[0]==null}">
									<div class="sub_container_expand">
										<br><font color="red"><b>No change detected</b></font>
                                        <div class="content">
                                        </div>
                                    </div>
								</c:if>
								<c:if test="${releaseDisplayObjectSeq.releaseDisplaySubObjectSysSeqList!=null and releaseDisplayObjectSeq.releaseDisplaySubObjectSysSeqList[0]!=null}">
							    	<c:forEach items='${releaseDisplayObjectSeq.releaseDisplaySubObjectSysSeqList}' var="releaseDisplaySubObjectSeq">
										<div class="sub_container_expand">
								    		<div id="${releaseDisplaySubObjectSeq.requestName} - ${releaseDisplaySubObjectSeq.systemName}" class="sub_header"><span>- ${releaseDisplaySubObjectSeq.requestName} - ${releaseDisplaySubObjectSeq.systemName}</span>
								    		
											</div>
								    		<div class="content">
								    			<c:forEach items='${releaseDisplaySubObjectSeq.ucSeqReleaseList}' var="ucSeqRelease">
								        			<div style="background-color:green;width:99%;text-align: center;">Change : ${ucSeqRelease.changeTitle}</div>
								        			<table width="825px">
								        				<c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
									        				<tr style=" color: black;font-weight:bold;"><td width="33%">Change From</td><td  width="33%">Change To</td><td width="33%">Comments</td></tr>
									        				<tr><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        				<c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
								        				<tr style="color: black;font-weight:bold;"><td width="66%" colspan="2">Description</td><td width="33%">Comments</td></tr>
								        				<tr><td width="66%" colspan="2"><div class="terms">${ucSeqRelease.changeDescTo}</div></td><td width="33%"><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        			</table>
								        		</c:forEach> 
								    			<c:forEach items='${releaseDisplaySubObjectSeq.consumerUcSeqReleaseList}' var="ucSeqRelease">
								        			<div style="background-color:yellow;width:99%;text-align: center;">Change : ${ucSeqRelease.changeTitle}</div>
								        			<table width="825px">
								        				<c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
									        				<tr style=" color: black;"><td width="33%">Change From</td><td  width="33%">Change To</td><td width="33%">Comments</td></tr>
									        				<tr><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td><td width="33%"><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        				<c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
								        				<tr style=" color: black;"><td width="66%" colspan="2">Description</td><td width="33%">Comments</td></tr>
								        				<tr><td width="66%" colspan="2"><div class="terms">${ucSeqRelease.changeDescTo}</div></td><td width="33%"><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td></tr>
								        				</c:if>
								        			</table>
								        		</c:forEach> 
											</div>
										</div>
									</c:forEach>
							    </c:if>
						    </div>
						</div>
					</td>

        		</c:forEach>
        		</c:if>
        	</table>
       </td>
       </tr> 
	</table>
	</form>
	<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
