<%@ include file="include.jsp"%>
	<div id="response_prop_menu">
	<table border="0" cellpadding="0" cellspacing="0">
		<tbody>
		<c:if test="${modelUc.showEditLink!=null and modelUc.showEditLink=='true'}">
		  <tr onMouseOver="this.bgColor='#99CCFF';" 
				onMouseOut="this.bgColor='#F6F6F6';"
				onClick="JavaScript:editProperties('edit_properties_action_param',${modelUc.seqMstId},'${modelUc.seqItemId}','${modelUc.systemId}','${modelUc.requestId}','${modelUc.responseId}','${modelUc.rowNo}','${modelUc.colNo}', '${modelUc.propertyFor}','${modelUc.requestName}','${modelUc.responseName}','${modelUc.systemName}', '${modelUc.CONTEXT_PATH}/EditSeqSecDesc.htm','${modelUc.systemType}','${modelUc.sequenceVersion}','${modelUc.sysSeqId}')">
				<td id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b>Edit Information</b></td>
			</tr>
		</c:if>	
		
			<c:if test="${modelUc.description!=null and modelUc.description!=''}">
					    <tr>
				<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">--------------------------------- description ---------------------------------</td>
			</tr>	
		  <tr>
				<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
					<textarea maxlength="3900" name="descTA" id="descTA" cols="60" rows="6">${modelUc.description}</textarea></td>
			</tr>			
			</c:if>
			<!-- 
			<c:if test="${modelUc.description==null or modelUc.description==''}">
		  <tr>
				<td id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">No description found</td>
			</tr>			
			</c:if>
			 -->
		</tbody>
	</table>
</div>