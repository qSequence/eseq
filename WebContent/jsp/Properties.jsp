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
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/javascript/utils.js"/>"></script>

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

<div class="text-center">
  <h1>Edit Information</h1>
  <h3>${modelUc.ucSeqDiagramName}</h3>
  <div class="LL">
    <c:if test="${(modelUc.ucSeqMst.seqMstId!=null and modelUc.ucSeqMst.seqMstId!='' and modelUc.ucSeqMst.seqMstId!='0') or (modelUc.sysSeqId !=null and modelUc.sysSeqId !='' and modelUc.sysSeqId !='0')}">
       <a href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&sequenceVersion=${modelUc.sequenceVersion}&sys_seq_id=${modelUc.sysSeqId}"/>">&lt;&lt;&nbsp;Back to ${modelUc.ucSeqMst.seqName}</a>
    </c:if>
  </div>
</div>
<div class="wrap-table-del">
  <div class="container_expand">
    <div class="header">
      <span>Expand copy information</span>
      <i class="fa fa-chevron-up pull-right"></i>
    </div>
    <div class="content">
      <p>Copy Information from</p>
      <div class="form-group">
          <label class="control-label">First name</label>
          <input id="comboGrid_${modelUc.propertyFor}" name="informationCopy" type="text" size="50" maxlength="1900"  />
      </div>
      <button class="btn btn-primary btn-raised"  id="img_information_injection" class="mousetoHand" title="Information" alt="Information"
      onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}','prop_copy_view', event);"></button>
      <button class="btn btn-success btn-raised" id="copy_submit_button"  type="button">Copy</button>
      <input id="copy_system_id_param" name="copy_system_id_param" type="hidden" value="" />
      <input id="copy_request_id_param" name="copy_request_id_param" type="hidden" value="" />
      <input id="copy_response_id_param" name="copy_response_id_param" type="hidden" value="" />
    </div>
  </div>
</div>



<form id="subscription_order_form" action="Properties.htm" method="post">

  <div class="properties">
    <div class="row">
        <div class="col-lg-12">
            <div class="row">
              <div class="col-lg-12">

              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <c:if test="${modelUc.propertyFor=='system'}">

                  <div class="form-group">
                    <label for="description" class="col-lg-2 control-label">Description</label>
                    <font color="red" size="1px">${modelUc.descMessage}</font>
                    <div class="col-lg-12">
                      <textarea maxlength="3900" name="descriptionTA" id="descriptionTA" cols="100" rows="4">${modelUc.description}</textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-lg-12">
                      <a class="btn btn-info btn-raised" target="_blank" href="<c:url value=" HostClusterList.htm?user_request_action_param=default_action "/>">>>Host Cluster List<<</a>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="hostCluster" class="col-lg-2 control-label">Host Cluster</label>
                    <font color="red" size="1px">${modelUc.descMessage}</font>
                    <div class="col-lg-12">
                      <input id="hostClusterName" name="hostClusterName" type="text" size="115" maxlength="100" value="${modelUc.hostClusterName}" />
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-lg-12">
                      <input id="hostId" name="hostId" type="hidden" size="100" maxlength="100" value="${modelUc.hostId}" />
                    </div>
                  </div>

                </c:if>

                <c:if test="${modelUc.propertyFor!='system'}">
                   <div class="form-group">
                     <div class="col-lg-12">
                       <label for="sample">Sample ${modelUc.propertyFor}</label>
                       <font color="red" size="1px">${modelUc.sampleMessage}</font>
                     </div>
                   </div>
                   <div class="form-group">
                     <div class="col-lg-12">
                       <textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="100" rows="4">${modelUc.sample}</textarea>
                     </div>
                   </div>
                   <c:if test="${modelUc.propertyFor=='response'}">
                     <div class="form-group">
                       <label for="sample">Sample failure ${modelUc.propertyFor}</label>
                       <font color="red" size="1px">${modelUc.sampleFailureMessage}</font>
                       <div class="col-lg-12">
                         <textarea maxlength="3900" name="sampleFailureTA" id="sampleFailureTA" cols="100" rows="4">${modelUc.sampleFailure}</textarea>
                       </div>
                     </div>
                   </c:if>
                   <c:if test="${ fn:containsIgnoreCase(modelUc.systemType, 'portal')  or fn:containsIgnoreCase(modelUc.systemType, 'application_server') or fn:containsIgnoreCase(modelUc.systemType, 'phone_app')}">
                      <c:if test="${modelUc.propertyFor=='request'}">
                        <div class="form-group">
                          <label for="imageUrl">Image Url</label>
                          <font color="red" size="1px">${modelUc.urlMessage}</font>
                          <div class="col-lg-12">
                            <input id="imageUrl" name="imageUrl" type="text" size="100" maxlength="1900" value="${modelUc.imageUrl}" />
                          </div>
                        </div>
                      </c:if>
                      <c:if test="${modelUc.propertyFor=='response'}">
                        <div class="form-group">
                          <label for="imageUrl">Image Url Success Response</label>
                          <font color="red" size="1px">${modelUc.urlMessage}</font>
                          <div class="col-lg-12">
                            <input id="imageUrl" name="imageUrl" type="text" size="100" maxlength="1900" value="${modelUc.imageUrl}" />
                          </div>
                        </div>
                        <div class="form-group">
                          <label for="failureImageUrl">Image Url Failure Response</label>
                          <font color="red" size="1px">${modelUc.urlMessage}</font>
                          <div class="col-lg-12">
                            <input id="failureImageUrl" name="failureImageUrl" type="text" size="100" maxlength="1900" value="${modelUc.failureImageUrl}" />
                          </div>
                        </div>
                      </c:if>
                   </c:if>
                </c:if>
                <div class="form-group">
                  <div class="col-lg-6">
                    <label for="propertyName">Property Name</label>
                  </div>
                  <div class="col-lg-6">
                    <label for="propertyValue">Property Value</label>
                    <font color="red" size="1px">${modelUc.propMessage}</font>
                  </div>
                </div>
                <c:forEach items="${modelUc.ucSeqDiagramPropertyList}" var="ucSeqDiagramProperty" varStatus="status" begin="0" end="${modelUc.numberOfPropertiesAllowed}">
                   <c:if test="${ucSeqDiagramProperty.propertyId==null}">
                     <div class="form-group">
                       <div class="col-lg-6">
                         <input id="propertyIdName${ucSeqDiagramProperty.propertyIdNo}" name="propertyName${status.count}" type="text" size="30" maxlength="100" value="${ucSeqDiagramProperty.propertyName}" />
                       </div>
                       <div class="col-lg-6">
                         <input id="propertyIdValue${ucSeqDiagramProperty.propertyIdNo}" name="propertyValue${status.count}" type="text" size="80" maxlength="4000" value="${ucSeqDiagramProperty.propertyValue}" />
                       </div>
                     </div>
                   </c:if>
                   <c:if test="${ucSeqDiagramProperty.propertyId!=null}">
                     <div class="form-group">
                       <div class="col-lg-6">
                         <input id="propertyIdName${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdName${ucSeqDiagramProperty.propertyId}" type="text" size="30" maxlength="100" value="${ucSeqDiagramProperty.propertyName}" />
                       </div>
                       <div class="col-lg-6">
                         <input id="propertyIdValue${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdValue${ucSeqDiagramProperty.propertyId}" type="text" size="80" maxlength="4000" value="${ucSeqDiagramProperty.propertyValue}" />
                       </div>
                     </div>
                   </c:if>
                </c:forEach>
              </div>
            </div>

        </div>
        <div class="col-lg-12 pull-right">
            <div class="col-lg-12">
              <input id="sequenceVersion" name="sequenceVersion" type="hidden" value="${modelUc.sequenceVersion}" />
              <c:if test="${modelUc.user_request_action_param!='view_properties_action_param'}">
                <c:if test="${modelUc.userReadWriteAccess=='true'}">
                  <input id="form_submit_button" class="btn btn-primary btn-raised" type="button" style="width:105px" value="Save">
                  <a align="right" class="button btn btn-info btn-raised" href="<c:url value=" UpdateCapability.htm?property_for_param=${modelUc.propertyFor}&system_id_param=${modelUc.systemId}&system_type_param=${modelUc.systemType}&request_id_param=${modelUc.requestId}&response_id_param=${modelUc.responseId} "/>">Update capability</a>
                </c:if>
                <font color="red">${modelUc.error}</font>
              </c:if>
            </div>
        </div>
    </div>


  </div>

   <table align="center" border="0" width=80%>


      <tr>
         <td colspan="3">
            <input id="row_no_param" name="row_no_param" type="hidden" value="${modelUc.rowNo}" />
            <input id="col_no_param" name="col_no_param" type="hidden" value="${modelUc.columnNo}" />
            <input id="seq_item_id_param" name="seq_item_id_param" type="hidden" value="${modelUc.seqItemId}" />
            <input id="description_param" name="description_param" type="hidden" />
            <input id="sample_param" name="sample_param" type="hidden" />
            <input id="sample_failure_param" name="sample_failure_param" type="hidden" />
            <input id="system_id_param" name="system_id_param" type="hidden" value="${modelUc.systemId}" />
            <input id="system_type_param" name="system_type_param" type="hidden" value="${modelUc.systemType}" />
            <input id="request_id_param" name="request_id_param" type="hidden" value="${modelUc.requestId}" />
            <input id="response_id_param" name="response_id_param" type="hidden" value="${modelUc.responseId}" />
            <input id="seq_mst_id_param" name="seq_mst_id_param" type="hidden" value="${modelUc.ucSeqMst.seqMstId}" />
            <input id="sys_seq_id" name="sys_seq_id" type="hidden" value="${modelUc.sysSeqId}" />
            <input id="property_for_param" name="property_for_param" type="hidden" value="${modelUc.propertyFor}" />
            <input id="user_request_action_param" name="user_request_action_param" type="hidden" value="prop_menu_save_system" />
            <!--<input id="add_property_button" type="button" value="Add Property">-->
         </td>
      </tr>
      <tr>
         <td colspan="3">
            <div id="sometext" align="center"><strong>
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
         </td>
      </tr>
   </table>
</form>

<div  id="prop_menu_place_holder" class="propertiesMenus" onclick="event.cancelBubble=true"></div>

</div>

		<br /> <br />
      <br /> <br />
		<br /> <br />
<%@ include file="footer.jsp"%>
