<%@ include file="header_for_seqdet.jsp"%>
<title>qSequence FAQ</title>
<meta name="description" content="Instructions how to create sequences that capture the most relevant and most needed information easily">
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
    height: 20px;
    margin: 20px;
	font: 16px/25px sans-serif; 
	color : yellow;
	text-align: center;
}

</style> 
<script type="text/javascript" src="jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#tool_tip").hide();

	$("#tool_tip")
	.fadeIn(9000);
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

<table align="right">
	<tr><td>
	<c:if test="${modelUc.toolTip=='CONTRIBUTED_SEQ_TIP'}">
		<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Check out <a href="<c:url value="GlobalViewSequenceList.htm" />">example sequences</a> </div>
	</c:if>
	</td>
	</tr>
	</table>
		<font face="Verdena">	
		<div style="height:auto;width:900px;position:absolute;top:200px;left:250px">
            <section class="nav-page-content" role="main">
                <h1 id="faq" align="center">FAQ</h1>
<h3><a name="qsequence"></a>What is qSequence?</h3>
<p>qSequence, stands for quick sequence, you can represent a sequence on a webpage quickly with the use of pull-down menus and in-line editing.</p>
					  <font face="Verdena" size="3px">	
					<ol>
						<li style="background-color: #e7e7e7">Sequence on a webpage is easy to understand, and create them as business users provide requirements or user stories to maximising accuracy, you can start with as little 
	or as much information you have at hand.</li>
						<br>
					</ol>
					</font>
<h3><a name="agile_development"></a>Agile development support</h3>
<p>Record user stories from business users and then add technical/business process details as they become available,qSequence lets you change and add new stories/sequence with ease, details/specifications of each component are available on the sequence (so no need to look for any other documentation)</p>
					  <font face="Verdena" size="3px">	
					<ol>
						<li style="background-color: #d1e7e7">Representing sequence on a webpage increases collaboration, it is easy to share and outline  the scope of work for each member of a team with diverse skill sets.</li>
						<br>
						<li style="background-color: #d1e7e7">Makes it easy to identify dependencies for delivering a user story</li>
						<br>
						
					</ol>
					</font>					
<h3><a name="integration_projects"></a>Enhanced Integration project lifecycle</h3>
<p>In a integration project where multiple systems and technical teams are involved, project managers and architects can get greater control and visibility on the scope of work for each team</p>
					  <font face="Verdena" size="3px">	
					<ol>
						<li style="background-color: #e7e7e7">qSequence automatically highlights  new functionality, and if existing functionality is used then the details are available without additional effort.</li>
						<br>
					</ol>
					</font>										
<h3><a name="knowledgebase"></a>Automatically builds knowledge base</h3>

					  <font face="Verdena" size="3px">	
					<ol>
						<li style="background-color: #e7e7e7">When you create a interaction in a sequence, qsequence will automatically identify if it is a existing function, if not it will be marked as new functionality introduced by this user story </li>
						<br>
						<li style="background-color: #d1e7e7">When creating sequence, existing details of a system and its function will be available on the sequence webpage without additional effort</li>
						<br>
					</ol>
					</font>					
			<h3><a name="new_sequence"></a>How to create a sequence?</h3>
			<p>Login to www.qsequence.com, you will be re-directed to "Sequence List" webpage,</p>
					  <font face="Verdena" size="3px">	
			<ol>
						<li style="background-color: #e7e7e7">Type name of the sequence and click on "Create Sequence" button</li>
						<br>
						<li style="background-color: #d1e7e7">Use the <img id="32" src="<c:url value="images/yellow_+_button.png" />"/> to add description, 
    	       after description is added and saved, come back to the "Sequence List" webpage by clicking "Back" link</li><br>
				        <li style="background-color: #e7e7e7">Click on the <b>sequence name</b> , you will be redirected to "Create Sequence" webpage</li>
						<br>
						<li style="background-color: #d1e7e7">By default sequence interaction  starts with a Customer, you can change it by replacing <br>
    		(Replace instructions : Click on <img id="32" src="<c:url value="/images/menui_selection.png" />"/> Menu, <br>
    		                        select from the pull down menu, the system type you want to replace Customer)</li>
						<br>
						<li style="background-color: #e7e7e7">Add a interaction by clicking on the <img id="32" src="<c:url value="/images/menui_selection.png" />"/> Menu and selecting the system/server/person you would like to create interaction with</li>
						<br>
						<li style="background-color: #d1e7e7">First interaction will be created , you can click on the interaction request and/or response to change, <br>
							Note: you can click on the system/server/person to change their name, click on the interaction Request/Response to change.<br>
						<br>
						            <b>Interaction create options</b>
									<ol type="i">
									<li><b>Option Add</b>: adds interaction  after the selected interaction(ie;selected interaction is the one you clicked the Menu),  
                                this interaction starts after the previous interaction and its child interactions are completed
									</li>
									<li><b>Option Add Child</b>: adds interaction as a child ie;
                                      parent interaction could consist of 0..n child interactions, and
                                      considered complete when all the child interactions are completed. 
									</li>
									<li><b>Option Add As Parent</b>: adds interaction as a parent
									</li>
									<li><b>Option Replace</b>: replaces interaction and system/server/person with the selection
									</li>
									</ol>
							</li>
									<br>
						<li style="background-color: #e7e7e7">Check out the <a href="<c:url value="GlobalViewSequenceList.htm"/>">example's</a></li>
						<br>
						<li style="background-color: #d1e7e7">Check out <a href="<c:url value="#what_information"/>">What information can I add?</a></li>
						<br>
			</ol>
			</font>

			
			<h3><a name="what_information"></a>What information can I add?</h3>
			<p>You can add any information you think is appropriate and concise, here are some pointers that could help you decide</p>
			<br>
		    <font face="Verdena" size="3px">	
		       <b>Request</b>
				<br>
				<ol type="i">
					<li>Request Format ref: Refer to the link of your WSDL/XSD/parameter list http://svn/svn/common/wsdl/CustomerService.wsdl</li>
			         <li>Protocol: SOAP/Rest/Socket/http/https/snmp/ftp/ssh</li>
					<li>Service Endpoint test: </li>
					<li>Service Endpoint prod:</li>
					<li>Tier 1 Support Contact: Services Support on call</li>
					<li>Business contact:</li>
					<li>Sample requests soap ui project: </li>
					<li>request variations and functions document: source and variations depending on data values</li>
				</ol>
				<b>Response</b>
				<br>
				<ol type="i">
					<li>Response Format ref: Refer to the link of your WSDL/XSD/parameter list http://svn/svn/common/wsdl/CustomerService.wsdl</li>
			         <li>Protocol: SOAP/Rest/Socket/http/https/snmp/ftp/ssh</li>
					<li>Service Endpoint test: </li>
					<li>Service Endpoint prod:</li>
					<li>Tier 1 Support Contact: Services Support on call</li>
					<li>Business contact:</li>
					<li>Sample requests soap ui project: </li>
					<li>request variations and functions document: source and variations depending on data values</li>
				</ol>				
				<b>System</b>
				<br>
				<ol type="i">
					<li>Software license and maintenance reference document: http://svn/svn/common/doc/Ssys1.doc</li>
			         <li>Hardware maintenance reference document: http://svn/svn/common/doc/Hsys1.doc</li>
					<li>Supported protocols: SOAP/Rest/Socket/ssh/ftp/sftp</li>
					<li>Software configuration: OS, AppServer, etc</li>
					<li>Tier 1 Support Contact: Services Support on call</li>
					<li>Hardware configuration: </li>
					<li>hostname(s): </li>
					<li>ip address(s):</li>
					<li>Tier 1 Support Contact: Services Support on call</li>
					<li>Business contact:</li>
					<li>Network interfaces: </li>
					<li> VLAN: </li>
					<li>Data center:</li>
					<li>RACK:</li>
					<li>Real-time Monitoring and performance & usage statistics link:</li>
				</ol>
				
				<h3>How can I add links to references or documentation that is relevant to the system/interaction?</h3>
				<p>You can add information by clicking <img id="32" src="<c:url value="/images/information_injection_gray.png" />"/> and choosing Edit information, if you have already setup, then they will be displayed.
				</p>
				<h3><a name="asynch"></a>How can I make a interaction asynchronous?</h3>
				<p>You can click on the <img id="32" src="<c:url value="/images/asynch.png" />"/> next to the interaction to make it asynchronous, 
				Note: Asynchronous behaviour is shown with dashed borders around the system , after clicking on <img id="32" src="<c:url value="/images/asynch.png" />"/> the child interactions will be cached and a Paste Asynch item will be made available in the menu, you will need to paste this where you expect the asynchronous response to come back from the system, 
				alternatively you can paste the response after the asynchronous request
				</p>
				<h3>How can I change the interaction back to synchronous?</h3>
				<p>Click on the <img id="32" src="<c:url value="/images/synch.png" />"/> next to the interaction to make it synchronous</p>
				<h3>How can I see certain sections of the Sequence?</h3>
				<p>You can add sections to make a certain parts of your Sequence more visible or you could just use the minimise<img id="32" src="<c:url value="/images/nav/minus.png" />" /> and  maximise <img id="32" src="<c:url value="/images/plus.png" />" /> 
				</p>
				<h3><a name="MenuImageSpecs"></a>Uploading menu setup images for sequence</h3>
				<p>Upload images with dimensions : width 150px, height 100px, and size less than 50kb, images should be similar to below<br>
					 <img id="32" src="<c:url value="/images/router.png" />"/>
				</p>
				<h3>How can I change the name of the Sequence?</h3>
				<p>The Sequence name can be edited by clicking on the name , there is a 100 character limit on the length of the name
				</p>
				<h3>How can I change the name of the Request/Response/System name?</h3>
				<p>The name can be changed by clicking on it, there is a 50 character limit for the name
				</p>
				<h3>Why do I need to provide my email address when registering?</h3>
				<p>When a password is reset , this email address will be used to send the new password.
				</p>
		</div>
		</font>
	</body>
	</html>
