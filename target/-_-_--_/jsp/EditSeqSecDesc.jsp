<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Edit Sequence</title>
<script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script src="jquery/jquery-latest.js"></script>
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
}
</style>
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
		
		document.getElementById("subscription_order_form").submit();
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
<div id="container">

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/EditSeqSecDesc.htm?user_request_action_param=edit_sequence_action&seq_mst_id_param=${modelUc.seqMstId}&sequenceVersion=${modelUc.sequenceVersion}&row_no_param=${modelUc.rowNo}&col_no_param=${modelUc.colNo}&message_param=${modelUc.message}&description_param=${modelUc.description}"/>
</c:if>
<form id="subscription_order_form" action="EditSeqSecDesc.htm" method="post"   style="position: relative; left: -50px; top: -10px;">
	<table align="center" border="0" width=60%>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
		<tr><td ><h1>Edit ${modelUc.systemName}</h1></td><td style="text-align:right;"><a href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${modelUc.seqMstId}&sequenceVersion=${modelUc.sequenceVersion}"/>">&lt;&lt;&nbsp;Back</a></td></tr>

		<tr><td colspan="2">Description</td></tr>
		<tr><td colspan="2"><textarea maxlength="4000" name="descriptionTA" id="descriptionTA" cols="100" rows="4">${modelUc.description}</textarea></td></tr>
	<tr><td colspan="2">

			<input id="description_param" name="description_param" type="hidden" value="${modelUc.description}" />
			
			<input id="sequenceVersion" name="sequenceVersion" type="hidden" value="${modelUc.sequenceVersion}" />
			<input id="seq_mst_id_param" name="seq_mst_id_param" type="hidden" value="${modelUc.seqMstId}" />
			<input id="seq_mst_id_param" name="seq_item_id_param" type="hidden" value="${modelUc.seqItemId}" />
			<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_sequence_action" />
			<input id="row_no_param" name="row_no_param" type="hidden" value="${modelUc.rowNo}" />
			<input id="col_no_param" name="col_no_param" type="hidden" value="${modelUc.colNo}" />
			<input id="system_type_param" name="system_type_param" type="hidden" value="${modelUc.systemType}" />
			<!--<input id="add_property_button" type="button" value="Add Property">-->
			<input id="form_submit_button" type="button" value="Save">&nbsp;&nbsp;&nbsp;<font color="red">${modelUc.message}</font>
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