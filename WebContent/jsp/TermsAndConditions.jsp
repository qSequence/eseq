<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<title>Terms And Conditions</title>
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
<div id="container">

<font face="Verdena">
<div style="height:auto;width:900px;position:absolute;top:200px;left:250px">
<p>
<h1 style="margin: 30px 0px 0px 50px;">Terms & Conditions</h1>
<br /> <br /> 

The following paragraphs state the terms and conditions under which you may use this web site. It is important that you read this page carefully because by opening our web site you agree to be bound, without limitation or qualification, by these terms. If you do not accept any of the terms stated here then do not use the web site. This web site may, in its sole discretion, modify or revise these terms at any time by updating this web page. You are bound by any such modification or revision. The content of the pages of this website is for your general information and use only. It is subject to change without notice.
<br /> <br /> 
The use of this website is subject to the following terms of use
<br /> <br /> 
<strong>Disclaimer of Damages</strong>
<br /> <br /> 
Use of our web site is at all times "at your own risk." If you are dissatisfied with any of the materials, other contents of the web site, any of these terms and conditions, the web site's privacy policy, or any other policies, your only remedy is to discontinue use of our web site. In no event shall the web site, or its suppliers, be liable to any user or third party, for any damages whatsoever resulting from the use or inability to use the web site or the material on that site, whether based on warranty, contract, tort, or any other legal theory, and whether or not the web site is advised of the possibility of such damages. The definition of damages under this provision include, but are not limited to, indirect or consequential damages, any loss or damage arising from loss of data, and any lost profits arising out of or in connection with the use of this website.
		<br /> <br /> 
<strong>Warranty Policy</strong>
		<br /> <br /> 
Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.
		<br /> <br /> 
<strong>
Data Retention</strong>
		<br /> <br /> 
We will retain your information on web hosting servers managed by third-party as long as you request us to do so. You may delete data from your account at any time. Although this website uses backups to protect your data from failures, it cannot guarantee that backups will function error free. This website cannot restore data from a backup on request.
		<br /> <br /> 
If any provision of this agreement is found to be invalid by any court having competent jurisdiction, the invalidity of such provision shall not affect the validity of the remaining provisions of this agreement, which shall remain in full force and effect.
Your use of this website and any dispute arising out of such use of the website is subject to the laws of Australia.
		<br /> <br /> 
<strong>
Storing Confidential Information</strong>
		<br /> <br /> 
Users are not permitted to store Confidential or High-Risk Confidential Information  in any way. If the user stores illegal or confidential data the website is not liable for any direct or indirect concequences, the user takes full responsibility for its actions.
		<br /> <br /> 
<strong>PERSONAL AND NONCOMMERCIAL USE LIMITATION</strong>
		<br /> <br /> 
This website is for your personal and noncommercial use. The content and information on this website, as well as the infrastructure used to provide such content and information, is proprietary to qSequence.com or its suppliers and providers. Accordingly, as a condition of using this website, you agree not to use this website or its contents or information for any commercial or non-personal purpose (direct or indirect). While you may use the website for personal use, you agree not to modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell or re-sell any information, software, products, or services obtained from this website. In addition, whether or not you have a commercial purpose, you agree not to: 
    access, monitor or copy any content or information of this website using any robot, spider, scraper or other automated means or any manual process for any purpose without express written permission of qSequence.com, L.P.;
    violate the restrictions in any robot exclusion headers on this website or bypass or circumvent other measures employed to prevent or limit access to this website;
    take any action that imposes, or may impose, in the discretion of qSequence.com, an unreasonable or disproportionately large load on the qSequence.com infrastructure; ordeep-link to any portion of this website for any purpose without express written permission of qSequence.com


		<br /> <br /> 
<strong>
COPYRIGHT AND TRADEMARK NOTICES
</strong>
		<br /> <br /> 
All contents of this website are: ©2012 qSequence.com. All rights reserved. qSequence.com and qSequence.com logo are registered trademarks or trademarks of Enterprise Sequence Pty Ltd, L.P. Other product and company names mentioned herein may be the trademarks of their respective owners.
		<br /> <br /> 
<strong>
LIABILITY DISCLAIMER
</strong>
		<br /> <br /> 
NOTHING IN THIS AGREEMENT SHALL, NOR SHALL BE DEEMED, TO LIMIT OR EXCLUDE OUR LIABILITY FOR OUR FRAUD NOR FOR PERSONAL INJURY OR DEATH CAUSED BY OUR NEGLIGENCE.
		<br /> <br /> 
</p>
</div>
</font>
		<br /> <br /> 
		<br /> <br /> 
		
		<br /> <br /> 
		<br /> <br /> 
<%@ include file="footer.jsp"%>