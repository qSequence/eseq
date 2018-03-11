<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Legal statement</title>
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
<h1 style="margin: 30px 0px 0px 50px;">Legal statement</h1>
<br />
Welcome to Enterprise Sequence. Please read this legal notice. It contains the terms and conditions which apply to your use of the Enterprise Sequence website. Because these terms and conditions can change, you should read them periodically.
<br />
<br />
<strong>Terms of use</strong>
<br /><br />
By accessing the Enterprise Sequence website, and any other sites through links provided by us, or viewing, using or downloading material from the Enterprise Sequence website, you agree to the following terms and conditions. These constitute a legal contract. If you do not agree with these terms and conditions, you should not use this website.
<br /><br />
<strong>Amendments to terms and conditions</strong>
<br /><br />
Enterprise Sequence  reserves the right to amend these terms and conditions from time to time. Amendments will be effective as soon as they appear on this website. If you continue to use this website after the terms and conditions that apply to its use are amended, you agree to be bound by the terms and conditions as amended. 
<br /><br />
<strong>Copyright, trademarks and intellectual property</strong>
<br /><br />
Copyright and other intellectual property rights in this website and all of its content, data (including text, graphics, logos, icons, images, photographs, illustrations, audio clips, video clips, and the underlying HTML files and database records) are owned by Enterprise Sequence.
<br />
You must not reproduce, adapt, use, copy, modify, publish, create derivative works from, transfer, sell, transmit or display the content data or any of it in any form or by any means or process without our written permission. For written permission contact Enterprise Sequence  by completing an enquiry form. 
<br /><br />
<strong>Disclaimer and liability</strong>
<br /><br />
While due care and diligence is taken to ensure the accuracy and currency of the information on this website, Enterprise Sequence, its directors, officers, employees and consultants do not make any representation or warranty that the information is accurate or current. You should not rely upon its accuracy or currency. Enterprise Sequence, its directors, officers, employees and consultants do not accept any responsibility for any error, omission, inaccuracy, misleading information or anything done or not done if you access, use, download, or act in reliance on any representation, information or data contained, linked or distributed through this website.
<br />
Enterprise Sequence, its directors, officers, employees and consultants do not guarantee or warrant that any information or files available for downloading from this website will be free of defects, or that access to the website will be timely and uninterrupted.
<br />
Enterprise Sequence, its directors, officers, employees or consultants will not be liable to you or anyone else on any basis for any direct, indirect, incidental, consequential, special, or punitive damages (including for any loss of profit, revenue, data, programs, information or business interruption) whatsoever and howsoever caused, arising from the access by you or anyone else to this website, or the use of, downloading of, or reliance by you or anyone else on any representation, information, product or service provided on or via this website. 
<br /><br />
<strong>Links to other websites</strong>
<br /><br />
Enterprise Sequence provides links to other websites for your interest and convenience, but do not control or endorse these linked websites. Enterprise Sequence, its directors, officers, employees and consultants are not responsible or liable for any of the content data, information, or any representations or advertisements that may be made at or which may appear at these websites.
<br /><br />
<strong>Specific warnings</strong>
<br /><br />
You must ensure that you are not breaking any law that applies to you by accessing this website. Whilst Enterprise Sequence  takes reasonable steps to ensure that no viruses, worms, trojan horses or other destructive properties are present, you must take precautions to ensure the process you use to access this website does not expose you to the risk of viruses, worms, trojan horses, malicious computer code or other forms of interference which may damage your computer system, or the data which is stored on it.
<br />
Enterprise Sequence , its directors, officers, employees and consultants are not responsible or liable to you for any damage or interference which is caused to your computer system which arises in connection with your use of this website, or any linked website.
<br /><br />
<strong>Security of information</strong>
<br /><br />
Because no data transmitted over the internet can be guaranteed as completely secure, Enterprise Sequence  cannot ensure the security of the information you provide, and you agree to provide any information at your own risk. Enterprise Sequence  will strive to protect such information, and take reasonable steps to preserve the security of your information once it is received. 
<br /><br />
<strong>Severability</strong>
<br /><br />
If any part of these terms and conditions is held invalid, unenforceable or illegal by a court for any reason, then that part must be read down if possible. If that cannot be done then it must be severed and the balance of these terms and conditions will otherwise remain in full force. 
<br /><br />
<strong>Governing law</strong>
<br /><br />
This legal notice, its terms and conditions, and your use of this website are governed by the laws of the State of New South Wales and the Commonwealth of Australia. If a dispute arises in relation to it, the dispute must be subject to the exclusive jurisdiction of the courts of New South Wales and the Commonwealth of Australia. 
<br /><br />
<strong>Termination of access</strong>
<br /><br />
We can terminate access to this website at any time without notice. If we do this, the disclaimer and all of the terms and conditions about our liability to you will still continue to apply.
<br /><br />
<strong>Privacy</strong>
<br /><br />
We shall comply with the terms of our privacy policy which is  available <a href="<c:url value="PrivacyPolicy.htm"/>">here</a>
<br /><br />
Legal notice last revised: 3 July 2012.
Copyright © Enterprise Sequence Pty Ltd ACN  - ABN . All rights reserved.
Reproduction in whole or in part without permission is prohibited. 
</p>

</div>
</font>
		<br /> <br /> 
		<br /> <br /> 
		
<%@ include file="footer.jsp"%>