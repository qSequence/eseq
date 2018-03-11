<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Edit Information</title>
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

  .button { font: bold 11px Arial; text-decoration: none; background-color: #EEEEEE; color: #333333; padding: 2px 6px 2px 6px; border-top: 1px solid #CCCCCC; border-right: 1px solid #333333; border-bottom: 1px solid #333333; border-left: 1px solid #CCCCCC; }

  .buttonSystem { font: bold 11px Arial; text-decoration: none; background-color: #EEEEEE; color: #333333; padding: 10px 60px 10px 60px; border-top: 1px solid #CCCCCC; border-right: 1px solid #333333; border-bottom: 1px solid #333333; border-left: 1px solid #CCCCCC; }


label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
}

.container_expand {
    width:80%;
    margin:0 auto;
    left: 150px;
    border:1px solid #d3d3d3;
}
.container_expand div {
    width:100%;
}
.container_expand .header {
    background-color:#d3d3d3;
    padding: 2px;
    cursor: pointer;
    font-weight: bold;
}
.container_expand .content {
    display: none;
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
</style>
	<script type="text/javascript"
		src="<c:url value="/javascript/utils.js"/>">

		
	</script>
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/Properties.htm?user_request_action_param=edit_properties_action_param&seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&sys_seq_id=${modelUc.sysSeqId}&seq_item_id_param=${modelUc.seqItemId}&system_type_param=${modelUc.systemType}&system_type_param=${modelUc.systemType}&system_id_param=${modelUc.systemId}&request_id_param=${modelUc.requestId}&response_id_param=${modelUc.responseId}&property_for_param=${modelUc.propertyFor}&row_no_param=${modelUc.rowNo}&col_no_param=${modelUc.columnNo}&error_message_param=${modelUc.error}&sequenceVersion=${modelUc.sequenceVersion}"/>
</c:if>
</head>
<body onunload="javascript:closeWaitWindow()" onclick="javascript:bodyOnClick()" onkeypress="javascript:bodyOnKeyPress(event)" onload="initSkin();">
<script type="text/javascript">
$(document).ready(function() {
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
            return $content.is(":visible") ? "Collapse copy information" : "Expand copy information";
        });
    });

});   

$( "#hostClusterName").combogrid({
// 	url: '/eseq-100/SearchSystems.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
	url: 'SearchHostCluster.htm',
	colModel: [
	           {'columnName':'hostId','width':'0','label':''},
	           {'columnName':'searchResult','width':'100','label':'Search Result'},
	           {'columnName':'hostClusterName','width':'0','label':''}
	           ],
	select: function( event, ui ) {

	//$( "#"+document.getElementById('selectedComboGrid').value ).val( ui.item.requestName );
	//$("#"+document.getElementById('selectedComboGrid').value).empty().append(ui.item.systemName);
	$("#hostClusterName").val(ui.item.hostClusterName);
	$("#hostId").val(ui.item.hostId);
	
	return false;
	}
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


<table align="center" border="0" width=80%>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr><td colspan="2"><h1>Edit Information</h1><h2> ${modelUc.ucSeqDiagramName}</h2></td><td style="text-align:right;">
		<c:if test="${(modelUc.ucSeqMst.seqMstId!=null and modelUc.ucSeqMst.seqMstId!='' and modelUc.ucSeqMst.seqMstId!='0') or (modelUc.sysSeqId !=null and modelUc.sysSeqId !='' and modelUc.sysSeqId !='0')}">
			<a href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&sequenceVersion=${modelUc.sequenceVersion}&sys_seq_id=${modelUc.sysSeqId}"/>">&lt;&lt;&nbsp;Back to ${modelUc.ucSeqMst.seqName}</a>
		</c:if>
		</td></tr>
		<tr><td colspan="3">&nbsp;</td></tr>
</table>		
<div class="container_expand">
    <div class="header"><span>Expand copy information</span>

    </div>
    <div class="content">
	<p>Copy Information from</p>

        <input id="comboGrid_${modelUc.propertyFor}" name="informationCopy" type="text" size="50" maxlength="1900"  />
        <img  id="img_information_injection" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/information_injection_gray.png" />"
             onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}','prop_copy_view', event);">
        <button id="copy_submit_button"  type="button">Copy</button>
		        <input id="copy_system_id_param" name="copy_system_id_param" type="hidden" value="" />
				<input id="copy_request_id_param" name="copy_request_id_param" type="hidden" value="" />
				<input id="copy_response_id_param" name="copy_response_id_param" type="hidden" value="" />

    </div>
</div>

<form id="subscription_order_form" action="Properties.htm" method="post" >
				<input id="sequenceVersion" name="sequenceVersion" type="hidden" value="${modelUc.sequenceVersion}" />
	<table align="center" border="0" width=80%>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr><td colspan="3">&nbsp;</td></tr>
			<tr><td colspan="2"><label for="description">Description</label>&nbsp;&nbsp;&nbsp;<font color="red" size="1px">${modelUc.descMessage}</font></td>
			<c:if test="${modelUc.user_request_action_param!='view_properties_action_param'}">
				<td>
					<c:if test="${modelUc.userReadWriteAccess=='true'}">
						<div style="float:right;"><input id="form_submit_button" class="button"  type="button" style="width:105px" value="Save"><br /><br />
							<a align="right" class="button" href="<c:url value="UpdateCapability.htm?property_for_param=${modelUc.propertyFor}&system_id_param=${modelUc.systemId}&system_type_param=${modelUc.systemType}&request_id_param=${modelUc.requestId}&response_id_param=${modelUc.responseId}"/>">Update capability</a>
						</div>
					</c:if>
				&nbsp;&nbsp;&nbsp;<font color="red">${modelUc.error}</font></td>
			</c:if>
			</tr>
			<tr><td colspan="3"><textarea maxlength="3900" name="descriptionTA" id="descriptionTA" cols="100" rows="4">${modelUc.description}</textarea></td></tr>
			<c:if test="${modelUc.propertyFor=='system'}">
				<tr><td colspan="3"><label for="hostCluster">Host Cluster</label>&nbsp;&nbsp;&nbsp;<font color="red"  size="1px">${modelUc.hostClusterMessage}</font>
					<a target="_blank" href="<c:url value="HostClusterList.htm?user_request_action_param=default_action"/>">>>Host Cluster List<<</a></td></tr>
			  	<tr><td colspan="3"><input id="hostClusterName" name="hostClusterName" type="text" size="115" maxlength="100" value="${modelUc.hostClusterName}" /></td></tr>
			  	<tr><td colspan="3"><input id="hostId" name="hostId" type="hidden" size="100" maxlength="100" value="${modelUc.hostId}" /></td></tr>
			</c:if>
			<c:if test="${modelUc.propertyFor!='system'}">
			

					<tr><td colspan="3"><label for="sample">Sample ${modelUc.propertyFor}</label>&nbsp;&nbsp;&nbsp;<font color="red" size="1px" >${modelUc.sampleMessage}</font></td></tr>
					<tr><td colspan="3"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="100" rows="4">${modelUc.sample}</textarea></td></tr>
					<c:if test="${modelUc.propertyFor=='response'}">
						<tr><td colspan="3"><label for="sample">Sample failure ${modelUc.propertyFor}</label>&nbsp;&nbsp;&nbsp;<font color="red"  size="1px">${modelUc.sampleFailureMessage}</font></td></tr>
						<tr><td colspan="3"><textarea maxlength="3900" name="sampleFailureTA" id="sampleFailureTA" cols="100" rows="4">${modelUc.sampleFailure}</textarea></td></tr>
					</c:if>

				<c:if test="${ fn:containsIgnoreCase(modelUc.systemType, 'portal')  or fn:containsIgnoreCase(modelUc.systemType, 'application_server') or fn:containsIgnoreCase(modelUc.systemType, 'phone_app')}">
					<c:if test="${modelUc.propertyFor=='request'}">
			  			<tr><td colspan="3"><label for="imageUrl">Image Url</label>&nbsp;&nbsp;&nbsp;<font color="red"  size="1px">${modelUc.urlMessage}</font></td></tr>
			  		  	<tr><td colspan="3"><input id="imageUrl" name="imageUrl" type="text" size="100" maxlength="1900" value="${modelUc.imageUrl}" /></td></tr>
		  		  	</c:if>
					<c:if test="${modelUc.propertyFor=='response'}">
			  			<tr><td colspan="3"><label for="imageUrl">Image Url Success Response</label>&nbsp;&nbsp;&nbsp;<font color="red"  size="1px">${modelUc.urlMessage}</font></td></tr>
			  		  	<tr><td colspan="3"><input id="imageUrl" name="imageUrl" type="text" size="100" maxlength="1900" value="${modelUc.imageUrl}" /></td></tr>
			  			<tr><td colspan="3"><label for="failureImageUrl">Image Url Failure Response</label>&nbsp;&nbsp;&nbsp;<font color="red"  size="1px">${modelUc.urlMessage}</font></td></tr>
			  		  	<tr><td colspan="3"><input id="failureImageUrl" name="failureImageUrl" type="text" size="100" maxlength="1900" value="${modelUc.failureImageUrl}" /></td></tr>		  		  	
		  		  	</c:if>	  		  	
		  		</c:if>
			</c:if>
	
	  		<tr><td><label for="propertyName">Property Name</label></td>
				<td><label for="propertyValue">Property Value</label>&nbsp;&nbsp;&nbsp;<font color="red" size="1px">${modelUc.propMessage}</font></td>
			</tr>
	
			<c:forEach items="${modelUc.ucSeqDiagramPropertyList}" var="ucSeqDiagramProperty" varStatus="status" begin="0" end="${modelUc.numberOfPropertiesAllowed}">
				<c:if test="${ucSeqDiagramProperty.propertyId==null}">
				
	         	<tr><td>
	         			<input id="propertyIdName${ucSeqDiagramProperty.propertyIdNo}" name="propertyName${status.count}" type="text" size="30" maxlength="100" value="${ucSeqDiagramProperty.propertyName}" />
	            	</td>
	            	<td>
	            		<input id="propertyIdValue${ucSeqDiagramProperty.propertyIdNo}" name="propertyValue${status.count}" type="text" size="80" maxlength="4000" value="${ucSeqDiagramProperty.propertyValue}" />
	            	</td>
	            	<td>&nbsp;</td>
	            </tr>
	            </c:if>
	            <c:if test="${ucSeqDiagramProperty.propertyId!=null}">
				
	         	<tr><td>
	         			<input id="propertyIdName${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdName${ucSeqDiagramProperty.propertyId}" type="text" size="30" maxlength="100" value="${ucSeqDiagramProperty.propertyName}" />
	            	</td>
	            	<td>
	            		<input id="propertyIdValue${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdValue${ucSeqDiagramProperty.propertyId}" type="text" size="80" maxlength="4000"  value="${ucSeqDiagramProperty.propertyValue}" />
	            	</td>
	            	<td>&nbsp;</td>
	            </tr>
	            </c:if>
			</c:forEach>
			<tr><td colspan="3">
				<input id="row_no_param" name="row_no_param" type="hidden" value="${modelUc.rowNo}" />
				<input id="col_no_param" name="col_no_param" type="hidden" value="${modelUc.columnNo}" />
				<input id="seq_item_id_param" name="seq_item_id_param" type="hidden" value="${modelUc.seqItemId}" />
				<input id="description_param" name="description_param" type="hidden"  />
				<input id="sample_param" name="sample_param" type="hidden"  />
				<input id="sample_failure_param" name="sample_failure_param" type="hidden"  />
				<input id="system_id_param" name="system_id_param" type="hidden" value="${modelUc.systemId}" />
				<input id="system_type_param" name="system_type_param" type="hidden" value="${modelUc.systemType}" />
				<input id="request_id_param" name="request_id_param" type="hidden" value="${modelUc.requestId}" />
				<input id="response_id_param" name="response_id_param" type="hidden" value="${modelUc.responseId}" />
				<input id="seq_mst_id_param" name="seq_mst_id_param" type="hidden" value="${modelUc.ucSeqMst.seqMstId}" />
				<input id="sys_seq_id" name="sys_seq_id" type="hidden" value="${modelUc.sysSeqId}" />
				<input id="property_for_param" name="property_for_param" type="hidden" value="${modelUc.propertyFor}" />
				<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="prop_menu_save_system" />
				<!--<input id="add_property_button" type="button" value="Add Property">-->
				
			</td></tr>
		<tr><td colspan="3">
		
		<div id="sometext" align="center" ><strong>
    ${modelUc.displayPromoMessage}</strong>
</div>
<!-- 
<div id="add_property_div" align="center" >
    Limited properties allowed with this version. You can add properties with enterprise version.
</div>
 -->
				<script type="text/javascript">
$('#add_property_button').click(function() {
// 	$("#add_property_div")
// 	.fadeIn("slow")
// 	.animate({ opacity: 0 }, 6000);
});
</script>
		</td></tr>	
	</table>
</form>
							<div  id="prop_menu_place_holder" class="propertiesMenus"
								onclick="event.cancelBubble=true">
								
							</div>
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 				
<%@ include file="footer.jsp"%>

