<%@ include file="header_for_seqdet.jsp"%>
    <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
<title>Sequence List</title>
</head>
<body>

<style>

.bubble{
    background-color: green;
    border-radius: 5px;
    box-shadow: 0px 0px 6px #B2B2B2;
    height: 20px;
    margin:30px 0 0 750px;
	font: 16px/25px sans-serif; 
	color : yellow;
	text-align: center;
}
.tooltip {
    text-decoration:none;
    position:relative;
}
.tooltip span {
    display:none;
}
.tooltip:hover span {
    display:block;
    position:fixed;
    overflow:hidden;
    background-color:yellow;
    font-family:Arial;
 font-size:8pt;
}
.button {
  font: bold 11px Arial;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 2px 6px 2px 6px;
  border-top: 1px solid #CCCCCC;
  border-right: 1px solid #333333;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #CCCCCC;
}

.buttonSystem {
  font: bold 11px Arial;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 10px 60px 10px 60px;
  border-top: 1px solid #CCCCCC;
  border-right: 1px solid #333333;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #CCCCCC;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#tool_tip").hide();

	$("#tool_tip")
	.fadeIn(9000);
	
	var tooltips = document.querySelectorAll('.tooltip span');

	window.onmousemove = function (e) {
	    var x = (e.clientX + 20) + 'px',
	        y = (e.clientY + 20) + 'px';
	    for (var i = 0; i < tooltips.length; i++) {
	        tooltips[i].style.top = y;
	        tooltips[i].style.left = x;
	    }
	};

});

function updateSeqMst( user_request_action_param, social_network_param, seq_mst_id_param,sequenceVersion_param, url) { 

$("#img_"+seq_mst_id_param).attr('src',"images/secure-link-image.png");
$("#img_"+seq_mst_id_param).attr('title',"Secure your shared link");
$("#img_"+seq_mst_id_param).attr('alt',"Secure your shared link");

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					social_network_param:social_network_param,
					sequenceVersion:sequenceVersion_param
				},
				function(data,status){
					
				});
	}
</script>

<div id="container">
<div id="banner">


</div> 
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

<!--<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;height:100px ">-->
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/ViewSequenceList.htm?user_request_action_param=default_action_param&sequenceSaveError=${modelUc.sequenceSaveError}&buyEnterpriseVersionLink=${modelUc.buyEnterpriseVersionLink}&displayUpgradeProductLink=${modelUc.displayUpgradeProductLink}"/>
</c:if>
<c:if test="${modelUc.toolTip=='CREATE_SEQUENCE_TIP'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Enter name of the sequence & click the create sequence button, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='FIRST_SEQUENCE_SAVE'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on the sequence name to get started, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='ADD_SEQUENCE_DESC'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on   <img id="img1"  src="images/yellow_+_button.png"/>   to add description to the sequence</div>
</c:if>

		<table align="center">
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
		<tr><td>
		
        </td>
		</tr>
        <tr><td>
		<c:set var="x" value="0" />
        	<table align="center" width="900">
        
        	<c:if test="${modelUc.ucSeqDiagramDraftList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSeqDiagramDraftList}' var="seqMst">
         		
	         		<c:set var="changed" value="false" />
	         		<c:if test="${x=='0' && changed=='false'}">
	        		<tr style="background-color: #F0F0F0; color: black;">
	        			
						<td style="padding-left:${seqMst.colNo}em">
						rowNo : ${seqMst.rowNo}, colNo : ${seqMst.colNo}, systemName : ${seqMst.systemName}, requestName : ${seqMst.request}, responseName : ${seqMst.response} , systemType : ${seqMst.systemType} 
	
						</td>
						
						<c:set var="changed" value="true" />
						<c:set var="x" value="1" />
	        		</tr>
	        		</c:if>
	
	         		<c:if test="${x=='1' && changed=='false'}">
	        		<tr style="background-color:#E8E8E8; color: black;">
	        			<td style="padding-left:${seqMst.colNo}em">
						rowNo : ${seqMst.rowNo}, colNo : ${seqMst.colNo}, systemName : ${seqMst.systemName}, requestName : ${seqMst.request}, responseName : ${seqMst.response} , systemType : ${seqMst.systemType}
	
						</td>
						<c:set var="x" value="0" />
						
	        		</tr>
	        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		
        		<table align="center" width="900">
        			<tr style="background-color: #F0F0F0; color: black;">
	        			<td style="padding-left:${seqMst.colNo}em">
	        			&nbsp;
	        			</td>
	        		</tr>
					<tr style="background-color: #F0F0F0; color: black;">
	        			<td style="padding-left:${seqMst.colNo}em">
	        			&nbsp;
	        			</td>
	        		</tr>	
        	<c:if test="${modelUc.auditUcSeqDiagramDraftList[0]!=null}">
        		
         		<c:forEach items='${modelUc.auditUcSeqDiagramDraftList}' var="seqMst">
         		
	         		<c:set var="changed" value="false" />
	         		<c:if test="${x=='0' && changed=='false'}">
	        		<tr style="background-color: #F0F0F0; color: black;">
	        			
						<td style="padding-left:${seqMst.colNo}em">
						id: ${seqMst.id}, operation: ${seqMst.operation}, rowNo : ${seqMst.rowNo}, colNo : ${seqMst.colNo}, systemName : ${seqMst.systemName}, requestName : ${seqMst.request}, responseName : ${seqMst.response} , systemType : ${seqMst.systemType}, error : ${seqMst.error} 
	
						</td>
						
						<c:set var="changed" value="true" />
						<c:set var="x" value="1" />
	        		</tr>
	        		</c:if>
	
	         		<c:if test="${x=='1' && changed=='false'}">
	        		<tr style="background-color:#E8E8E8; color: black;">
	        			<td style="padding-left:${seqMst.colNo}em">
						id: ${seqMst.id}, operation: ${seqMst.operation}, rowNo : ${seqMst.rowNo}, colNo : ${seqMst.colNo}, systemName : ${seqMst.systemName}, requestName : ${seqMst.request}, responseName : ${seqMst.response} , systemType : ${seqMst.systemType}, error : ${seqMst.error}
	
						</td>
						<c:set var="x" value="0" />
						
	        		</tr>
	        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		
       </td>
       </tr> 
	</table>
	<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
