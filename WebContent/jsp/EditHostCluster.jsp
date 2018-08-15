<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
    <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
	<link href="css/qSequence-otherPages.css" rel="stylesheet">
<title>Edit Information</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css" />
<link href="css/anirban.css" rel="stylesheet">
	<script type="text/javascript"
		src="<c:url value="/javascript/utils.js"/>">


	</script>
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/EditHostCluster.htm?hostId=${modelUc.ucHostClusterMst.hostId}&error_message_param=${modelUc.error}"/>
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

 $("#delete_form_submit_button").click(function(){
	  //alert("The button was clicked.");

		$("input#user_request_action_param").val("prop_menu_delete_host");


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
<div class="container Capabilities">
<table align="center">
    <tr>
        <td>
            <div class="table-header">
              <h1>Edit Information</h1>
              <a href="<c:url value="HostClusterList.htm?user_request_action_param=default_action"/>">Host Cluster List</a>
            </div>
        </td>
    </tr>
</table>
<form id="subscription_order_form" action="EditHostCluster.htm" method="post" >
    <table>
        <tr>
            <td><label for="description">Host Cluster Name</label><font color="red" size="1px">${modelUc.hostClusterNameMessage}</font></td>
        </tr>
        <tr>
            <td><input id="hostClusterName" name="hostClusterName" type="text" size="100"  value="${modelUc.ucHostClusterMst.hostClusterName}" /></td>
        </tr>
        <tr>
            <td><label for="description">Description</label><font color="red" size="1px">${modelUc.descriptionMessage}</font></td>
        </tr>
        <tr>
            <td><textarea maxlength="3900" name="descriptionTA" id="descriptionTA" cols="90" rows="4">${modelUc.ucHostClusterMst.description}</textarea></td>
        </tr>
        <tr>
            <td><label for="imageUrl">Host Type</label><font color="red"  size="1px">${modelUc.hostTypeMessage}</font></td>
        </tr>
        <tr>
            <td><input id="hostType" name="hostType" type="text" size="100"  value="${modelUc.ucHostClusterMst.hostType}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">Primary Host Name</label><font color="red"  size="1px">${modelUc.primaryHostNameMessage}</font></td>
        </tr>
        <tr>
            <td><input id="primaryHostName" name="primaryHostName" type="text" size="100"  value="${modelUc.ucHostClusterMst.primaryHostName}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">Other Host Name(s)</label><font color="red"  size="1px">${modelUc.otherHostNamesMessage}</font></td>
        </tr>
        <tr>
            <td><input id="otherHostNames" name="otherHostNames" type="text" size="100"  value="${modelUc.ucHostClusterMst.otherHostNames}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">In Connection IpAddress(s)</label><font color="red"  size="1px">${modelUc.inConnectionIpaddressMessage}</font></td>
        </tr>
        <tr>
            <td><input id="inConnectionIpaddress" name="inConnectionIpaddress" type="text" size="100"  value="${modelUc.ucHostClusterMst.inConnectionIpaddress}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">Out Connection IpAddress(s)</label><font color="red"  size="1px">${modelUc.outConnectionIpaddressMessage}</font></td>
        </tr>
        <tr>
            <td><input id="outConnectionIpaddress" name="outConnectionIpaddress" type="text" size="100"  value="${modelUc.ucHostClusterMst.outConnectionIpaddress}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">In Connection Port(s)</label><font color="red"  size="1px">${modelUc.inConnectionOpenPortsMessage}</font></td>
        </tr>
        <tr>
            <td><input id="inConnectionOpenPorts" name="inConnectionOpenPorts" type="text" size="100"  value="${modelUc.ucHostClusterMst.inConnectionOpenPorts}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">Out Connection Port(s)</label><font color="red"  size="1px">${modelUc.outConnectionOpenPortsMessage}</font></td>
        </tr>
        <tr>
            <td><input id="outConnectionOpenPorts" name="outConnectionOpenPorts" type="text" size="100"  value="${modelUc.ucHostClusterMst.outConnectionOpenPorts}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">In Connection Protocol(s)</label><font color="red"  size="1px">${modelUc.inConnectionSupportedProtocolsMessage}</font></td>
        </tr>
        <tr>
            <td><input id="inConnectionSupportedProtocols" name="inConnectionSupportedProtocols" type="text" size="100"  value="${modelUc.ucHostClusterMst.inConnectionSupportedProtocols}" /></td>
        </tr>
        <tr>
            <td><label for="imageUrl">Out Connection Protocol(s)</label><font color="red"  size="1px">${modelUc.outConnectionSupportedProtocolsMessage}</font></td>
        </tr>
        <tr>
            <td><input id="outConnectionSupportedProtocols" name="outConnectionSupportedProtocols" type="text" size="100"  value="${modelUc.ucHostClusterMst.outConnectionSupportedProtocols}" /></td>
        </tr>
        <tr>
            <td>
                <div class="wrp-pn-pv">
                    <div class="pn">
                        <label for="propertyName">Property Name</label>
                    </div>
                    <div class="pv">
                        <label for="propertyValue">Property Value</label><font color="red" size="1px">${modelUc.propMessage}</font>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
          <td>
              <c:forEach items="${modelUc.ucHostPropertiesList}" var="ucSeqDiagramProperty" varStatus="status" begin="0" end="${modelUc.numberOfPropertiesAllowed}">
                  <c:if test="${ucSeqDiagramProperty.propertyId==null}">
                      <div class="wrap-name-value-prop">
                          <div class="propertyName">
                              <input id="propertyIdName${ucSeqDiagramProperty.propertyIdNo}" name="propertyName${status.count}" type="text" size="30" value="${ucSeqDiagramProperty.propertyName}" />
                          </div>
                          <div class="propertyValue">
                              <input id="propertyIdValue${ucSeqDiagramProperty.propertyIdNo}" name="propertyValue${status.count}" type="text" size="80" value="${ucSeqDiagramProperty.propertyValue}" />
                          </div>
                      </div>
                  </c:if>
                  <c:if test="${ucSeqDiagramProperty.propertyId!=null}">
                      <div class="wrap-name-value-prop">
                          <div class="propertyName">
                              <input id="propertyIdName${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdName${ucSeqDiagramProperty.propertyId}" type="text" size="30"  value="${ucSeqDiagramProperty.propertyName}" />
                          </div>
                          <div class="propertyValue">
                              <input id="propertyIdValue${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdValue${ucSeqDiagramProperty.propertyId}" type="text" size="80"  value="${ucSeqDiagramProperty.propertyValue}" />
                          </div>
                      </div>
                  </c:if>
              </c:forEach>
          </td>
        </tr>
        <tr>
            <td>
                <input id="description_param" name="description_param" type="hidden"  />
                <input id="user_request_action_param" name="user_request_action_param" type="hidden" value="prop_menu_save_host" />
                <input id="hostId" name="hostId" type="hidden" value="${modelUc.ucHostClusterMst.hostId}" />
                <!--<input id="add_property_button" type="button" value="Add Property">-->
            </td>
        </tr>
        <tr>
            <td>
                <div id="sometext" align="center" ><strong>
                    ${modelUc.displayPromoMessage}</strong>
                </div>
                <script type="text/javascript">
                    $('#add_property_button').click(function() {
                    // 	$("#add_property_div")
                    // 	.fadeIn("slow")
                    // 	.animate({ opacity: 0 }, 6000);
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td>
                <div class="submit-sects">
                    <div class="col-lg-6">
                        <input class="btn btn-success" id="form_submit_button" type="button" value="Save">
                    </div>
                    <div class="col-lg-6">
                        <input class="btn btn-danger" id="delete_form_submit_button" type="button" value="Delete">
                    </div>
                    <font color="red">${modelUc.error}</font>
                </div>
            </td>
        </tr>
    </table>
</form>
<div  id="prop_menu_place_holder" class="propertiesMenus"
    onclick="event.cancelBubble=true">
</div>

<%@ include file="footer.jsp"%>
