<%@ include file="header_for_seqdet.jsp"%>
<script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">

<title>Sequence List</title>

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

});

function updateSeqMst( user_request_action_param, social_network_param, seq_mst_id_param, url) {

$("#img_"+seq_mst_id_param).attr('src',"images/secure-link-image.png");
$("#img_"+seq_mst_id_param).attr('title',"Secure your shared link");
$("#img_"+seq_mst_id_param).attr('alt',"Secure your shared link");

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					social_network_param:social_network_param
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



<div id="container">
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

<form id="release_form" action="ModifiedSequenceList.htm" method="post" >
   <input type="hidden" name="user_request_action_param" value="generate_release" />
   <input type="hidden" name="sequenceVersion" value="${modelUc.sequenceVersion}" />
   <table align="center">
      <tr>
         <td>
            <table align="center" class="table-striped table-hover">
               <tr>
                  <td colspan="2">&nbsp;</td>
               </tr>
               <tr>
                  <td style="text-align:center;">
                     <h1>Release Sequences</h1>
                  </td>
                  <td style="text-align:right;">
                     <!-- <a href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${modelUc.seq_mst_id_param}"/>">&lt;&lt;&nbsp;Back</a> -->&nbsp;
                  </td>
               </tr>
               <c:if test="${modelUc.message=='' or modelUc.message==null}">
                  <tr style="height:50px;text-align:center;">
                     <td colspan="2" ><label>Select from the below list of sequences </label> <button id="release" type="button" onclick="document.getElementById('release_form').submit();">Release</button><br>
                     </td>
                  </tr>
               </c:if>
               <tr>
                  <td colspan="2">
                     <div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
                     <div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td>
            <c:set var="x" value="0" />
            <table align="center" class="table-striped table-hover">
               <c:if test="${modelUc.userRequestAction=='draft_release'}">
                  <tr>
                     <td width="100%" ><label for="sequenceName">Draft sequences</label></td>
                  </tr>
                  <tr>
                     <th><label for="sequenceName">Sequence Name</label></th>
                     <th><label for="createdDate">Change Label</label></th>
                     <th><label for="createdDate">Created Date</label></th>
                     <th><label for="release">Release</label></th>
                  </tr>
                  <c:if test="${modelUc.ucSeqMstDraftList[0]==null}">
                     <tr>
                        <td colspan="5"><font color="red"><strong>No draft sequences found.</strong></font>
                        </td>
                     </tr>
                  </c:if>
               </c:if>
               <c:if test="${modelUc.ucSeqMstDraftList[0]!=null}">
                  <c:forEach items='${modelUc.ucSeqMstDraftList}' var="seqMst">
                     <c:set var="changed" value="false" />
                     <c:if test="${x=='0' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
                              </c:if>
                           </td>
                           <c:set var="changed" value="true" />
                           <c:set var="x" value="1" />
                        </tr>
                     </c:if>
                     <c:if test="${x=='1' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
                              </c:if>
                           </td>
                           <c:set var="x" value="0" />
                        </tr>
                     </c:if>
                  </c:forEach>
               </c:if>
               <!-- =================DRAFT System sequence ========================= -->
               <c:if test="${modelUc.userRequestAction=='draft_release'}">
                  <tr>
                     <td width="100%" ><label for="sequenceName">Draft system sequences</label></td>
                  </tr>
                  <tr>
                     <th><label for="sequenceName">Sequence Name</label></th>
                     <th>
                        <label for="createdDate">Change Label</label>
                     </th>
                     <th><label for="createdDate">Created Date</label></th>
                     <th><label for="release">Release</label></th>
                  </tr>
                  <c:if test="${modelUc.ucSysSeqMstDraftList[0]==null}">
                     <tr>
                        <td colspan="5"><font color="red"><strong>No draft system sequences found.</strong></font>
                        </td>
                     </tr>
                  </c:if>
               </c:if>
               <c:if test="${modelUc.ucSysSeqMstDraftList[0]!=null}">
                  <c:forEach items='${modelUc.ucSysSeqMstDraftList}' var="seqMst">
                     <c:set var="changed" value="false" />
                     <c:if test="${x=='0' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeTitle}">${seqMst.changeNote}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
                              </c:if>
                           </td>
                           <c:set var="changed" value="true" />
                           <c:set var="x" value="1" />
                        </tr>
                     </c:if>
                     <c:if test="${x=='1' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
                              </c:if>
                           </td>
                           <c:set var="x" value="0" />
                        </tr>
                     </c:if>
                  </c:forEach>
               </c:if>
               <!-- ***********************DEV RELEASE *************************************** -->
               <c:if test="${modelUc.userRequestAction=='dev_release'}">
                  <tr>
                     <td width="100%" ><label for="sequenceName">Development sequences</label></td>
                  </tr>
                  <tr>
                     <th><label for="sequenceName">Sequence Name</label></th>
                     <th><label for="createdDate">Change Label</label></th>
                     <th>
                        <label for="createdDate">Created Date</label>
                     </th>
                     <th><label for="release">Release</label></th>
                  </tr>
                  <c:if test="${modelUc.ucSeqMstList[0]==null}">
                     <tr>
                        <td colspan="5"><font color="red"><strong>No sequences found.</strong></font>
                        </td>
                     </tr>
                  </c:if>
               </c:if>
               <c:if test="${modelUc.ucSeqMstList[0]!=null}">
                  <c:forEach items='${modelUc.ucSeqMstList}' var="seqMst">
                     <c:set var="changed" value="false" />
                     <c:if test="${x=='0' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
                              </c:if>
                           </td>
                           <c:set var="changed" value="true" />
                           <c:set var="x" value="1" />
                        </tr>
                     </c:if>
                     <c:if test="${x=='1' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" checked value="${seqMst.seqMstId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_seqMstId_${seqMst.seqMstId}" value="${seqMst.seqMstId}">
                              </c:if>
                           </td>
                           <c:set var="x" value="0" />
                        </tr>
                     </c:if>
                  </c:forEach>
               </c:if>
               <!-- =================DEV System sequence ========================= -->
               <c:if test="${modelUc.userRequestAction=='dev_release'}">
                  <tr>
                     <td width="100%" ><label for="sequenceName">Development system sequences</label></td>
                  </tr>
                  <tr>
                     <th><label for="sequenceName">Sequence Name</label></th>
                     <th><label for="createdDate">Change Label</label></th>
                     <th>
                        <label for="createdDate">Created Date</label>
                     </th>
                     <th><label for="release">Release</label></th>
                  </tr>
                  <c:if test="${modelUc.ucSysSeqMstList[0]==null}">
                     <tr>
                        <td colspan="5"><font color="red"><strong>No development system sequences found.</strong></font>
                        </td>
                     </tr>
                  </c:if>
               </c:if>
               <c:if test="${modelUc.ucSysSeqMstList[0]!=null}">
                  <c:forEach items='${modelUc.ucSysSeqMstList}' var="seqMst">
                     <c:set var="changed" value="false" />
                     <c:if test="${x=='0' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
                              </c:if>
                           </td>
                           <c:set var="changed" value="true" />
                           <c:set var="x" value="1" />
                        </tr>
                     </c:if>
                     <c:if test="${x=='1' && changed=='false'}">
                        <tr>
                           <td>
                              <a class="bottom seq-margin yellow-tooltip" target="_blank" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
                           </td>
                           <td class="bottom seq-margin yellow-tooltip"  align="center" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.changeNote}">${seqMst.changeTitle}
                           </td>
                           <td align="center">
                              <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" />
                           </td>
                           <td>
                              <c:if test="${seqMst.selectedForRelease=='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" checked value="${seqMst.sysSeqId}">
                              </c:if>
                              <c:if test="${seqMst.selectedForRelease!='Y'}">
                                 <input type="checkbox" name="release_sysSeqId_${seqMst.sysSeqId}" value="${seqMst.sysSeqId}">
                              </c:if>
                           </td>
                           <c:set var="x" value="0" />
                        </tr>
                     </c:if>
                  </c:forEach>
               </c:if>
            </table>
         </td>
      </tr>
   </table>
</form>


<script type= "text/javascript" src="jquery/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
  $('a').tooltip();
});
</script>
<br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
