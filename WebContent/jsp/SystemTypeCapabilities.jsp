<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Change Release List</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<%-- END 12 Oct added combogrid jquery libraries--%>
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/anirban.css" rel="stylesheet">
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
      .table.table-borderless tr td, .table.table-borderless tr th {
        border-width: 0;
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
    </head>
    <body class="NoPadding" onunload="javascript:closeWaitWindow()" onclick="javascript:bodyOnClick()" onkeypress="javascript:bodyOnKeyPress(event)" onload="initSkin();">
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

<div class="center-content">
<input type="hidden" id="user_request_action_param" name="user_request_action_param" value="XXX" />
<c:set var="x" value="0" />
<div class="text-center">
  <c:if test="${modelUc.systemType.systemDisplayObjectList[0]==null}">
      <h1>System capabilities: ${modelUc.systemType.systemTypeDisplayName}</h1>
      <c:if test="${modelUc.systemType.systemDisplayObjectList[0]==null}">
        <label>No capabilities found.</label>
      </c:if>
  </c:if>
</div>
<c:if test="${modelUc.systemType.systemDisplayObjectList[0]!=null}">
<c:forEach items='${modelUc.systemType.systemDisplayObjectList}' var="systemObj">
<div class="panel-group i-accordion" style="margin-top: 50px;">
  <div class="panel panel-success">
    <div class="panel-heading" data-toggle="collapse" data-parent=".i-accordion" href="#aboutus2">
      <h4 class="panel-title">${systemObj.systemName} <i class="fa fa-chevron-up pull-right"></i></h4>
    </div>
    <div id="aboutus2" class="panel-collapse collapse in">
      <div class="panel-body">
				<table class="table">
					<tbody>
						<div class="table-responsive">
							<table class="table  table-borderless">
								<tbody>
									<tr>
										<td><label>System</label></td>
										<td><label data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${systemObj.systemDescription}">${systemObj.systemName} (${systemObj.usedCount})</label></td>
										<td>
                      <c:if test="${systemObj.ownerAccess==true}">
                          <a class="btn btn-default" target="_blank" href="<c:url value="ViewInterface.htm?systemId=${systemObj.systemId}&propertyFor=system"/>" role="button">Update capability</a>
                      </c:if>
                    </td>
										<td><a class="btn btn-success" target="_blank" href="<c:url value="ViewInterface.htm?systemId=${systemObj.systemId}&propertyFor=system"/>" role="button">Interface</a></td>
										<td><a class="btn btn-info" target="_blank" href="<c:url value="Properties.htm?user_request_action_param=view_properties_action_param&system_id_param=${systemObj.systemId}&property_for_param=system&system_type_param=${modelUc.systemType.systemType}"/>" role="button">Information</a></td>
                    <td>
                      <c:if test="${systemObj.systemDisplaySubObjectList==null and systemObj.systemDisplaySubObjectList[0]==null}">
                        <div class="sub_container_expand">
                          <font color="red"><b>No capabilities found</b></font>
                        </div>
                      </c:if>
                    </td>
                  </tr>
								</tbody>
							</table>
						</div>
					</tbody>
				</table>
        <div class="panel-group i-accordion" id="nested">
            <div class="panel panel-success">
              <div class="panel-heading" data-toggle="collapse" data-parent="#nested" href="#nested-collapseOne">
                <h4 class="panel-title">${systemObj.systemName} <i class="fa fa-chevron-down pull-right"></i></h4>
              </div>
              <div id="nested-collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                  <c:if test="${systemObj.systemDisplaySubObjectList!=null and systemObj.systemDisplaySubObjectList[0]!=null}">
                  <c:forEach items='${systemObj.systemDisplaySubObjectList}' var="systemDisplaySubObject">
                  <div class="table-responsive">
										<table class="table pull-left table-borderless" style="width:75%;">
											<tbody>

												<tr>
													<td><label>Request</label></td>
													<td><label class="bottom seq-margin yellow-tooltip" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${systemDisplaySubObject.requestResponseSystemSearch.requestDescription}">${systemDisplaySubObject.requestResponseSystemSearch.requestName}(${systemDisplaySubObject.requestResponseSystemSearch.requestUsedInSequence})</label></td>
													<td>
                            <c:if test="${systemDisplaySubObject.ownerAccess==true}">
                            <a class="btn btn-default" href="<c:url value="UpdateCapability.htm?property_for_param=request&system_id_param=${systemDisplaySubObject.requestResponseSystemSearch.systemId}&system_type_param=${systemDisplaySubObject.requestResponseSystemSearch.systemType}&request_id_param=${systemDisplaySubObject.requestResponseSystemSearch.requestId}&response_id_param=${systemDisplaySubObject.requestResponseSystemSearch.responseId}"/>" role="button">Update capability</a>
                            </c:if>
                          </td>
												</tr>
												<tr>
													<td><label>Response</label></td>
													<td><label class="bottom seq-margin yellow-tooltip" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${systemDisplaySubObject.requestResponseSystemSearch.responseDescription}">${systemDisplaySubObject.requestResponseSystemSearch.responseName}(${systemDisplaySubObject.requestResponseSystemSearch.requestUsedInSequence})</label></td>
													<td>
                            <c:if test="${systemDisplaySubObject.ownerAccess==true}">
                              <a class="btn btn-default" href="<c:url value="UpdateCapability.htm?property_for_param=response&system_id_param=${systemDisplaySubObject.requestResponseSystemSearch.systemId}&system_type_param=${systemDisplaySubObject.requestResponseSystemSearch.systemType}&request_id_param=${systemDisplaySubObject.requestResponseSystemSearch.requestId}&response_id_param=${systemDisplaySubObject.requestResponseSystemSearch.responseId}"/>" role="button">Update capability</a>
                            </c:if>
                          </td>
                        </tr>
											</tbody>
										</table>
                    <table class="table pull-right table-borderless" style="margin-top:25px;width:20%;">
											<tbody>
												<tr>
                          <td><a class="btn btn-success" target="_blank" href="<c:url value="ViewInterface.htm?requestId=${systemDisplaySubObject.requestResponseSystemSearch.requestId}&propertyFor=request"/>" role="button">Interface</a></td>
      										<td><a class="btn btn-info" target="_blank" href="<c:url value="Properties.htm?user_request_action_param=view_properties_action_param&request_id_param=${systemDisplaySubObject.requestResponseSystemSearch.requestId}&property_for_param=request&system_type_param=${modelUc.systemType.systemType}"/>" role="button">Information</a></td>
												</tr>
											</tbody>
										</table>
									</div>
                </c:forEach>
                </c:if>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>
</div>
</c:forEach>
</c:if>
<script type="text/javascript">
$(function () {
  // Smooth Scroll
  $('a[href*=#]').bind('click', function(e){
    var anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: $(anchor.attr('href')).offset().top
    }, 1000);
    e.preventDefault();
  });
});

$('.i-accordion').on('show.bs.collapse', function(n){
  $(n.target).siblings('.panel-heading').find('.panel-title i').toggleClass('fa-chevron-down fa-chevron-up');
});
$('.i-accordion').on('hide.bs.collapse', function(n){
  $(n.target).siblings('.panel-heading').find('.panel-title i').toggleClass('fa-chevron-up fa-chevron-down');
});

/* P */
$('.accordion-2a, .accordion-2b, .accordion-3').on('show.bs.collapse', function(n){
  $(n.target).siblings('.panel-heading').find('.panel-title i').toggleClass('fa-minus fa-plus');
});
$('.accordion-2a, .accordion-2b, .accordion-3').on('hide.bs.collapse', function(n){
  $(n.target).siblings('.panel-heading').find('.panel-title i').toggleClass('fa-plus fa-minus');
});
</script>




</div>
<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
