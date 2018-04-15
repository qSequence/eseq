<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>View >>> Interface <<<</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css" />
<link href="css/anirban.css" rel="stylesheet">
<%-- END 12 Oct added combogrid jquery libraries--%>
<%-- <style>

label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
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
	width:1112px;
	height:150px;
	border:1px solid #ccc;
	background:#f2f2f2;
	padding-top: 15px;
	padding: 0px 0px;
	overflow:auto;
	top: 5px;
	left: 10px;
}
div.termsDesc {
	width:350px;
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
</style> --%>
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
            return $content.is(":visible") ? " <i class="fa fa-chevron-up pull-right"></i> "+this.id : " <i class="fa pull-right fa-chevron-down"></i> "+this.id;
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
<div class="wrap-navbar">
  <div class="topHeader">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header navbar-left">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img src="images/logo2.png" alt="" /></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
              <li><a href="<c:url value="/Dashboard.htm" />">Home</a></li>
              <li><a href="<c:url value="/Login.htm" />">Login</a></li>
            </c:if>
            <c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
              <li><a href="<c:url value="/Dashboard.htm" />">Home</a></li>
              <li><a href="<c:url value="/Profile.htm" />">Profile</a></li>
              <c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
                <li><a href="<c:url value="/Admin.htm" />">Admin</a></li>
              </c:if>
              <li><a href="<c:url value="/Logout.htm" />">Logout</a></li>
            </c:if>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
  </div>
</div>
<div class="container">


<!--<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;height:100px ">-->
<c:if test="${modelUc.status=='saved'}">
<c:redirect url="/ChangeReleaseList.htm?user_request_action_param=retrieve_release&saveError=${modelUc.saveError}&seqMstIds=${modelUc.seqMstIds}&sysSeqIds=${modelUc.sysSeqIds}&consolidatedSysSeqIds=${modelUc.consolidatedSysSeqIds}&sequenceVersion=${modelUc.sequenceVersion}"/>
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
        <div class="wrap-table-del">
          <h1>Interface : ${modelUc.name}</h1>
          <div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
          <div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
        </div>

        <div class="wrap-table-del">
          <c:set var="x" value="0" />
                <table align="center"  width="1200 px">


                  <tr>
                    <td>
                       <div class="container_expand">
                      <div id="Description and properties" class="header"><span>- Description and properties</span>

                      </div>
                      <div class="content">
                        <!-- Description -->

                        <div class="sub_container_expand">
                              <div id="Description" class="sub_header"><span>- Description</span>

                            </div>
                              <div class="content">


                                    <table>
                                      <c:if test="${modelUc.propertyFor=='request' or modelUc.propertyFor=='response'}">
                                        <tr><td width="33%">Request : ${modelUc.requestName}</td><td  width="33%">Response : ${modelUc.responseName}</td><td width="33%">Sytem : ${modelUc.systemName}</td></tr>
                                        <tr><td width="33%"><div class="termsDesc">${modelUc.requestDescription}</div></td><td width="33%"><div class="termsDesc">${modelUc.responseDescription}</div></td><td width="33%"><div class="termsDesc">${modelUc.systemDescription}</div></td></tr>
                                      </c:if>
                                      <c:if test="${modelUc.propertyFor!=null and modelUc.propertyFor=='system'}">
                                        <tr><td width="99%" colspan="3"><div class="terms">${modelUc.systemDescription}</div></td></tr>
                                      </c:if>

                                    </table>


                            </div>
                          </div>


                        <!-- Description end -->

                        <div class="sub_container_expand">
                            <div id="Properties" class="sub_header"><span>- Properties</span>

                          </div>
                            <div class="content">
                                  <table>
                                    <tr>
                                    <c:if test="${modelUc.propertyFor=='request' or modelUc.propertyFor=='response'}">
                                      <td width="33%">Request : ${modelUc.requestName}</td><td  width="33%">Response : ${modelUc.responseName}</td><td width="33%">System : ${modelUc.systemName}</td>
                                    </c:if>
                                    <c:if test="${modelUc.propertyFor=='system'}">
                                      <td colspan="3" width="99%">System : ${modelUc.systemName}</td>
                                    </c:if>
                                    </tr>
                                    <tr>
                                    <c:if test="${modelUc.propertyFor=='request' or modelUc.propertyFor=='response'}">
                                      <td width="33%"  style="vertical-align:top">
                                      <table>
                                    <c:forEach items='${modelUc.ucSeqDiagramPropertyRequestList}' var="prop">

                                      <c:if test="${prop.propertyName!=null and prop.propertyValue!=null}">
                                      <c:set var="changed" value="false" />
                                        <c:if test="${x=='0' && changed=='false'}">
                                      <tr  onMouseOver="this.bgColor='#99CCFF';"
                                        onMouseOut="this.bgColor='#85E0E0';">
                                        <td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="300" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
                                        <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
                                        </c:if>
                                        <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
                                        </c:if>
                                      </tr>
                                      <c:set var="changed" value="true" />
                                      <c:set var="x" value="1" />
                                    </c:if>
                                    <c:if test="${x=='1' && changed=='false'}">
                                      <c:set var="x" value="0" />
                                      <tr  onMouseOver="this.bgColor='#99CCFF';"
                                        onMouseOut="this.bgColor='#F6F6F6';">
                                        <td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="300" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
                                        <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
                                        </c:if>
                                        <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
                                        </c:if>

                                          </tr>
                                        </c:if>
                                    </c:if>
                                    </c:forEach>

                                    </table>
                                    </td>
                                    <td width="33%"  style="vertical-align:top">
                                      <table>
                                    <c:forEach items='${modelUc.ucSeqDiagramPropertyResponseList}' var="prop">

                                      <c:if test="${prop.propertyName!=null and prop.propertyValue!=null}">
                                      <c:set var="changed" value="false" />
                                        <c:if test="${x=='0' && changed=='false'}">
                                      <tr  onMouseOver="this.bgColor='#99CCFF';"
                                        onMouseOut="this.bgColor='#85E0E0';">
                                        <td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="300" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
                                        <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
                                        </c:if>
                                        <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
                                        </c:if>
                                      </tr>
                                      <c:set var="changed" value="true" />
                                      <c:set var="x" value="1" />
                                    </c:if>
                                    <c:if test="${x=='1' && changed=='false'}">
                                      <c:set var="x" value="0" />
                                      <tr  onMouseOver="this.bgColor='#99CCFF';"
                                        onMouseOut="this.bgColor='#F6F6F6';">
                                        <td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="300" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
                                        <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
                                        </c:if>
                                        <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
                                        </c:if>

                                          </tr>
                                        </c:if>
                                    </c:if>
                                    </c:forEach>

                                    </table>
                                    </td>
                                    </c:if>
                                    <td width="33%"  style="vertical-align:top">
                                      <table>
                                    <c:forEach items='${modelUc.ucSeqDiagramPropertySystemList}' var="prop">

                                      <c:if test="${prop.propertyName!=null and prop.propertyValue!=null}">
                                      <c:set var="changed" value="false" />
                                        <c:if test="${x=='0' && changed=='false'}">
                                      <tr  onMouseOver="this.bgColor='#99CCFF';"
                                        onMouseOut="this.bgColor='#85E0E0';">
                                        <td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="300" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
                                        <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
                                        </c:if>
                                        <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
                                        </c:if>
                                      </tr>
                                      <c:set var="changed" value="true" />
                                      <c:set var="x" value="1" />
                                    </c:if>
                                    <c:if test="${x=='1' && changed=='false'}">
                                      <c:set var="x" value="0" />
                                      <tr  onMouseOver="this.bgColor='#99CCFF';"
                                        onMouseOut="this.bgColor='#F6F6F6';">
                                        <td id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="300" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</td>
                                        <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></td>
                                        </c:if>
                                        <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                          <td id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="525" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></td>
                                        </c:if>

                                          </tr>
                                        </c:if>
                                    </c:if>
                                    </c:forEach>

                                    </table>
                                    </td>
                                  </tr>
                                  </table>
                          </div>
                        </div>
                      </div>
                  </div>




                      <div class="container_expand">
                      <div id="Draft" class="header"><span>- Draft</span>

                      </div>
                      <div class="content">
                        <!-- UI Display -->
                        <c:if test="${modelUc.requestImageDraft!=null and modelUc.responseImageDraft!=null and modelUc.responseFailureImageDraft!=null}">
                        <div class="sub_container_expand">
                              <div id="UserInterface" class="sub_header"><span>- UserInterface</span>

                            </div>
                              <div class="content">


                                    <table width="100%">

                                      <tr style=" color: black;font-weight:bold;"><td width="33%"><img src="${modelUc.requestImageDraft}" alt="Image not available" height="200" width="270"></td><td  width="33%"><img src="${modelUc.responseImageDraft}" alt="Image not available" height="200" width="270"></td><td width="33%"><img src="${modelUc.responseFailureImageDraft}" alt="Image not available" height="200" width="270"></td></tr>

                                    </table>


                                    <div style="background-color:yellow;width:99%;text-align: center;">Sequences</div>
                                    <table width="100%">

                                      <tr><td width="99%" colspan="3"><div class="terms">${modelUc.seqUrlString} <br><br>${modelUc.sysSeqUrlString}</div></td></tr>

                                    </table>

                            </div>
                          </div>

                        </c:if>

                        <!-- UI Display end -->
                      <c:if test="${modelUc.interfaceObjectDisplayDraftList[0]!=null}">
                          <c:forEach items='${modelUc.interfaceObjectDisplayDraftList}' var="interfaceObjectDisplayDraft">
                          <div class="sub_container_expand">
                              <div id="SET_${interfaceObjectDisplayDraft.lineNo}" class="sub_header"><span>- SET_${interfaceObjectDisplayDraft.lineNo}</span>

                            </div>
                              <div class="content">


                                    <table width="100%">

                                      <tr style=" color: black;font-weight:bold;"><td width="33%">Request</td><td  width="33%">Response</td><td width="33%">Failure Response</td></tr>
                                      <tr><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayDraft.request}</textarea></td><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayDraft.response}</textarea></td><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayDraft.failureResponse}</textarea></td></tr>


                                    </table>


                                    <div style="background-color:yellow;width:99%;text-align: center;">Sequences</div>
                                    <table width="100%">
                                      <tr style=" color: black;"><td width="99%" colspan="3">Description</td></tr>
                                      <tr><td width="99%" colspan="3"><div class="terms">${interfaceObjectDisplayDraft.seqUrlString} <br><br>${interfaceObjectDisplayDraft.sysSeqUrlString}</div></td></tr>

                                    </table>

                            </div>
                          </div>
                        </c:forEach>
                        </c:if>
                        <c:if test="${modelUc.interfaceObjectDisplaySystemDraftList[0]!=null}">
                          <c:forEach items='${modelUc.interfaceObjectDisplaySystemDraftList}' var="interfaceObjectDisplayDraft">
                          <div class="sub_container_expand">
                              <div id="${interfaceObjectDisplayDraft.requestName}" class="sub_header"><span>- ${interfaceObjectDisplayDraft.requestName}</span>

                            </div>
                              <div class="content">


                                    <table width="100%">

                                      <tr style=" color: black;font-weight:bold;"><td colspan="3" width="99%">${interfaceObjectDisplayDraft.requestInterfaceUrl}</td></tr>

                                    </table>


                                    <div style="background-color:yellow;width:99%;text-align: center;">Sequences</div>
                                    <table width="100%">
                                      <tr style=" color: black;"><td width="99%" colspan="3">Description</td></tr>
                                      <tr><td width="99%" colspan="3"><div class="terms">${interfaceObjectDisplayDraft.seqUrlString} <br><br>${interfaceObjectDisplayDraft.sysSeqUrlString}</div></td></tr>

                                    </table>

                            </div>
                          </div>
                        </c:forEach>
                        </c:if>
                      </div>
                  </div>

                  <div class="container_expand">
                      <div id="Development" class="header"><span>- Development</span>

                      </div>
                      <div class="content">

                      <c:if test="${modelUc.interfaceObjectDisplayDevList[0]!=null}">
                          <c:forEach items='${modelUc.interfaceObjectDisplayDevList}' var="interfaceObjectDisplayDev">
                          <div class="sub_container_expand">
                              <div id="SET_${interfaceObjectDisplayDev.lineNo}" class="sub_header"><span>- SET_${interfaceObjectDisplayDev.lineNo}</span>

                            </div>
                              <div class="content">


                                    <table width="100%">

                                      <tr style=" color: black;font-weight:bold;"><td width="33%">Request</td><td  width="33%">Response</td><td width="33%">Failure Response</td></tr>
                                      <tr><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayDev.request}</textarea></td><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayDev.response}</textarea></td><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayDev.failureResponse}</textarea></td></tr>


                                    </table>


                                    <div style="background-color:yellow;width:99%;text-align: center;">Sequences</div>
                                    <table width="100%">
                                      <tr style=" color: black;"><td width="99%" colspan="3">Description</td></tr>
                                      <tr><td width="99%" colspan="3"><div class="terms">${interfaceObjectDisplayDev.seqUrlString} <br><br>${interfaceObjectDisplayDev.sysSeqUrlString}</div></td></tr>

                                    </table>

                            </div>
                          </div>
                        </c:forEach>
                        </c:if>
                        <c:if test="${modelUc.interfaceObjectDisplaySystemDevList[0]!=null}">
                          <c:forEach items='${modelUc.interfaceObjectDisplaySystemDevList}' var="interfaceObjectDisplayDraft">
                          <div class="sub_container_expand">
                              <div id="${interfaceObjectDisplayDraft.requestName}" class="sub_header"><span>- ${interfaceObjectDisplayDraft.requestName}</span>

                            </div>
                              <div class="content">


                                    <table width="100%">

                                      <tr style=" color: black;font-weight:bold;"><td colspan="3" width="99%">${interfaceObjectDisplayDraft.requestInterfaceUrl}</td></tr>

                                    </table>


                                    <div style="background-color:yellow;width:99%;text-align: center;">Sequences</div>
                                    <table width="100%">
                                      <tr style=" color: black;"><td width="99%" colspan="3">Description</td></tr>
                                      <tr><td width="99%" colspan="3"><div class="terms">${interfaceObjectDisplayDraft.seqUrlString} <br><br>${interfaceObjectDisplayDraft.sysSeqUrlString}</div></td></tr>

                                    </table>

                            </div>
                          </div>
                        </c:forEach>
                        </c:if>
                      </div>
                  </div>

                  <div class="container_expand">
                      <div id="Production" class="header"><span>- Production</span>

                      </div>
                      <div class="content">

                      <c:if test="${modelUc.interfaceObjectDisplayProdList[0]!=null}">
                          <c:forEach items='${modelUc.interfaceObjectDisplayProdList}' var="interfaceObjectDisplayProd">
                          <div class="sub_container_expand">
                              <div id="SET_${interfaceObjectDisplayProd.lineNo}" class="sub_header"><span>- SET_${interfaceObjectDisplayProd.lineNo}</span>

                            </div>
                              <div class="content">


                                    <table width="100%">

                                      <tr style=" color: black;font-weight:bold;"><td width="33%">Request</td><td  width="33%">Response</td><td width="33%">Failure Response</td></tr>
                                      <tr><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayProd.request}</textarea></td><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayProd.response}</textarea></td><td width="33%"><textarea rows="11" cols="45" name="xmlDocument" disabled WRAP="off">${interfaceObjectDisplayProd.failureResponse}</textarea></td></tr>


                                    </table>


                                    <div style="background-color:yellow;width:99%;text-align: center;">Sequences</div>
                                    <table width="100%">
                                      <tr style=" color: black;"><td width="99%" colspan="3">Description</td></tr>
                                      <tr><td width="99%" colspan="3"><div class="terms">${interfaceObjectDisplayProd.seqUrlString} <br><br>${interfaceObjectDisplayProd.sysSeqUrlString}</div></td></tr>

                                    </table>

                            </div>
                          </div>
                        </c:forEach>
                        </c:if>
                        <c:if test="${modelUc.interfaceObjectDisplaySystemProdList[0]!=null}">
                          <c:forEach items='${modelUc.interfaceObjectDisplaySystemProdList}' var="interfaceObjectDisplayDraft">
                          <div class="sub_container_expand">
                              <div id="${interfaceObjectDisplayDraft.requestName}" class="sub_header"><span>- ${interfaceObjectDisplayDraft.requestName}</span>

                            </div>
                              <div class="content">


                                    <table width="100%">

                                      <tr style=" color: black;font-weight:bold;"><td colspan="3" width="99%">${interfaceObjectDisplayDraft.requestInterfaceUrl}</td></tr>

                                    </table>


                                    <div style="background-color:yellow;width:99%;text-align: center;">Sequences</div>
                                    <table width="100%">
                                      <tr style=" color: black;"><td width="99%" colspan="3">Description</td></tr>
                                      <tr><td width="99%" colspan="3"><div class="terms">${interfaceObjectDisplayDraft.seqUrlString} <br><br>${interfaceObjectDisplayDraft.sysSeqUrlString}</div></td></tr>

                                    </table>

                            </div>
                          </div>
                        </c:forEach>
                        </c:if>
                      </div>
                  </div>
                </td>
              </tr>
              <!--
              <c:if test="${modelUc.interfaceObjectDisplayDraftList[0]==null and modelUc.interfaceObjectDisplayDevList[0]==null and modelUc.interfaceObjectDisplayProdList[0]==null and modelUc.requestImageDraft==null and modelUc.responseImageDraft==null and modelUc.responseFailureImageDraft==null}">
                      <tr style="background-color: #F0F0F0; color: black;">
                      <td colspan="5"><font color="red"><strong>No interface defined.</strong></font>
                  </td>
                  </tr>
                  </c:if>
               -->
                </table>
              </div>
	</form>
	<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
