<%@ include file="header_for_seqdet.jsp"%>
  <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
      <!-- Bootstrap Core CSS -->
      <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/qSequence-otherPages.css" rel="stylesheet">
          <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
          <title>Edit Sequence</title>
          <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
          <script type="text/javascript" src="jquery/jquery-ui.js"></script>
          <script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
          <script src="jquery/jquery-latest.js"></script>
          <%--  12 Oct added combogrid jquery libraries--%>
            <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
              <script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
              <script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
              <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
                <script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
                <%-- END 12 Oct added combogrid jquery libraries--%>
                </script>

                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
                  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
                  <link href="css/anirban.css" rel="stylesheet">
                    <script type="text/javascript">
                      function addLi(accessText, userId, access) {
                        if (access == 'RO') {
                          accessText += " - Read Only Access";
                        } else if (access == 'RW') {
                          accessText += " - Read Write Access";
                        } else if (access == 'OW') {
                          accessText += " - Owner Access";
                        }
                        document.getElementById('user_name_param').value = "";
                        //		$("#div_id ul").append('<li><span class="tab">Message Center</span></li>');
                        $("#div_id ul").append(
                          '<li id="li_' + userId + '"><a href="#" onclick="parentNode.parentNode.removeChild(parentNode)"> ' + accessText + '<input type="hidden" name="' + userId + '_' + access + '" value="' + userId + '_' + access +
                          '" /> </a></li>'
                        );
                      }
                    </script>
                  </head>
                  <body>
                    <script type="text/javascript">
                      $(document).ready(function () {
                        // $("#sometext").hide(); 	$("#add_property_div").hide(); if ($("#sometext").text().trim().length > 0) { 	$("#sometext") 	.fadeIn("slow") 	.animate({ opacity: 0 }, 6000);    } $('<div class="save-alert">The current scenario has been saved.</div>')
                        // .insertAfter($('#sometext'))    .fadeIn('slow')    .animate({ opacity: 1.0 }, 3000)    .fadeOut('slow', function () { 	alert('sdddd');    $(this).remove(); });

                        $("#form_submit_button").click(function () {
                          //alert("The button was clicked.");
                          var taVal = $("textarea#descriptionTA").val();
                          //alert("Before"+taVal);
                          $("input#description_param").val(taVal);
                          //alert("Changed"+$("input#description_param").val());

                          var taChangeVal = $("textarea#changeLongTA").val();
                          //alert("Before"+taVal);
                          $("input#change_long_param").val(taChangeVal);

                          document.getElementById("subscription_order_form").submit();
                        });

                        $("#cat_name").combogrid({
                          url: 'SearchCategories.htm?action_param=search_with_properties_only',
                          colModel: [
                            {
                              'columnName': 'catIdCol',
                              'width': '0',
                              'label': ''
                            }, {
                              'columnName': 'catNameCol',
                              'width': '50',
                              'label': 'Category Name'
                            }
                          ],
                          select: function (event, ui) {

                            $("#cat_name").val(ui.item.catNameCol);
                            document.getElementById('cat_id').value = ui.item.catIdCol;

                            return false;
                          }
                        });
                        $("#user_name_param").combogrid({
                          url: 'SearchUsers.htm?action_param=search_with_properties_only',
                          colModel: [
                            {
                              'columnName': 'userIdCol',
                              'width': '0',
                              'label': ''
                            }, {
                              'columnName': 'userNameCol',
                              'width': '50',
                              'label': 'Username'
                            }, {
                              'columnName': 'nameCol',
                              'width': '50',
                              'label': 'Name'
                            }
                          ],
                          select: function (event, ui) {

                            $("#user_name_param").val(ui.item.userNameCol);
                            document.getElementById('user_id_param').value = "user_" + ui.item.userIdCol;

                            return false;
                          }
                        });

                      });
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
          <a class="navbar-brand" href="#"><img src="images/logo2.png" alt=""/></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
      </div>
      <!-- /.container-fluid -->
    </nav>
  </div>
</div>

<div id="cntainer" class="container" style="margin: 0px auto;width: 800px;">
   <c:if test="${modelUc.status=='SAVED'}">
      <c:redirect url="/SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${modelUc.seqMstId}&sys_seq_id=${modelUc.sysSeqId}&message_param=${modelUc.message}&one_way_param=${modelUc.oneWay}&sequenceVersion=${modelUc.sequenceVersion}"/>
   </c:if>
   <form id="subscription_order_form" action="SeqMst.htm" method="post">
      <table style="margin: 0px auto;width: 1000px;">
        <tr>
          <div class="table-header" style="margin: 0px auto;width: 800px;">
            <div class="form-group">
              <div class="col-lg-12">
                <a class="btn btn-info btn-raised" href="<c:url value="ViewSequenceList.htm?request_action_param=default_action&seq_mst_id_param=${modelUc.seqMstId}"/>">Back</a>
                <h1>Edit Sequence</h1>
                <h2><input class="col-lg-12" id="seqName" name="seq_name_param" type="text" size="45" maxlength="100" value="${modelUc.seqName}"/></h2>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-12 control-label">Category*</label>
              <div class="col-lg-12">
                <c:if test="${modelUc.hasOwnerAccessToSeq==true}">
                   <input class="col-lg-12" id="cat_name" name="cat_name" type="text" size="97" maxlength="100" value="${modelUc.catName}"/>
                   <input class="col-lg-12" id="cat_id" name="cat_id" type="hidden" value="${modelUc.catId}"/>
                </c:if>
                <c:if test="${modelUc.hasOwnerAccessToSeq==false}">
                   <input class="col-lg-12" id="cat_name" name="cat_name" type="text" disabled="disabled" size="97" maxlength="100" value="${modelUc.catName}"/>
                   <input class="col-lg-12" id="cat_id" name="cat_id" type="hidden" value="${modelUc.catId}"/>
                </c:if>
                <p>
                   <strong>Note: if category is changed, teams with access priviledges to previous category will not be able to access this sequence.</strong>
                </p>
              </div>
            </div>
            <div class="form-group">
              <div class="col-lg-12">
                <label class="control-label">
                <strong>Access</strong>
                : Note: if access is provided for a specific sequence, this will override all other access priviledges. Whoever is in the list will only be able to access the sequence.
                </label>
              </div>
                <c:if test="${modelUc.hasOwnerAccessToSeq==true}">
              <div class="col-lg-12">
                <label class="control-label">User</label>
                <input class="col-lg-12" type="text" id="user_name_param" maxlength="20"/><input type="hidden" id="user_id_param"/>
              </div>
              <div class="col-lg-12">
                <label class="control-label">Access Level</label>
                <select class="col-lg-12" name="access_param" id="access_param">
                   <option value="RO">Read Only</option>
                   <option value="RW">Read Write</option>
                </select>
              </div>
              <div class="col-lg-12">
                <button class="btn btn-success btn-raised" type="button" onclick="addLi(document.getElementById('user_name_param').value, document.getElementById('user_id_param').value, document.getElementById('access_param').value)">Add</button>
              </div>
                </c:if>
            </div>
            <div class="form-group">
              <div class="col-lg-12">
                <div id="div_id">
                   <hr>
                   <ul id="ul_id">
                      <c:if test="${modelUc.hasOwnerAccessToSeq==true}">
                         <c:forEach items='${modelUc.accessList}' var="userAccess">
                            <li id="li_${userAccess.id}">
                               <a href="#" onclick="parentNode.parentNode.removeChild(parentNode)">
                               ${userAccess.accessText }<input type="hidden" name="user_${userAccess.id}" value="user_${userAccess.id}_${userAccess.access}"/>
                               </a>
                            </li>
                         </c:forEach>
                      </c:if>
                      <c:if test="${modelUc.hasOwnerAccessToSeq==false}">
                         <c:forEach items='${modelUc.accessList}' var="userAccess">
                            <li id="li_${userAccess.id}">
                               ${userAccess.accessText }<input type="hidden" name="user_${userAccess.id}" value="user_${userAccess.id}_${userAccess.access}"/>
                            </li>
                         </c:forEach>
                      </c:if>
                   </ul>
                </div>
                <div id="sometext">
                   <strong>
                   <font color="red">${modelUc.error}</font>
                   </strong>
                </div>
                <div id="sometext">
                   <strong>${modelUc.message}</strong>
                </div>
                <c:if test="${modelUc.sequenceVersion=='SEQ' or modelUc.sequenceVersion==null or modelUc.sequenceVersion=='' }">
                   Dev sequence versions<a style="color:blue" href="<c:url value="ViewSequenceList.htm?request_action_param=default_action&seq_mst_id_param=${modelUc.seqMstId}&sequenceVersion=DEV_VERSION"/>">Dev sequence versions</</a>
                </c:if>
                <c:if test="${modelUc.sequenceVersion=='PROD'}">
                   Prod sequence versions<a style="color:blue" href="<c:url value="ViewSequenceList.htm?request_action_param=default_action&seq_mst_id_param=${modelUc.seqMstId}&sequenceVersion=PROD_VERSION"/>">Prod sequence versions</</a>
                </c:if>

              </div>
            </div>
            <div class="form-group">
              <c:if test="${modelUc.sequenceVersion=='sys_seq' or modelUc.sequenceVersion=='sys_seq_draft' or modelUc.sequenceVersion=='sys_seq_prod' or modelUc.sequenceVersion=='SEQ_PROD' }">
                 <label class="col-lg-12">Sequence Description</label>
                 <textarea class="col-lg-12" disabled="disabled" maxlength="4000" name="descriptionTA" id="descriptionTA" cols="108" rows="4">${modelUc.description}</textarea>
              </c:if>
            </div>
            <div class="form-group">
              <div class="col-lg-12">
                <c:if test="${modelUc.sequenceVersion==null or modelUc.sequenceVersion=='' or modelUc.sequenceVersion=='SEQ' or modelUc.sequenceVersion=='DRAFT' or modelUc.sequenceVersion=='PROD'}">
                  <label class="control-label">Sequence Description</label>
                  <textarea class="col-lg-12" maxlength="4000" name="descriptionTA" id="descriptionTA" cols="108" rows="4">${modelUc.description}</textarea>
                </c:if>
                <a class="btn btn-info btn-raised" target="_blank" href="<c:url value="ViewChangeRelease.htm?user_request_action_param=retrieve_release_view&seqMstIds=${modelUc.seqMstId}&sysSeqIds=${modelUc.sysSeqId}&sequenceVersion=${modelUc.sequenceVersion}"/>">Change Release List</a>
              </div>
            </div>
            <div class="form-group">
              <div class="col-lg-12">
                <label class="control-label">Revision Title</label>
                <input class="col-lg-12" id="changeShort" name="change_short_param" type="text" size="105" maxlength="100" value="${modelUc.changeShort}"/>
              </div>

            </div>

            <div class="form-group">
              <div class="col-lg-12">
                <label class="control-label">Revision Description</label>
                <textarea class="col-lg-12" maxlength="4000" name="changeLongTA" id="changeLongTA" cols="108" rows="4">${modelUc.changeLong}</textarea>
              </div>
            </div>
            <div class="form-group">
              <div class="col-lg-12">
                  <c:if test="${modelUc.oneWay=='Y'}">
                     <div class="checkbox">
                       <label>
                         <input type="checkbox" name="one_way_param" checked="checked" value="Y"><span class="checkbox-material"><span class="check"></span></span> One way interaction
                       </label>
                     </div>
                  </c:if>
                  <c:if test="${modelUc.oneWay!='Y'}">
                     <div class="checkbox">
                       <label>
                         <input type="checkbox" name="one_way_param" value="Y"><span class="checkbox-material"><span class="check"></span></span> One way interaction
                       </label>
                     </div>
                  </c:if>
              </div>
              <div class="form-group">
                  <div class="col-lg-12">
                    <input id="description_param" name="description_param" type="hidden" value="${modelUc.description}"/>
                    <input id="change_long_param" name="change_long_param" type="hidden" value="${modelUc.changeLong}"/>
                    <input id="seq_mst_id_param" name="seq_mst_id_param" type="hidden" value="${modelUc.seqMstId}"/>
                    <input id="sys_seq_id" name="sys_seq_id" type="hidden" value="${modelUc.sysSeqId}"/>
                    <input id="sequenceVersion" name="sequenceVersion" type="hidden" value="${modelUc.sequenceVersion}"/>
                    <input id="request_action_param" name="request_action_param" type="hidden" value="save_sequence_action"/>
                    <!--<input id="add_property_button" type="button" value="Add Property">-->
                    <c:if test="${modelUc.hasReadWriteAccessToSeq==true}">
                       <input id="form_submit_button" class="btn btn-success btn-raised" type="button" value="Save"><font color="red">${modelUc.message}</font>
                    </c:if>
                    <div id="sometext">
                       <strong>
                       ${modelUc.displayPromoMessage}</strong>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </tr>
         <tr>
            <td>
               <script type="text/javascript">
                  $('#add_property_button').click(function () {
                    // 	$("#add_property_div") 	.fadeIn("slow") 	.animate({ opacity: 0 }, 6000);
                  });
               </script>
            </td>
         </tr>
      </table>
   </form>
</div>
<br/>
<br/>
<br/>
<%@ include file="footer.jsp"%>
