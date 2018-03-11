<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<style type="text/css">

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
<title>Configure SMTP</title>
<meta name="description" content="Configure SMTP step 1 product configuration"> 

</head>
      <body>
	<div id="container">
<div id="banner">


</div> 
<div id="bannerlinks">            
<!--<table width="480 px" style=font-weight: bold; font-size: 14px;>-->

</div>
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/configureSmtp.htm?status=${modelUc.status}&successMessage=${modelUc.successMessage}&configureSmtpStep=${modelUc.configureSmtpStep}"/>
</c:if>


        <form action="configureSmtp.htm" method="post" >

		<table align="center">
		<tbody>
					<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
		<tr><td colspan="2"><h1 style="margin: 30px 0px 0px 50px;">Configure SMTP</h1></td></tr>
		<tr><td>
        	<table border="0" align="right" width="70%" style="position: relative; top: 0px; left: -55px;">
        		<tbody><tr><td width="40%"><label style="width: 200px;" for="fromEmailAddress">From Email Address</label>*</td><td>&nbsp;</td></tr>
         		<tr><td width="40%"><input id="fromEmailAddress" name="fromEmailAddress" type="text" maxlength="100" value="${modelUc.fromEmailAddress}" /></td>
         			<td><font color="red">${modelUc.fromEmailAddressError}</font></td>
         		</tr>

        		<tr><td width="40%"><label for="replyToEmailAddress">Reply To Email Address</label></td>
        			<td>&nbsp;</td>
        		</tr>
        		<tr>
        			<td width="40%"><input id="replyToEmailAddress" name="replyToEmailAddress" type="text" maxlength="100" value="${modelUc.replyToEmailAddress}" /></td>
            		<td><font color="red">${modelUc.replyToEmailAddressError}</font></td>
                </tr>
        		<tr><td width="40%"><label for="smtpServer">SMTP Server</label></td>
        		<td>&nbsp;</td>
        		</tr>
        		<tr><td width="40%"><input id="smtpServer" name="smtpServer" type="text" maxlength="100"  value="${modelUc.smtpServer}"/></td>
        		<td><font color="red">${modelUc.smtpServerError}</font></td>
        		</tr>
         		            
        		<tr><td colspan="2">
	        		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_smtp" />
				</td></tr>                
				<tr><td colspan="2">
					<input type="submit" value="Submit form">
				</td></tr>
        	</tbody></table>

			</td>
	
			
			</tr>
			</tbody></table>


        </form>
      <br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 
<%@ include file="footer.jsp"%>