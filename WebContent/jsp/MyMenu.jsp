<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Setup My Menu</title>
<script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script src="jquery/jquery-latest.js"></script>
<%-- 21Dec 2016 added for the header and navigation --%>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<%--END 21Dec 2016 added for the header and navigation --%>
<style type="text/css">	
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
.bubble{
    background-color: green;
    border-radius: 5px;
    box-shadow: 0px 0px 6px #B2B2B2;
    height: 10px;
    margin: 10px;
	font: 10px sans-serif; 
	color : yellow;
	text-align: center;
}

</style>

</head>
<body>
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
<div id="container">

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/MyMenu.htm?seq_mst_id_param=${modelUc.seq_mst_id_param}&message=${modelUc.message}&error=${modelUc.error}"/>
</c:if>


<table align="center" border="0" width=600>
<tr><td>
<form id="subscription_order_form" action="FileUpload.htm" method="post" enctype="multipart/form-data" >
	
	<table align="center" border="0" width=600>
			<tr><td colspan="6">&nbsp;<input type="hidden" name="seq_mst_id_param" value="${modelUc.seq_mst_id_param}" /></td></tr>
			<tr><td colspan="6">&nbsp;</td></tr>
		<tr><td style="text-align:left;" colspan="6"><h1>My Menu</h1></td></tr>
	<tr><td colspan="6" align="center" ><hr></td></tr>	
        <tr style="text-align:left;"><td><label>Menu name </label></td><td> <input type="input" name="menu_item_name_param" maxlength="20"/></td><td><input type="hidden" name="system_type_param" value="custom" maxlength="20"/></td><td><label>Upload menu image </label></td><td> <input type="file" name="fileUploaded" /></td><td><input value="Upload" type="submit" /></td>
	<tr><td colspan="6">
                     <font size=1px>( *** Upload images with dimensions : width 150px, height 100px, and size less than 50kb check <a href="<c:url value="faq.htm#MenuImageSpecs"/>">FAQ</</a></font>)
</td></tr>
		<tr><td colspan="6">
			<div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
			<div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
		</td></tr>	
                <tr><td colspan="6" align="center" ><hr></td></tr>
	</table>
</form>
</td></tr>
<tr><td>
<form id="menu_save_form" action="MyMenu.htm" method="post" >
		<input type="hidden" name="seq_mst_id_param" value="${modelUc.seq_mst_id_param}" />
		<input type="hidden" name="user_request_action_param" value="save_menu_action_param" />
		
		<c:set var="x" value="0" />
			<table border="0" align="center" width="600">
        <tr><td colspan="3" align="center" ><hr></td></tr>
        <tr><td colspan="3" align="center" ><label>Select from the below menu items for sequence and click save</label><button id="save" type="button" onclick="document.getElementById('menu_save_form').submit();">Save</button></td></tr>
        <tr><td colspan="3" align="center" >&nbsp;</td></tr>
         		<tr height="50px"><th colspan="2"  bgcolor="#98bf21" width="70%" ><label for="menuItem">Menu</label></th>
         		<!-- <th  bgcolor="#98bf21"><label for="sequenceName">Created Date</label></th> -->
         		<th  bgcolor="#98bf21"><label for="sequenceName">Selected</label></th></tr>
         		<c:forEach items='${modelUc.ucSeqMenuImagesList}' var="menuImage">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;height:100px;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${menuImage.menuItemName}</td>
        			<td>
        				<img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${menuImage.selected=='Y'}">
							<input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
						</c:if>
						<c:if test="${menuImage.selected!='Y'}">
							<input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
						</c:if>
					</td>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;height:100px;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${menuImage.menuItemName}</td>
        			<td>
						<img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${menuImage.selected=='Y'}">
							<input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
						</c:if>
						<c:if test="${menuImage.selected!='Y'}">
							<input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
						</c:if>
					</td>					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>   
        		<tr><td colspan="3" align="center" ><hr></td></tr>
        		<tr><td colspan="3" align="center" ><h3>Default Menu</h3></td></tr>
        		<tr><td colspan="3" align="center" ><hr></td></tr>
        		<c:forEach items='${modelUc.defaultMenuImagesList}' var="menuImage">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;height:100px;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${menuImage.menuItemName}</td>
        			<td>
        				<img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${menuImage.selected=='true'}">
							<input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
						</c:if>
						<c:if test="${menuImage.selected=='false'}">
							<input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
						</c:if>
					</td>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;height:100px;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${menuImage.menuItemName}</td>
        			<td>
						<img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${menuImage.selected=='true'}">
							<input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
						</c:if>
						<c:if test="${menuImage.selected=='false'}">
							<input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
						</c:if>
					</td>					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>       
        	</table>
</form>
</td></tr>
</table>
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 				
<%@ include file="footer.jsp"%>
