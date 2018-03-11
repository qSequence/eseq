<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
queries -->
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
}
</style>
<script type="text/javascript">
	function addLi(accessText, userId, access)
	{
		if(access=='RO'){
			accessText+=" - Read Only Access";
		}else if(access=='RW'){
			accessText+=" - Read Write Access";
		}else if(access=='OW'){
			accessText+=" - Owner Access";
		}
		document.getElementById('user_name_param').value="";
//		$("#div_id ul").append('<li><span class="tab">Message Center</span></li>');		
		$("#div_id ul").append('<li id="li_'+userId+'" style="padding-left:10px"><a href="#" onclick="parentNode.parentNode.removeChild(parentNode)"> '+accessText+'<input type="hidden" name="'+userId+'_'+access+'" value="'+userId+'_'+access+'" /> </a></li>');
	}
</script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
// 	$("#sometext").hide();
// 	$("#add_property_div").hide();
// if ($("#sometext").text().trim().length > 0) {

// 	$("#sometext")
// 	.fadeIn("slow")
// 	.animate({ opacity: 0 }, 6000);
//    }

//$('<div class="save-alert">The current scenario has been saved.</div>')
//    .insertAfter($('#sometext'))
//    .fadeIn('slow')
//    .animate({ opacity: 1.0 }, 3000)
//    .fadeOut('slow', function () {
//	alert('sdddd');
//    $(this).remove();
//});

 $("#form_submit_button").click(function(){
  //alert("The button was clicked.");
        var taVal=$("textarea#descriptionTA").val();
		//alert("Before"+taVal);
$("input#description_param").val(taVal);
		//alert("Changed"+$("input#description_param").val());
		
		var taChangeVal=$("textarea#changeLongTA").val();
		//alert("Before"+taVal);
$("input#change_long_param").val(taChangeVal);
		
		document.getElementById("subscription_order_form").submit();
});

	$("#cat_name").combogrid({
		url: 'SearchCategories.htm?action_param=search_with_properties_only',
		colModel: [
		           {'columnName':'catIdCol','width':'0','label':''},
		           {'columnName':'catNameCol','width':'50','label':'Category Name'}
		           ],
		select: function( event, ui ) {


		$("#cat_name").val(ui.item.catNameCol);
		document.getElementById('cat_id').value=ui.item.catIdCol;
		
		return false;
		}
		});
	$("#user_name_param").combogrid({
		url: 'SearchUsers.htm?action_param=search_with_properties_only',
		colModel: [
		           {'columnName':'userIdCol','width':'0','label':''},
		           {'columnName':'userNameCol','width':'50','label':'Username'},
		           {'columnName':'nameCol','width':'50','label':'Name'}
		           ],
		select: function( event, ui ) {


		$("#user_name_param").val(ui.item.userNameCol);
		document.getElementById('user_id_param').value="user_"+ui.item.userIdCol;
		
		return false;
		}
		});	
	
});

	
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
<div id="cntainer">

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${modelUc.seqMstId}&sys_seq_id=${modelUc.sysSeqId}&message_param=${modelUc.message}&one_way_param=${modelUc.oneWay}&sequenceVersion=${modelUc.sequenceVersion}"/>
</c:if>
<form id="subscription_order_form" action="SeqMst.htm" method="post" >
	<table align="center" border="0">
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
		<tr><td ><h1>Edit Sequence</h1><h2>
<%-- 		<c:if test="${modelUc.sequenceVersion=='sys_seq' or modelUc.sequenceVersion=='sys_seq_draft' or modelUc.sequenceVersion=='sys_seq_prod' or modelUc.sequenceVersion=='PROD' }">  --%>
<%-- 			<input disabled id="seqName" name="seq_name_param" type="text" size="45" maxlength="100" value="${modelUc.seqName}" /> --%>
			
<%-- 		</c:if> --%>
<%-- 		<c:if test="${modelUc.sequenceVersion==null or modelUc.sequenceVersion=='' or modelUc.sequenceVersion=='SEQ' or modelUc.sequenceVersion=='DRAFT'}"> --%>
			<input id="seqName" name="seq_name_param" type="text" size="45" maxlength="100" value="${modelUc.seqName}" />
			
<%-- 		</c:if> --%>
		</h2></td><td style="text-align:right;"><a href="<c:url value="ViewSequenceList.htm?request_action_param=default_action&seq_mst_id_param=${modelUc.seqMstId}"/>">&lt;&lt;&nbsp;Back</a></td></tr>
		<tr style="height:50px;"><td colspan="2">Category
			<c:if test="${modelUc.hasOwnerAccessToSeq==true}">
				<input id="cat_name" name="cat_name" type="text" size="97" maxlength="100" value="${modelUc.catName}" />
				<input id="cat_id" name="cat_id" type="hidden" value="${modelUc.catId}" />
			</c:if>
			<c:if test="${modelUc.hasOwnerAccessToSeq==false}">
				<input id="cat_name" name="cat_name" type="text" disabled="disabled" size="97" maxlength="100" value="${modelUc.catName}" />
				<input id="cat_id" name="cat_id" type="hidden" value="${modelUc.catId}" />
				
			</c:if>
			<p><strong>Note: if category is changed, teams with access priviledges to previous category will not be able to access this sequence.</strong></p>
		</td></tr>
		<tr style="height:50px;text-align:left;"><td colspan="2" >
        	<div id="div_id" style="overflow:auto;height:300px;width:700px;border: 2px solid grey;">
				<table ><tr><td><label><strong>Access</strong> : Note: if access is provided for a specific sequence, this will override all other access priviledges. Whoever is in the list will only be able to access the sequence. </label></td></tr>
					<c:if test="${modelUc.hasOwnerAccessToSeq==true}">
                        <tr style="height:50px;text-align:left;"><td><label>User</label> <input type="text" id="user_name_param"  maxlength="20"/><input type="hidden" id="user_id_param" /><label>Access Level</label> <select name="access_param" id="access_param" ><option value="RO">Read Only</option><option value="RW">Read Write</option></select><button type="button" onclick="addLi(document.getElementById('user_name_param').value, document.getElementById('user_id_param').value, document.getElementById('access_param').value)">Add</button></td></tr>
					</c:if>
                </table>
<hr>
			  <ul id="ul_id" style="width:100%">
			  <c:if test="${modelUc.hasOwnerAccessToSeq==true}">
			  	<c:forEach items='${modelUc.accessList}' var="userAccess">
			            <li id="li_${userAccess.id}" style="padding-left:10px"><a href="#" onclick="parentNode.parentNode.removeChild(parentNode)"> ${userAccess.accessText }<input type="hidden" name="user_${userAccess.id}" value="user_${userAccess.id}_${userAccess.access}" /> </a></li>
			    </c:forEach>
			  </c:if>
			  <c:if test="${modelUc.hasOwnerAccessToSeq==false}">
			  	<c:forEach items='${modelUc.accessList}' var="userAccess">
			            <li id="li_${userAccess.id}" style="padding-left:10px"> ${userAccess.accessText }<input type="hidden" name="user_${userAccess.id}" value="user_${userAccess.id}_${userAccess.access}" /> </li>
			    </c:forEach>
			  </c:if>      
			  </ul>
			</div>
        </td></tr>
		<tr><td colspan="2">
			<div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
		<div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
		</td></tr>
        <tr style="height:50px;"><td colspan="2">
	        <c:if test="${modelUc.sequenceVersion=='SEQ' or modelUc.sequenceVersion==null or modelUc.sequenceVersion=='' }">
	        	Dev sequence versions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:blue" href="<c:url value="ViewSequenceList.htm?request_action_param=default_action&seq_mst_id_param=${modelUc.seqMstId}&sequenceVersion=DEV_VERSION"/>">Dev sequence versions</</a>
	        </c:if>
	        <c:if test="${modelUc.sequenceVersion=='PROD'}">
	        	Prod sequence versions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:blue" href="<c:url value="ViewSequenceList.htm?request_action_param=default_action&seq_mst_id_param=${modelUc.seqMstId}&sequenceVersion=PROD_VERSION"/>">Prod sequence versions</</a>
	        </c:if>
        </td></tr>
        <c:if test="${modelUc.sequenceVersion=='sys_seq' or modelUc.sequenceVersion=='sys_seq_draft' or modelUc.sequenceVersion=='sys_seq_prod' or modelUc.sequenceVersion=='SEQ_PROD' }">
			<tr><td colspan="2">Sequence Description</td></tr>
			<tr><td colspan="2"><textarea disabled maxlength="4000" name="descriptionTA" id="descriptionTA" cols="108" rows="4">${modelUc.description}</textarea></td></tr>
		</c:if>
		<c:if test="${modelUc.sequenceVersion==null or modelUc.sequenceVersion=='' or modelUc.sequenceVersion=='SEQ' or modelUc.sequenceVersion=='DRAFT' or modelUc.sequenceVersion=='PROD'}">
			<tr><td colspan="2">Sequence Description</td></tr>
			<tr><td colspan="2"><textarea maxlength="4000" name="descriptionTA" id="descriptionTA" cols="108" rows="4">${modelUc.description}</textarea></td></tr>
		</c:if>
               <tr style="height:50px;">
                        <td colspan="2">
                                <a  target="_blank" href="<c:url value="ViewChangeRelease.htm?user_request_action_param=retrieve_release_view&seqMstIds=${modelUc.seqMstId}&sysSeqIds=${modelUc.sysSeqId}&sequenceVersion=${modelUc.sequenceVersion}"/>">Change Release List</a>
                        </td>
                </tr>
		<tr><td colspan="2">Revision Title</td></tr>
		<tr><td colspan="2"><input id="changeShort" name="change_short_param" type="text" size="105" maxlength="100" value="${modelUc.changeShort}" /></td></tr>
		<tr><td colspan="2">Revision Description</td></tr>
		<tr><td colspan="2"><textarea maxlength="4000" name="changeLongTA" id="changeLongTA" cols="108" rows="4">${modelUc.changeLong}</textarea></td></tr>
        <tr style="height:50px;"><td colspan="2">One way interaction
        <c:if test="${modelUc.oneWay=='Y'}">
                        <input type="checkbox" name="one_way_param" checked value="Y">

        </c:if>
        <c:if test="${modelUc.oneWay!='Y'}">
                        <input type="checkbox" name="one_way_param" value="Y">
        </c:if><br>
        </td></tr>
	<tr><td colspan="2">

			<input id="description_param" name="description_param" type="hidden" value="${modelUc.description}" />
			
			<input id="change_long_param" name="change_long_param" type="hidden" value="${modelUc.changeLong}" />
			
			<input id="seq_mst_id_param" name="seq_mst_id_param" type="hidden" value="${modelUc.seqMstId}" />
			<input id="sys_seq_id" name="sys_seq_id" type="hidden" value="${modelUc.sysSeqId}" />
			
			<input id="sequenceVersion" name="sequenceVersion" type="hidden" value="${modelUc.sequenceVersion}" />

			<input id="request_action_param" name="request_action_param" type="hidden" value="save_sequence_action" />
			<!--<input id="add_property_button" type="button" value="Add Property">-->
			<c:if test="${modelUc.hasReadWriteAccessToSeq==true}">
				<input id="form_submit_button" type="button" value="Save">&nbsp;&nbsp;&nbsp;<font color="red">${modelUc.message}</font>
			</c:if>
		</td></tr>		
		<tr><td colspan="2">
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
		</td></tr>	
	</table>
</form>
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 				
<%@ include file="footer.jsp"%>
