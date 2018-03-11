<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Privacy Policy</title>
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
<div id="container">

<font face="Verdena">
<div style="height:auto;width:900px;position:absolute;top:200px;left:250px">
<p>
<h1 style="margin: 30px 0px 0px 50px;">Privacy policy</h1>
<br />
As of 14 November 2012, Enterprise Sequence updated its privacy policy to give our customers a better understanding of our privacy policy and practice. If you have any questions, please contact admin@qsequence.com
<br /><br />
Enterprise Sequence is committed to respecting your online privacy and recognise your need for appropriate protection and management of any personally identifiable information (personal information) you share with us.
<br /><br />
Enterprise Sequence has established this online privacy policy so that you can understand the care with which we intend to treat your personal information.
<br />
Personal information means any information that may be used to identify an individual, including, but not limited to, a first and family name, a home or other physical address, an email address or other contact information, whether at work or at home.
<br />
If you choose to provide us with your personal information on the web, we may transfer that information, within Enterprise Sequence or to Enterprise Sequence's third-party service providers, across borders and from your country or jurisdiction to other countries or jurisdictions around the world.
<br /><br />
Enterprise Sequence strives to comply with all applicable laws around the globe that are designed to protect your privacy. Although legal requirements may vary from country to country, Enterprise Sequence intends to adhere to the principles set forth in this online privacy policy, even if in connection with the above, we transfer your personal information from your country to countries that may not require an 'adequate' level of protection for your personal information. In other words, our goal is to provide protection for your personal information no matter where that personal information is collected, transferred or retained.
<br /><br />
<strong>Cookies and other tracking technologies</strong>
<br /><br />
Some of our webpages utilise 'cookies' and other tracking technologies. A cookie is a small text file that may be used, for example, to collect information about website activity. Some cookies and other technologies may serve to recall personal information previously indicated by a web user. Most browsers allow you to control cookies, including whether or not to accept them and how to remove them.
<br /><br />
You may set most browsers to notify you if you receive a cookie or you may choose to block cookies with your browser. Please note if you choose to erase or block your cookies, you will be required to re-enter your original user ID and password to gain access to certain parts of the website.
<br /><br />
Tracking technologies may record information such as internet domain and host names, internet protocol (IP) addresses, browser software and operating system types, click-stream patterns, and dates and times that our site is accessed. Our use of cookies and other tracking technologies allows us to improve our website and your web experience. We may also analyse information that does not contain personal information for trends and statistics.
<br /><br />
To protect your privacy, we have adopted the following principles.
<br /><br />
<strong>Notice</strong>
<br /><br />
Where Enterprise Sequence  collects personal information on the web, we intend to post a purpose statement that explains why personal information will be collected and whether we plan to share such personal information outside of Enterprise Sequence or those working on Enterprise Sequence's behalf. Enterprise Sequence does not intend to transfer personal information without your consent to third-parties who are not bound to act on Enterprise Sequence's behalf unless such transfer is legally required.
<br /><br />
<strong>Choice</strong>
<br /><br />
You may choose whether or not to provide personal information to Enterprise Sequence. The notice we intend to provide where Enterprise Sequence collects personal information on the web should help you to make this choice. If you choose not to provide the personal information we request, you can still visit most of Enterprise Sequence's websites, but you may be unable to access certain options, offers and services that involve our interaction with you.
<br /><br />
<strong>Security</strong>
<br /><br />
Wherever your personal information may be held within Enterprise Sequence or on its behalf, we intend to take reasonable and appropriate steps to protect the personal information that you share with us from authorised access or disclosure. 
<br /><br />
<strong>Access/accuracy</strong>
<br /><br />
To the extent that you do provide us with personal information, Enterprise Sequence wishes to maintain accurate personal information. Where we collect personal information from you on the web, our goal is to provide a means of contacting Enterprise Sequence should you need to update or correct that information. If for any reason those means are unavailable or inaccessible, you may send updates and corrections about your personal information to admin@qsequence.com and we will make reasonable efforts to incorporate the changes in your personal information that we hold as soon as practicable.
<br /><br />
<strong>Commitment</strong>
<br /><br />
We are committed to privacy and if you have any comments or questions regarding our online privacy policy, please contact us at admin@qsequence.com. While we cannot guarantee privacy perfection, we will address any issue to the best of our abilities at our earliest opportunity.
<br /><br />
<strong>Your consent</strong>
<br /><br />
By using this website, you consent to the terms of our online privacy policy and to Enterprise Sequence's processing of personal information for the purposes given above as well as those explained where Enterprise Sequence  collects personal information on the web. Should the online privacy policy change, we intend to take every reasonable step to ensure that these changes are brought to your attention by posting all changes prominently on our website for a reasonable period of time.

</p>
</div>
</font>
		<br /> <br /> 
		<br /> <br /> 
				<br /> <br /> 
		<br /> <br /> 
<%@ include file="footer.jsp"%>