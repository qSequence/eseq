<%@ include file="header_for_seqdet.jsp"%>
  <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
  <script type="text/javascript" src="jquery/jquery-ui.js"></script>
  <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
      <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
        <link href="css/qSequence-otherPages.css" rel="stylesheet">
          <link rel="stylesheet" href="<c:url value="/a.css" />" type="text/css">
            <%--  12 Oct added combogrid jquery libraries--%>
              <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
                <script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
                <script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
                <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
                  <script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
                  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
                  <link href="css/anirban.css" rel="stylesheet">
                    <%-- END 12 Oct added combogrid jquery libraries--%>
                      <title>Update Capability</title>
                    </head>
                    <body>
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
                      	$("#userName").combogrid({
                      		url: 'SearchUsers.htm?action_param=search_with_properties_only',
                      		colModel: [
                      		           {'columnName':'userIdCol','width':'0','label':''},
                      		           {'columnName':'userNameCol','width':'50','label':'Username'},
                      		           {'columnName':'nameCol','width':'50','label':'Name'}
                      		           ],
                      		select: function( event, ui ) {


                      		$("#userName").val(ui.item.userNameCol);
                      		document.getElementById('userId').value="user_"+ui.item.userIdCol;

                      		return false;
                      		}
                      		});
                      	$("#catName").combogrid({
                      		url: 'SearchCategories.htm?action_param=search_with_properties_only',
                      		colModel: [
                      		           {'columnName':'catIdCol','width':'0','label':''},
                      		           {'columnName':'catNameCol','width':'50','label':'Category Name'}
                      		           ],
                      		select: function( event, ui ) {


                      		$("#catName").val(ui.item.catNameCol);
                      		document.getElementById('catId').value=ui.item.catIdCol;

                      		return false;
                      		}
                      		});
                      });

                      function updateSeqMst( user_request_action_param, social_network_param, seq_mst_id_param,sequenceVersion_param, url) {

                      $("#img_"+seq_mst_id_param).attr('src',"images/secure-link-image.png");
                      $("#img_"+seq_mst_id_param).attr('title',"Secure your shared link");
                      $("#img_"+seq_mst_id_param).attr('alt',"Secure your shared link");

                      		$.post(url,
                      				{
                      					user_request_action_param:user_request_action_param,
                      					seq_mst_id_param:seq_mst_id_param,
                      					social_network_param:social_network_param,
                      					sequenceVersion:sequenceVersion_param
                      				},
                      				function(data,status){

                      				});
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

                      <div class="container captability">

                        <!--<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;height:100px ">-->
                        <c:if test="${modelUc.status=='SAVED'}">
                          <c:redirect url="/UpdateCapability.htm?property_for_param=${modelUc.property_for_param}&system_id_param=${modelUc.system_id_param}&request_id_param=${modelUc.request_id_param}&response_id_param=${modelUc.response_id_param}&message=${modelUc.message}"/>
                        </c:if>
                        <h1 style="text-align:center;">Update Capability</h1>
                        <div class="row table-section">
                          <table>
                            <tr>
                              <td>


<form action="UpdateCapability.htm" method="post" >
    <table align="center" >
        <c:if test="${modelUc.property_for_param=='request'}">
            <tr>
                <td><label for="capabilityName">System</label></td>
                <td><input id="system" name="system" type="text" maxlength="50" value="${modelUc.system}" disabled="disabled"/></td>
            </tr>
            <tr>
                <td><label for="capabilityName">Request</label></td>
                <td><input id="request" name="request" type="text" maxlength="50" value="${modelUc.request}" /></td>
                <td><label for="sequenceName"><input type="submit" class="btn btn-info btn-raised" name="request_update" value="Update Request"></label></td>
            </tr>
            <tr>
                <td><label for="capabilityName">Response</label></td>
                <td><input id="response" name="response" type="text" maxlength="50" value="${modelUc.response}" /></td>
                <td><label for="sequenceName"><input type="submit" class="btn btn-info btn-raised" name="response_update" value="Update Response"></label></td>
            </tr>
        </c:if>
        <c:if test="${modelUc.property_for_param=='response'}">
            <tr>
                <td><label for="capabilityName">System</label></td>
                <td><input id="system" name="system" type="text" maxlength="50" value="${modelUc.system}" disabled="disabled"/></td>
            </tr>
            <tr>
                <td><label for="capabilityName">Request</label></td>
                <td><input id="request" name="request" type="text" maxlength="50" value="${modelUc.request}" /></td>
                <td><label for="sequenceName"><input type="submit" class="btn btn-info btn-raised" name="request_update" value="Update Request"></label></td>
            </tr>
            <tr>
                <td><label for="capabilityName">Response</label></td>
                <td><input id="response" name="response" type="text" maxlength="50" value="${modelUc.response}" /></td>
                <td><label for="sequenceName"><input type="submit" class="btn btn-info btn-raised" name="response_update" value="Update Response"></label></td>
            </tr>
        </c:if>
        <c:if test="${modelUc.property_for_param=='system'}">
            <tr>
                <td><label for="capabilityName">System</label></td>
                <td><input id="system" name="system" type="text" maxlength="50" value="${modelUc.system}" /></td>
                <td><label for="sequenceName"><input type="submit" class="btn btn-info btn-raised" name="system_update" value="Update System"></label></td>
            </tr>
        </c:if>
        <tr align="center">
            <td align="center" colspan="3">
                <input type="submit" class="btn btn-info btn-raised" name="delete" value="Delete Capability">
                <input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_sequence_action" />
                <input id="property_for_param" name="property_for_param" type="hidden" value="${modelUc.property_for_param}" />
                <input id="system_id_param" name="system_id_param" type="hidden" value="${modelUc.system_id_param}" />
                <input id="request_id_param" name="request_id_param" type="hidden" value="${modelUc.request_id_param}" />
                <input id="response_id_param" name="response_id_param" type="hidden" value="${modelUc.response_id_param}" />
            </td>
        </tr>
        <tr>
            <td colspan="3"><font color="red">${modelUc.message}</font>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
    </table>
</form>



                                          </td>
                                        </tr>
                                        <tr>
                                          <td>
                                            <c:set var="x" value="0"/>
                                            <div class="table-header">
                                              <label for="sequenceName">Used in sequences</label>
                                            </div>
                                            <table  class="table-striped table-hover">
                                              <!-- DRAFT sequences -->
                                              <tr>
                                                <th>
                                                  <label for="sequenceName">Sequence Name</label>
                                                </th>
                                                <th>
                                                  <label for="edit">Edit</label>
                                                </th>
                                                <th>
                                                  <label for="createdDate">Release Status</label>
                                                </th>
                                                <th>
                                                  <label for="createdDate">Created Date</label>
                                                </th>
                                                <th>
                                                  <label for="createdBy">Created By</label>
                                                </th>
                                                <th>
                                                  <label for="createdBy">Category</label>
                                                </th>

                                              </tr>
                                              <c:if test="${modelUc.ucSeqMstDraftList[0]==null and modelUc.ucSeqMstList[0]==null and modelUc.ucSeqMstProdList[0]==null and modelUc.ucSysSeqMstDraftList[0]==null and modelUc.ucSysSeqMstList[0]==null and modelUc.ucSysSeqMstProdList[0]==null}">
                                                <tr>
                                                  <td>
                                                    <font color="red">No usage found.</font>
                                                  </td>
                                                </tr>
                                              </c:if>
                                              <c:forEach items='${modelUc.ucSeqMstDraftList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Draft</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/>
                                                    </td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Draft</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>

                                              <c:forEach items='${modelUc.ucSysSeqMstDraftList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><i class="mdi-image-edit"></i></a>
                                                    </td>
                                                    <td>Draft</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><i class="mdi-image-edit"></i></a>
                                                    </td>
                                                    <td>Draft</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/>
                                                    </td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>

                                              <c:forEach items='${modelUc.ucSeqMstList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Development</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Development</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>

                                              <c:forEach items='${modelUc.ucSysSeqMstList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><i class="mdi-image-edit"></i></a>
                                                    </td>
                                                    <td>Development</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Development</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>

                                              <c:forEach items='${modelUc.ucSeqMstProdList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Production</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Production</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>

                                              <c:forEach items='${modelUc.ucSysSeqMstProdList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Production</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Production</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>
                                            </table>
                                            <!--END Production system sequences -->
                                            <div class="table-header">
                                              <label for="sequenceName">Capability sequences</label>
                                            </div>
                                            <table class="table-striped table-hover">
                                              <tr>
                                                <th>
                                                  <label for="sequenceName">Sequence Name</label>
                                                </th>
                                                <th>
                                                  <label for="edit">Edit</label>
                                                </th>
                                                <th>
                                                  <label for="createdDate">Release Status</label>
                                                </th>
                                                <th>
                                                  <label for="createdDate">Created Date</label>
                                                </th>
                                                <th>
                                                  <label for="createdBy">Created By</label>
                                                </th>
                                                <th>
                                                  <label for="createdBy">Category</label>
                                                </th>

                                              </tr>
                                              <c:if test="${modelUc.ucCapSysSeqMstDraftList[0]==null and modelUc.ucCapSysSeqMstList[0]==null and modelUc.ucCapSysSeqMstProdList[0]==null}">
                                                <tr>
                                                  <td colspan="5">
                                                    <font color="red">No capability sequence found.</font>
                                                  </td>
                                                </tr>
                                              </c:if>
                                              <c:forEach items='${modelUc.ucCapSysSeqMstDraftList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><i class="mdi-image-edit"></i></a>
                                                    </td>
                                                    <td>Draft</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Draft</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/>
                                                    </td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>
                                              <c:forEach items='${modelUc.ucCapSysSeqMstList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Development</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Development</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>
                                              <c:forEach items='${modelUc.ucCapSysSeqMstProdList}' var="seqMst">

                                                <c:set var="changed" value="false"/>
                                                <c:if test="${x=='0' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Production</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="changed" value="true"/>
                                                    <c:set var="x" value="1"/>
                                                  </tr>
                                                </c:if>

                                                <c:if test="${x=='1' && changed=='false'}">
                                                  <tr>
                                                    <td>
                                                      <a target="_blank" class="bottom seq-margin yellow-tooltip" href="#" data-placement="bottom" data-toggle="tooltip" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                                                    </td>
                                                    <td><a target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><i class="mdi-image-edit"></i></a></td>
                                                    <td>Production</td>
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${seqMst.createdDate}"/></td>
                                                    <td>${seqMst.usernameAndTeamCreated}</td>
                                                    <td>${seqMst.catName}</td>

                                                    <c:set var="x" value="0"/>

                                                  </tr>
                                                </c:if>
                                              </c:forEach>

                                            </table>
                                          </td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>

                                  <script type="text/javascript" src="jquery/bootstrap.min.js"></script>
                                  <script type="text/javascript">
                                    $(document).ready(function () {
                                      $('a').tooltip();
                                    });
                                  </script>
                                </body>
                              </html>
