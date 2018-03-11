<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Edit Sequence</title>
<script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script src="jquery/jquery-latest.js"></script>
		
</script>
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
</style>
</head>
<body>
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
<script type="text/javascript">
$(document).ready(function() {


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

<div id="container">

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/MyMenu.htm?seq_mst_id_param=${modelUc.seq_mst_id_param}&message=${modelUc.message}&error=${modelUc.error}"/>
</c:if>
<form action="FileUpload.htm" method="post" enctype="multipart/form-data">
    <input type="text" name="description" />
<input type="file" name="fileUploaded" /> <input type="submit" />
</form>



<form id="subscription_order_form" action="SeqMst.htm" method="post"   style="position: relative; left: -50px; top: -10px;">
	<table align="center" border="0" width=60%>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>

        <tr style="height:50px;"><td colspan="2">One way interaction 
        <c:if test="${modelUc.oneWay=='Y'}">
        		<input type="checkbox" name="one_way_param" checked value="Y">
        </c:if>		
        <c:if test="${modelUc.oneWay!='Y'}">
        		<input type="checkbox" name="one_way_param" value="Y">
        </c:if><br>
        </td></tr>
		<tr><td colspan="2">Description</td></tr>
		<tr><td colspan="2"><textarea maxlength="4000" name="descriptionTA" id="descriptionTA" cols="100" rows="4">${modelUc.description}</textarea></td></tr>
	<tr><td colspan="2">

			<input id="description_param" name="description_param" type="hidden" value="${modelUc.description}" />
			
			<input id="seq_mst_id_param" name="seq_mst_id_param" type="hidden" value="${modelUc.seq_mst_id_param}" />

			<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_sequence_action" />
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