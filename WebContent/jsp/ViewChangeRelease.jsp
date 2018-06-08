<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Change Release List</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
    <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css" />
<link href="css/anirban.css" rel="stylesheet">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>

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
          if($content.is(":hidden")){
            $header.find(".fa").removeClass('fa-chevron-up');
            $header.find(".fa").addClass('fa-chevron-down');
          } else {
            $header.find(".fa").removeClass('fa-chevron-down');
            $header.find(".fa").addClass('fa-chevron-up');
          }
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
      <tr>
         <td>&nbsp;</td>
      </tr>
      <tr>
         <td>&nbsp;</td>
      </tr>
      <tr>
         <td>
            <table align="center" border="0"  width="900 px" >
               <tr>
                  <td style="text-align:center;">
                     <h1>Change Release List</h1>
                  </td>
                  <td style="text-align:right;">

                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td>
            <c:set var="x" value="0" />
            <table align="center"  width="900 px">
               <c:if test="${modelUc.userRequestAction=='draft_release'}">
                  <tr height="50px">
                     <td  width="100%" ><label for="sequenceName">Change Release list</label></td>
                  </tr>
                  <c:if test="${modelUc.releaseDisplayObjectSeqList[0]==null}">
                     <tr>
                        <td><font color="red"><strong>No changes found.</strong></font>
                        </td>
                     </tr>
                  </c:if>
               </c:if>
               <c:if test="${modelUc.releaseDisplayObjectSeqList[0]!=null}">
                  <c:forEach items='${modelUc.releaseDisplayObjectSeqList}' var="releaseDisplayObjectSeq">
                     <%--          		<c:set var="changed" value="false" /> --%>
                     <%--          		<c:if test="${x=='0' && changed=='false'}"> --%>
                     <tr>
                        <td>
                           <div class="container_expand">
                              <div id="${releaseDisplayObjectSeq.ucSeqMst.seqName}" class="header"><span>- ${releaseDisplayObjectSeq.ucSeqMst.seqName}</span>
                              </div>
                              <div class="content">
                                 <c:if test="${modelUc.sequenceVersion=='draft_release'}">
                                    <label>Sequence Name</label> : <a class="tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${releaseDisplayObjectSeq.ucSeqMst.seqMstId}&sequenceVersion=DRAFT"/>">${releaseDisplayObjectSeq.ucSeqMst.seqName}<span>${releaseDisplayObjectSeq.ucSeqMst.seqDescription}</span></a><br />
                                 </c:if>
                                 <c:if test="${modelUc.sequenceVersion=='dev_release'}">
                                    <label>Sequence Name</label> : <a class="tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${releaseDisplayObjectSeq.ucSeqMst.seqMstId}&sequenceVersion=SEQ"/>">${releaseDisplayObjectSeq.ucSeqMst.seqName}<span>${releaseDisplayObjectSeq.ucSeqMst.seqDescription}</span></a><br />
                                 </c:if>
                                 <div class="tooltip" ><label>Change</label> : ${releaseDisplayObjectSeq.ucSeqMst.changeTitle}<span>${releaseDisplayObjectSeq.ucSeqMst.changeNote}</span></div>
                                 <br />
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
                                                <div>Change : ${ucSeqRelease.changeTitle}</div>
                                                <table>
                                                   <c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
                                                      <tr>
                                                         <td>Change From</td>
                                                         <td>Change To</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
                                                   </c:if>
                                                   <c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
                                                      <tr>
                                                         <td>Description</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td>
                                                            <div class="terms">${ucSeqRelease.changeDescTo}</div>
                                                         </td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
                                                   </c:if>
                                                </table>
                                             </c:forEach>
                                             <c:forEach items='${releaseDisplaySubObjectSeq.consumerUcSeqReleaseList}' var="ucSeqRelease">
                                                <div>Change : ${ucSeqRelease.changeTitle}</div>
                                                <table>
                                                   <c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
                                                      <tr>
                                                         <td>Change From</td>
                                                         <td >Change To</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
                                                   </c:if>
                                                   <c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
                                                      <tr>
                                                         <td>Description</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td>
                                                            <div class="terms">${ucSeqRelease.changeDescTo}</div>
                                                         </td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
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
                     </tr>
                  </c:forEach>
               </c:if>
               <!--  processing SYS_SEQ -->
               <c:if test="${modelUc.releaseDisplayObjectSysSeqList[0]!=null}">
                  <c:forEach items='${modelUc.releaseDisplayObjectSysSeqList}' var="releaseDisplayObjectSeq">
                     <tr>
                        <td>
                           <div class="container_expand">
                              <div id="${releaseDisplayObjectSeq.ucSeqMst.seqName}" class="header"><span>- ${releaseDisplayObjectSeq.ucSeqMst.seqName}</span>
                              </div>
                              <div class="content">
                                 <c:if test="${modelUc.sequenceVersion=='draft_release'}">
                                    <label>Sequence Name</label> : <a class="tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${releaseDisplayObjectSeq.ucSeqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>">${releaseDisplayObjectSeq.ucSeqMst.seqName}<span>${releaseDisplayObjectSeq.ucSeqMst.seqDescription}</span></a><br />
                                 </c:if>
                                 <c:if test="${modelUc.sequenceVersion=='dev_release'}">
                                    <label>Sequence Name</label> : <a class="tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${releaseDisplayObjectSeq.ucSeqMst.sysSeqId}&sequenceVersion=sys_seq"/>">${releaseDisplayObjectSeq.ucSeqMst.seqName}<span>${releaseDisplayObjectSeq.ucSeqMst.seqDescription}</span></a><br />
                                 </c:if>
                                 <div class="tooltip" ><label>Change</label> : ${releaseDisplayObjectSeq.ucSeqMst.changeTitle}<span>${releaseDisplayObjectSeq.ucSeqMst.changeNote}</span></div>
                                 <br />
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
                                                <div>Change : ${ucSeqRelease.changeTitle}</div>
                                                <table>
                                                   <c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
                                                      <tr>
                                                         <td>Change From</td>
                                                         <td >Change To</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
                                                   </c:if>
                                                   <c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
                                                      <tr>
                                                         <td>Description</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td>
                                                            <div class="terms">${ucSeqRelease.changeDescTo}</div>
                                                         </td>
                                                         <td><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
                                                   </c:if>
                                                </table>
                                             </c:forEach>
                                             <c:forEach items='${releaseDisplaySubObjectSeq.consumerUcSeqReleaseList}' var="ucSeqRelease">
                                                <div>Change : ${ucSeqRelease.changeTitle}</div>
                                                <table>
                                                   <c:if test="${ucSeqRelease.changeType=='REQUEST_MESSAGE'  or ucSeqRelease.changeType=='RESPONSE_SUCCESS_MESSAGE' or ucSeqRelease.changeType=='RESPONSE_FAILURE_MESSAGE' or ucSeqRelease.changeType=='SEQUENCE'}">
                                                      <tr>
                                                         <td>Change From</td>
                                                         <td >Change To</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescFrom}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlDocument" disabled WRAP="off">${ucSeqRelease.changeDescTo}</textarea></td>
                                                         <td><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
                                                   </c:if>
                                                   <c:if test="${ucSeqRelease.changeType!='REQUEST_MESSAGE'  and ucSeqRelease.changeType!='RESPONSE_SUCCESS_MESSAGE' and ucSeqRelease.changeType!='RESPONSE_FAILURE_MESSAGE' and ucSeqRelease.changeType!='SEQUENCE'}">
                                                      <tr>
                                                         <td>Description</td>
                                                         <td>Comments</td>
                                                      </tr>
                                                      <tr>
                                                         <td>
                                                            <div class="terms">${ucSeqRelease.changeDescTo}</div>
                                                         </td>
                                                         <td><textarea rows="11" cols="35" name="xmlSysDocument_${ucSeqRelease.detectChangeId}" WRAP="off">${ucSeqRelease.comments}</textarea></td>
                                                      </tr>
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
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
