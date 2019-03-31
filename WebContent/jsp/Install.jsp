<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
queries -->

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

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
ul {
  list-style-type: none;
}

label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
}

div.terms {
	width:320px;
	height:300px;
	border:1px solid #ccc;
	background:#f2f2f2;
	padding-top: 15px;
	padding: 0px 40px;
	overflow:auto;
	position: relative;
	top: 20px;
	left: 90px;
}
div.terms p,
div.terms li {font:normal 11px/15px arial;color:#333;}
div.terms h3 {font:bold 14px/19px arial;color:#000;}
div.terms h4 {font:bold 12px/17px arial;color:#000;}
div.terms strong {color:#000;}

</style>
<title>Configure database</title>
<meta name="description" content="Install qSequence"> 
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="/eseq-100/css/jquery-ui.css">
<script type="text/javascript">
$(document).ready(function() {
	
	if( $('#dbList').val()==="Oracle"){
		$('li.service').show();
        $('li.schema').hide();
        $('li.database').hide();
    }
    
    if( $('#dbList').val()==="MySQL"){
        $('li.database').show();
        $('li.service').hide();
        $('li.schema').hide();
    }
    
    if( $('#dbList').val()==="PostgreSQL"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }
    if( $('#dbList').val()==="MicrosoftSQLServer"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }	
	
$('#dbList').on('change',function(){

	if( $('#dbList').val()==="Oracle"){
		$('li.service').show();
        $('li.schema').hide();
        $('li.database').hide();
    }
    
    if( $('#dbList').val()==="MySQL"){
        $('li.database').show();
        $('li.service').hide();
        $('li.schema').hide();
    }
    
    if( $('#dbList').val()==="PostgreSQL"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }
    if( $('#dbList').val()==="MicrosoftSQLServer"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }
});

});

</script>
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

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/InstallCompleted.htm?param=installcompleted"/>
</c:if>


        <form action="Install.htm" method="post" onsubmit="return checkCheckBox(this)">
		<table align="center" width="600px">
		<tbody>
					<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
		<tr><td colspan="2"><h1 style="margin: 30px 0px 0px 50px;">Configure database</h1></td></tr>
		<tr><td colspan="2">
        	<table border="0" align="right" width="100%" style="position: relative; top: 0px; left: -55px;">
        		<tbody>
					<tr><td>&nbsp;</td></tr>
					<tr><td>&nbsp;</td></tr>
        		<tr style="background-color: gray; color: black;height:50px">
        			<td width="100%">
        			<c:if test="${modelUc.radioDBValue=='bundledDB'}">
        				Default Bundled database (Suitable for evaluation and demonstration purposes only)
        			</c:if>
        			<c:if test="${modelUc.radioDBValue!='bundledDB'}">
        				Default Bundled database (Suitable for evaluation and demonstration purposes only)
        			</c:if>
        			</td>
        		</tr>
         		<tr style="background-color:#E8E8E8; color: black;height:50px"><td width="100%">
         			<c:if test="${modelUc.radioDBValue=='customDB'}">
         				Your own database (Production use)
         			</c:if>
         			<c:if test="${modelUc.radioDBValue!='customDB'}">
         				Your own database (Production use)
         			</c:if>
         			<c:if test="${modelUc.dbListValue==null}">
	        			<select name="dbList" id="dbList">
	        		</c:if>
	        		<c:if test="${modelUc.dbListValue!=null}">
	        			<select name="dbList" id="dbList">
	        		</c:if>
	        			<option value="SelectDB">Select database</option>
	        			<c:if test="${modelUc.dbListValue=='Oracle'}">
		                	<option title="Tooltip" selected="selected" value="Oracle">Oracle</option>
		                </c:if>
		                <c:if test="${modelUc.dbListValue!='Oracle'}">
		                	<option title="Oracle Tooltip" value="Oracle">Oracle</option>
		                </c:if>
		                <c:if test="${modelUc.dbListValue=='MySQL'}">
		                	<option title="Tooltip" selected="selected" value="MySQL">MySQL</option>
		                </c:if>
		                <c:if test="${modelUc.dbListValue!='MySQL'}">
		                	<option title="Tooltip" value="MySQL">MySQL</option>
		                </c:if>
		                <c:if test="${modelUc.dbListValue=='PostgreSQL'}">
		                	<option  title="Tooltip" selected="selected" value="PostgreSQL">PostgreSQL</option>
		                </c:if>
		                <c:if test="${modelUc.dbListValue!='PostgreSQL'}">
		                	<option title="Tooltip" value="PostgreSQL">PostgreSQL</option>
		                </c:if>
		                <!-- 
		                <c:if test="${modelUc.dbListValue=='MicrosoftSQLServer'}">
		                	<option title="Tooltip" selected="selected" value="MicrosoftSQLServer">MicrosoftSQLServer</option>
		                </c:if>
		                <c:if test="${modelUc.dbListValue!='MicrosoftSQLServer'}">
		                	<option title="Tooltip" value="MicrosoftSQLServer">MicrosoftSQLServer</option>
		                </c:if>
		                 -->
	  				</select>
        		</td>
        		</tr>
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td width="100%">
        				
        				<ul>
        					<li>
								<label for="hostname">hostname</label>
								<input type="text" name="hostname" value="${modelUc.hostname}"/>*
							</li>
							<li>
								<label for="hostname">port</label>
								<input type="text" name="port" value="${modelUc.port}"/>*
							</li>
							<li class="database">							
								<label for="hostname">database</label>
								<input type="text" name="database" value="${modelUc.database}"/>*
							</li>
							<li class="service">
								<label for="hostname">service</label>
								<input type="text" name="service" value="${modelUc.service}"/>*
							</li>
							<li class="schema">							
								<label for="hostname">schema</label>
								<input type="text" name="schema"  value="${modelUc.schema}"/>*
							</li>
							
							<li>
								<label for="hostname">username</label>
								<input type="text" name="username" value="${modelUc.username}"/>*
							</li>
							<li>
								<label for="hostname">password</label>
								<input type="password" name="password" value="${modelUc.password}"/>*
							</li>
						</ul>

        			</td>
            		
                </tr>
        		
        		<tr><td colspan="2">
        			<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="install_qsequence" />
        			<input type="submit" value="Configure and continue"><strong><font color="red">${modelUc.error}</font></strong>
				</td></tr>                

        	</tbody></table>
 			
		</td></tr>
	</tbody></table>
        </form>
<%@ include file="footer.jsp"%>
