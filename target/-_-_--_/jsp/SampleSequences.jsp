<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Login</title>
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
<div id="container">

		<table align="center">
        <tr><td>
		<c:set var="x" value="0" />
        	<table align="center" width="500">
			<tr height="50px"><td></td></tr>

         		<tr height="50px"><th  bgcolor="#CCCCFF" width="70%" ><label for="sequenceName">Sample Sequences</label></th></tr>
         		<c:forEach items='${modelUc.ucSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #85E0E0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value="GlobalSeqDet.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>">${seqMst.seqName}</a></td>


					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#33CCCC; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value="GlobalSeqDet.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>">${seqMst.seqName}</a></td>

					<c:set var="x" value="0" />
        		</tr>
        		</c:if>
        		</c:forEach>       
        	</table>
       </td>
       </tr> 
	</table>
	<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>