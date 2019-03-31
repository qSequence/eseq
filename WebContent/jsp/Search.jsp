<%@ include file="header_for_seqdet.jsp"%>
<title>Search</title>
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


<!--<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;height:100px ">-->
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/Search.htm?user_request_action_param=default_action_param&error=${modelUc.error}&search_param=${modelUc.searchParam}"/>
</c:if>

		<table align="center">
		<tr><td>
        <form action="Search.htm" method="post" >
        	<table>
				<tr><td colspan="3">&nbsp;</td></tr>
        		<tr>
        		<!-- <td><label for="sequenceName">Search</label></td> -->
				<td>
            		<input id="searchParam" name="searchParam" type="text" maxlength="100" />
            		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="default_action_param" />
                </td><td><input type="submit" src="/images/login.png" value="Search"></font></td></tr>
        		<tr>
        		<td colspan="3"><font color="red">${modelUc.error}

        		</font>
        		</td></tr>
        	</table>
        </form>
        </td></tr>
        <tr><td>
		<c:set var="x" value="0" />
        	<table align="center" width="500">
         		<tr height="50px"><th  bgcolor="#CCCCFF" width="70%" ><label for="sequenceName">Sequence Name</label></th></tr>
         		<c:forEach items='${modelUc.ucSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #85E0E0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value="SeqDet.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>">${seqMst.seqName}</a></td>

					<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>" onclick="return confirm('Do you really want to DELETE?? Note this will delete your sequence diagram and its versions..')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>

					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#33CCCC; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value="SeqDet.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>">${seqMst.seqName}</a></td>

					<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>" onclick="return confirm('Do you really want to DELETE?? Note this will delete your sequence diagram and its versions..')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>
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