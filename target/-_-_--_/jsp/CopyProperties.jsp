<%@ include file="include.jsp"%>

<textarea maxlength="3900" name="descriptionTA" id="descriptionTA" cols="100" rows="4">${modelUc.description}</textarea>
<textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="100" rows="4">${modelUc.sample}</textarea>
<textarea maxlength="3900" name="sampleFailureTA" id="sampleFailureTA" cols="100" rows="4">${modelUc.sampleFailure}</textarea>
<input id="imageUrl" name="imageUrl" type="text" size="100" maxlength="1900" value="${modelUc.imageUrl}" />
<input id="failureImageUrl" name="failureImageUrl" type="text" size="100" maxlength="1900" value="${modelUc.failureImageUrl}" />

			<c:forEach items="${modelUc.ucSeqDiagramPropertyList}" var="ucSeqDiagramProperty" varStatus="status" begin="0" end="${modelUc.numberOfPropertiesAllowed}">
	         			<input id="propertyIdName${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdName${ucSeqDiagramProperty.propertyId}" type="text" size="30" maxlength="100" value="${ucSeqDiagramProperty.propertyName}" />
	            		<input id="propertyIdValue${ucSeqDiagramProperty.propertyIdNo}" name="propertyIdValue${ucSeqDiagramProperty.propertyId}" type="text" size="80" maxlength="4000"  value="${ucSeqDiagramProperty.propertyValue}" />

			</c:forEach>

