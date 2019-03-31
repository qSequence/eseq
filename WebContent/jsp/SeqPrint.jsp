<%@ include file="header_for_seqdet.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>Print version</title>
<script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script src="jquery/jquery-latest.js"></script>
<style type="text/css">
.ui-state-hover {
	background-color: #ffC
}

.inlineEdit-placeholder {
	font-style: italic;
	color: #555;
}

table {
	table-layout: fixed;
	overflow: hidden
}

td {
	padding: 0
}

#rubrik {
	width: 100%;
	text-align: center;
}

.minfield {
	max-width: 10px;
	border: 0px solid red;
	overflow: hidden;
}

td.objectname {
	color: blue;
	font-size: 10px;
}



.bubble {
	background-color: green;
	border-radius: 5px;
	box-shadow: 0px 0px 6px #B2B2B2;
	height: 20px;
	margin: 20px;
	font: 16px/25px sans-serif;
	color: yellow;
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

 $("#form_submit_button").click(function(){
  alert("The button was clicked.");		
		document.getElementById("subscription_order_form").submit();
});
   
	
});

	
</script>
</head>
<body>
<div id="bannerlinks">            
<!--<table width="480 px" style=font-weight: bold; font-size: 14px;>-->
<table width="800 px" style=" font-size: 14px;">

<td align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="index.htm"/>">&nbsp;home&nbsp;</a></td>
<td  align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="Contact.htm"/>">&nbsp;contact&nbsp;</a></td>
	<c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
		<td  align="center" width="100px" style="border-right: 1px solid #000088;"><a href="<c:url value="GlobalViewSequenceList.htm"/>">&nbsp;example sequences</a></td>
	    <td align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="ViewSequenceList.htm"/>">&nbsp;sequence list&nbsp;</a></td>
		<td  align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="Logout.htm"/>">&nbsp;logout&nbsp;</a></td>
		<td width="80px" align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="Profile.htm"/>">&nbsp;my profile&nbsp;</a></td>
	</c:if>
	<c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
	<td  align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="GlobalViewSequenceList.htm"/>">&nbsp;example sequences&nbsp;</a></td>
		<td  align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="Login.htm"/>">&nbsp;login&nbsp;</a></td>
		<td width="80px" align="center" style="border-right: 1px solid #000088;"><a href="<c:url value="Register.htm"/>">&nbsp;register&nbsp;</a></td>
	</c:if>

<td style="BORDER-RIGHT: #000088 1px solid"  align="center" ><a href="<c:url value="PrivacyPolicy.htm"/>">&nbsp;privacy policy&nbsp;</a></td>
<td style="BORDER-RIGHT: #000088 1px solid"  align="center" ><a href="<c:url value="TermsAndConditions.htm"/>">&nbsp;terms & conditions&nbsp;</a></td>
<td style="BORDER-RIGHT: #000088 1px solid"  align="center" ><a href="<c:url value="LegalStatement.htm"/>">&nbsp;legal statement&nbsp;</a></td>
<td  align="center" ><a href="<c:url value="faq.htm"/>">&nbsp;FAQ</a></td>

</table> 
</div>
<c:if test="${modelUc.downloadOrPrint=='DOWNLOAD'}">
<c:redirect url="${modelUc.redirectUrl}"/>
</c:if>

<table align="center" width="50%"><tr><td align="left">
<h1>Design</h1>
</td>
</tr>
</table>
<hr>
<table align="center" width="670px" border="1" cellpadding="0" cellspacing="0">
<tr><td>
			<table align="center" width="90%"><tr><td align="left">
			<h2>Sequence Interactions</h2>
			
			</td>
			</tr>
			</table>
<table align="center" border="1" cellpadding="0" cellspacing="0" width="90%">
	<c:forEach items="${modelUc.interactionList}" var="seqInteractions">
		<tr height="50">
		<td>${seqInteractions}</td>
		</tr>
	</c:forEach>
</table>
</td></tr>
<tr><td>
<div  id="seq_det_holder" width=100%>		

			<table align="center" width="90%"><tr><td align="left">
			<h2>Component Design</h2>
			
			</td>
			</tr>
			</table>
			<table align="center" width="90%">
			<tr><td>
<c:forEach var="ucPrintObject" items="${modelUc.ucPrintObjectList}">
<dl>
	<dt><h3>Name : ${ucPrintObject.ucSystemMst.systemName}</h3></dt>
	<dd>${ucPrintObject.ucSystemMst.description}</dd>
	<dd>
				<dl>
					<dd><c:set var="x" value="0" />
						<table align="center" border="1" width="90%">
							<c:forEach var="systemProperty" items="${ucPrintObject.propertyListForSystem}">
							<c:if test="${x=='0'}">
								<tr  style="background-color:#F0F0F0; color: black;"><td colspan="2"><h5>Properties</h5></td>
								<c:set var="x" value="1" />
							</c:if>
							<tr>
								<td>${systemProperty.propertyName}</td><td>${systemProperty.propertyValue}</td>
							</tr>
							</c:forEach>
						</table>
					</dd>
				</dl>
	</dd>
	<dd>
		<!-- Component Diagram Start -->
		<table border="0" cellpadding="0" cellspacing="0" width="50%">
			
				<c:forEach items="${ucPrintObject.componentDiagramRowList}" var="row" >
					<tr>
				<c:forEach items="${row}" var="col" >
								<c:if test="${col.ucObjectEnum=='customer'  or col.ucObjectEnum=='system' or col.ucObjectEnum=='ifCondition' or col.ucObjectEnum=='sequenceSection'}">						
								<td id="td_SYSTEM${col.ucSeqDiagram.rowNo}" align=center valign="top"  height="50" width="75" ${col.htmlStr} >
									<table id="table_SYSTEM${col.ucSeqDiagram.rowNo}" align="center" height="100%" width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td valign="bottom" align="center" class="${modelUc.class}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}">
												<img src="${col.imageName}" />
	 
											</td>
										</tr>
										
									</table>
								</td>							
								</c:if>
								<c:if test="${col.ucObjectEnum!='customer'  and col.ucObjectEnum!='system' and col.ucObjectEnum!='ifCondition' and col.ucObjectEnum!='sequenceSection'}">						
										${col.htmlStr}	
								</c:if>
					
						</c:forEach>
					</tr>			
			</c:forEach>
		</table>
		<!-- Component Diagram END -->	
	</dd>
	<dd>
		<dl>
		<!-- Start Operation-->
		<c:forEach var="ucPrintSubObject" items="${ucPrintObject.ucPrintSubObjectList}"  >
			<c:if test="${ucPrintSubObject.ucRequestMst.requestName!=null}">
			<dt><h3>Operation : ${ucPrintSubObject.ucRequestMst.requestName} </h3></dt>
				<dd>${ucPrintSubObject.ucRequestMst.description}
				<br/><br/>
					<c:set var="x" value="0" />
								<table align="center" border="1" width="90%">
									<c:forEach var="requestProperty" items="${ucPrintSubObject.propertyListForRequest}"  >
										<c:if test="${x=='0'}">
											<tr  style="background-color:#F0F0F0; color: black;"><td colspan="2"><h5>Properties</h5></td>
											<c:set var="x" value="1" />
										</c:if>
										<tr><td>${requestProperty.propertyName}</td><td>${requestProperty.propertyValue}</td></tr>
									</c:forEach>
								</table>
							<br/>
<!--							<dt><h4>${ucPrintSubObject.ucRequestMst.requestName}  behavioral variations</h4></dt>-->

									<c:set var="x" value="0" />
									<c:forEach var="uniqueRequstObjectMapByUniqueId" items="${ucPrintSubObject.uniqueRequstObjectMapByUniqueId}"  >
									
										<table align="center" border="1" width="90%">
											
											
												<c:forEach var="parentMapBySeqItemId" items="${uniqueRequstObjectMapByUniqueId.value.parentMapBySeqItemId}"  >
													<c:if test="${x=='0'}">
															<tr  style="background-color:#E8E8E8; color: black;"><td width="20%"><h5>Consumers</h5></td><td width="80%"><h5>Follow-on sequence interactions</h5></td></tr>
															<c:set var="x" value="1" />
													</c:if>
													<tr>
														<td width="20%">${parentMapBySeqItemId.value.systemName}</td>
														<td width="80%">
															<table>
																<c:forEach var="sequenceOfCalls" items="${uniqueRequstObjectMapByUniqueId.value.sequenceOfCalls}"  >
																<tr><td>${sequenceOfCalls.key} : ${uniqueRequstObjectMapByUniqueId.value.currentUcSeqDiagram.systemName} -> ${sequenceOfCalls.value.request} -> ${sequenceOfCalls.value.systemName}</td></tr>
																</c:forEach>	
																<c:if test="${fn:length(uniqueRequstObjectMapByUniqueId.value.sequenceOfCalls) eq 0}">
																
																	<tr><td>No follow-on sequence interactions </td></tr>
																</c:if>
															</table>
														</td>
													</tr>
												</c:forEach>	
										</table>
										<!--
										<table align="center" border="1" width="70%">
											<tr><td colspan="2"><h5>Action sequence : No follow on interactions due to this request</h5></td></tr>
												<c:forEach var="sequenceOfCalls" items="${uniqueRequstObjectMapByUniqueId.value.sequenceOfCalls}"  >
													<tr><td>${sequenceOfCalls.key} : ${sequenceOfCalls.value.systemName}</td></tr>
												</c:forEach>	
										</table>
									-->
									</c:forEach>
					
					</dd>
				</c:if>
			</c:forEach>
		<!-- END Operation-->	
		</dl>
	</dd>
	<dd>

	</dd>
</dl>

	<hr>
</c:forEach>
</td></tr>
</table>
</div>
</td></tr>
</table>
</body>
</html>