<%@ include file="include.jsp"%>
<<<<<<< HEAD
<div id="response_prop_menu" class="well well-lg">
    <div>
        <div>
            <c:if test="${modelUc.copyProperties!='true'}">
                <c:if test="${modelUc.userReadWriteAccess=='true'}">
                    <div class="row-c"
                        onClick="JavaScript:editProperties('edit_properties_action_param','${modelUc.ucSeqMst.seqMstId}','${modelUc.seqItemId}','${modelUc.systemId}','${modelUc.requestId}','${modelUc.responseId}','${modelUc.rowNo}','${modelUc.columnNo}', '${modelUc.propertyFor}','${modelUc.requestName}','${modelUc.responseName}','${modelUc.systemName}', '${modelUc.CONTEXT_PATH}/Properties.htm','${modelUc.systemType}','${modelUc.sequenceVersion}','${modelUc.sysSeqId}')">
                        <div class="c-clm" id="new_propName" class="${modelUc.editclass}" >
                          <div>
                            <div class="row-c">
                              <div class="c-clm"><b>Edit Information</b></div>
                            </div>
                          </div>
                        </div>
                    </div>
                </c:if>
            </c:if>
            <c:if test="${fn:containsIgnoreCase(modelUc.systemType, 'sys_seq') and modelUc.copyProperties!='true'}">
                <c:if test="${modelUc.userReadAccess=='true'}">
                    <div class="row-c">
                        <div class="c-clm" id="new_propName" class="${modelUc.editclass}" ><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/ViewInterface.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&requestId=${modelUc.requestId}&responseId=${modelUc.responseId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}&systemId=${modelUc.systemId}&propertyFor=${modelUc.propertyFor}">View Interface</a></b></div>
                    </div>
                    <div class="row-c">
                        <div class="c-clm" id="new_propName" class="${modelUc.editclass}" ><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/SeqDetA.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&for_request_id=${modelUc.forRequestId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}">View System Sequence</a></b></div>
                    </div>
                </c:if>
            </c:if>
            <c:if test="${modelUc.rowNo==1 and modelUc.columnNo==1}">
                <div class="row-c">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}" ><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/ViewInterface.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&sys_seq_id=${modelUc.ucSeqMst.sysSeqId}&requestId=${modelUc.requestId}&responseId=${modelUc.responseId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}&systemId=${modelUc.systemId}&propertyFor=${modelUc.propertyFor}">View Interface</a></b></div>
                </div>
            </c:if>
            <c:if test="${modelUc.imageUrl!=null and modelUc.imageUrl!=''}">
                <div class="panel panel-info">
                    <div class="row-c panel-heading">
                        <div class="c-clm" id="new_propName" class="${modelUc.editclass}">--------- webpage ${modelUc.propertyFor} ---------</div>
                    </div>
                    <div class="row-c panel-body">
                        <div class="c-clm" id="new_propName" class="${modelUc.editclass}"><a href="${modelUc.imageUrl}" target="_blank"><img src="${modelUc.imageUrl}" alt="Loading Image..." height="200" width="440"></a></div>
                    </div>
                </div>
            </c:if>
            <c:if test="${modelUc.failureImageUrl!=null and modelUc.failureImageUrl!=''}">
                <c:if test="${modelUc.propertyFor=='response'}">
                    <div class="panel panel-info">
                        <div class="row-c panel-heading">
                            <div class="c-clm" id="new_propName" class="${modelUc.editclass}">----- webpage failure ${modelUc.propertyFor} ----</div>
                        </div>
                        <div class="row-c panel-body">
                            <div class="c-clm" id="new_propName" class="${modelUc.editclass}"><a href="${modelUc.failureImageUrl}" target="_blank"><img src="${modelUc.failureImageUrl}" alt="Loading Image..." height="200" width="440"></a></div>
                        </div>
                    </div>
                </c:if>
            </c:if>
            <c:if test="${modelUc.description!=null and modelUc.description!=''}">
              <div class="panel panel-info">
                <div class="row-c panel-heading">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}">------------- description -------------</div>
                </div>
                <div class="row-c panel-body">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}">
                        <textarea  name="descTA" id="descTA" >${modelUc.description}</textarea>
                    </div>
                </div>
              </div>
            </c:if>
            <c:if test="${modelUc.sample!=null and modelUc.sample!=''}">
              <div class="panel panel-info">
                <div class="row-c panel-heading">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}">------------ sample message --------</div>
                </div>
                <div class="row-c panel-body">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}">
                        <textarea  name="sampleTA" id="sampleTA" >${modelUc.sample}</textarea>
                    </div>
                </div>
              </div>
            </c:if>
            <c:if test="${modelUc.sampleFailure!=null and modelUc.sampleFailure!=''}">
                <c:if test="${modelUc.propertyFor=='response'}">
                  <div class="panel panel-info">
                    <div class="row-c panel-heading">
                        <div class="c-clm" id="new_propName" class="${modelUc.editclass}">-------- sample failure message ---</div>
                    </div>
                    <div class="row-c panel-body">
                        <div class="c-clm" id="new_propName" class="${modelUc.editclass}">
                            <textarea  name="sampleTA" id="sampleFailureTA" >${modelUc.sampleFailure}</textarea>
                        </div>
                    </div>
                  </div>
                </c:if>
            </c:if>
            <c:if test="${modelUc.hostClusterName!=null and modelUc.hostClusterName!=''}">
              <div class="panel panel-info">
                <div class="row-c panel-heading">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}">------------- Host -------------</div>
                </div>
                <div class="row-c panel-body">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}">
                        <textarea  name="descTA" id="descTA" >${modelUc.hostClusterName}</textarea>
                    </div>
                </div>
              </div>
            </c:if>
            <div class="panel panel-info">
            <div class="row-c panel-heading">
            <c:if test="${modelUc.ucSeqDiagramPropertyList[0].propertyName!=null}">
                <div class="row-c">
                    <div class="c-clm" id="new_propName" class="${modelUc.editclass}"></div>
                </div>
            </c:if>
            </div>
            <div class="row-c panel-body">
            <c:set var="x" value="0" />
            <c:forEach items="${modelUc.ucSeqDiagramPropertyList}" var="prop" >
                <c:if test="${prop.propertyName!=null and prop.propertyValue!=null}">
                    <c:set var="changed" value="false" />
                    <c:if test="${x=='0' && changed=='false'}">
                        <div class="row-c" class="two-td">
                            <div class="c-clm" id="${prop.propertyId}_propName" class="${modelUc.editclass}" >${prop.propertyName}</div>
                            <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                <div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" ><textarea name="sampleTA" id="sampleTA" >${prop.propertyValue}</textarea></div>
                            </c:if>
                            <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                <div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" ><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></div>
                            </c:if>
                        </div>
                        <c:set var="changed" value="true" />
                        <c:set var="x" value="1" />
                    </c:if>
                    <c:if test="${x=='1' && changed=='false'}">
                        <c:set var="x" value="0" />
                        <div class="row-c" class="two-td">
                            <div class="c-clm" id="${prop.propertyId}_propName" class="${modelUc.editclass}" >${prop.propertyName}</div>
                            <c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
                                <div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" ><textarea  name="sampleTA" id="sampleTA" >${prop.propertyValue}</textarea></div>
                            </c:if>
                            <c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
                                <div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" ><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></div>
                            </c:if>
                        </div>
                    </c:if>
                </c:if>
            </c:forEach>
            </div>
            </div>
        </div>
    </div>
</div>
=======
	<div id="response_prop_menu">
	<div>
		<div>
			<c:if test="${modelUc.copyProperties!='true'}">
				<c:if test="${modelUc.userReadWriteAccess=='true'}">
				  <div class="row-c" onMouseOver="this.bgColor='#99CCFF';"
						onMouseOut="this.bgColor='#F6F6F6';"
						onClick="JavaScript:editProperties('edit_properties_action_param','${modelUc.ucSeqMst.seqMstId}','${modelUc.seqItemId}','${modelUc.systemId}','${modelUc.requestId}','${modelUc.responseId}','${modelUc.rowNo}','${modelUc.columnNo}', '${modelUc.propertyFor}','${modelUc.requestName}','${modelUc.responseName}','${modelUc.systemName}', '${modelUc.CONTEXT_PATH}/Properties.htm','${modelUc.systemType}','${modelUc.sequenceVersion}','${modelUc.sysSeqId}')">
						<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b>Edit Information</b></div>
					</div>
				</c:if>
			</c:if>
			<c:if test="${fn:containsIgnoreCase(modelUc.systemType, 'sys_seq') and modelUc.copyProperties!='true'}">
				<c:if test="${modelUc.userReadAccess=='true'}">
					<div class="row-c" onMouseOver="this.bgColor='#99CCFF';"
						onMouseOut="this.bgColor='#F6F6F6';">
						<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/ViewInterface.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&requestId=${modelUc.requestId}&responseId=${modelUc.responseId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}&systemId=${modelUc.systemId}&propertyFor=${modelUc.propertyFor}">View Interface</a></b></div>
					</div>

				  <div class="row-c" onMouseOver="this.bgColor='#99CCFF';"
						onMouseOut="this.bgColor='#F6F6F6';">
						<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/SeqDetA.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&for_request_id=${modelUc.forRequestId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}">View System Sequence</a></b></div>
					</div>
				</c:if>
			</c:if>
			<c:if test="${modelUc.rowNo==1 and modelUc.columnNo==1}">
				<div class="row-c" onMouseOver="this.bgColor='#99CCFF';"
					onMouseOut="this.bgColor='#F6F6F6';">
					<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" height="20" width="150" nowrap="nowrap" colspan="2"><b><a target="_blank" href="${modelUc.CONTEXT_PATH}/ViewInterface.htm?seq_mst_id_param=${modelUc.ucSeqMst.seqMstId}&sys_seq_id=${modelUc.ucSeqMst.sysSeqId}&requestId=${modelUc.requestId}&responseId=${modelUc.responseId}&sequenceVersion=UNKNOWN_${modelUc.sequenceVersion}&systemId=${modelUc.systemId}&propertyFor=${modelUc.propertyFor}">View Interface</a></b></div>
				</div>
			</c:if>
			<c:if test="${modelUc.imageUrl!=null and modelUc.imageUrl!=''}">
	  	        <div class="row-c">
				    <div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">------------------------------------------------- webpage ${modelUc.propertyFor} -------------------------------------------------</div>
			    </div>
			    <div class="row-c">
					<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2"><a href="${modelUc.imageUrl}" target="_blank"><img src="${modelUc.imageUrl}" alt="Loading Image..." height="200" width="440"></a></div>
				</div>
			</c:if>
			<c:if test="${modelUc.failureImageUrl!=null and modelUc.failureImageUrl!=''}">
				<c:if test="${modelUc.propertyFor=='response'}">
				<div class="row-c">
				    <div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">--------------------------------------------- webpage failure ${modelUc.propertyFor} --------------------------------------------</div>
			    </div>
			    <div class="row-c">
					<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2"><a href="${modelUc.failureImageUrl}" target="_blank"><img src="${modelUc.failureImageUrl}" alt="Loading Image..." height="200" width="440"></a></div>
				</div>
				</c:if>
			</c:if>

			<c:if test="${modelUc.description!=null and modelUc.description!=''}">
		    <div class="row-c">
				<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">----------------------------------------------------- description -----------------------------------------------------</div>
			</div>
		  <div class="row-c">
				<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
					<textarea maxlength="3900" name="descTA" id="descTA" cols="60" rows="6">${modelUc.description}</textarea></div>
			</div>
			</c:if>

				<c:if test="${modelUc.sample!=null and modelUc.sample!=''}">
					<div class="row-c">
						<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">---------------------------------------------------- sample message ------------------------------------------------</div>
					</div>
				    <div class="row-c">
						<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
						<textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="60" rows="6">${modelUc.sample}</textarea></div>
					</div>
				</c:if>

	            <c:if test="${modelUc.sampleFailure!=null and modelUc.sampleFailure!=''}">
	            	<c:if test="${modelUc.propertyFor=='response'}">
						<div class="row-c">
							<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">------------------------------------------------ sample failure message -------------------------------------------</div>
						</div>
					    <div class="row-c">
							<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
							<textarea maxlength="3900" name="sampleTA" id="sampleFailureTA" cols="60" rows="6">${modelUc.sampleFailure}</textarea></div>
						</div>
					</c:if>
				</c:if>
			<c:if test="${modelUc.hostClusterName!=null and modelUc.hostClusterName!=''}">
			    <div class="row-c">
					<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">----------------------------------------------------- Host -----------------------------------------------------</div>
				</div>
			    <div class="row-c">
					<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">
						<textarea maxlength="3900" name="descTA" id="descTA" cols="60" rows="6">${modelUc.hostClusterName}</textarea></div>
				</div>
			</c:if>
			<c:if test="${modelUc.ucSeqDiagramPropertyList[0].propertyName!=null}">
			<div class="row-c">
				<div class="c-clm" id="new_propName" class="${modelUc.editclass}" align="left" colspan="2">------------------------------------------------------- properties ----------------------------------------------------</div>
			</div>
			</c:if>
			<c:set var="x" value="0" />
		    <c:forEach items="${modelUc.ucSeqDiagramPropertyList}" var="prop" >
		    	<c:if test="${prop.propertyName!=null and prop.propertyValue!=null}">
		  			<c:set var="changed" value="false" />
		         	<c:if test="${x=='0' && changed=='false'}">
						<div class="row-c"  onMouseOver="this.bgColor='#99CCFF';"
							onMouseOut="this.bgColor='#85E0E0';">
							<div class="c-clm" id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</div>
							<c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
								<div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></div>
							</c:if>
							<c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
								<div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></div>
							</c:if>
						</div>
						<c:set var="changed" value="true" />
						<c:set var="x" value="1" />
					</c:if>
					<c:if test="${x=='1' && changed=='false'}">
						<c:set var="x" value="0" />
						<div class="row-c"  onMouseOver="this.bgColor='#99CCFF';"
							onMouseOut="this.bgColor='#F6F6F6';">
							<div class="c-clm" id="${prop.propertyId}_propName" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;">${prop.propertyName}</div>
							<c:if test="${not fn:startsWith(prop.propertyValue, 'http') and not fn:startsWith(prop.propertyValue, 'www')}">
								<div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><textarea maxlength="3900" name="sampleTA" id="sampleTA" cols="18" rows="1">${prop.propertyValue}</textarea></div>
							</c:if>
							<c:if test="${fn:startsWith(prop.propertyValue, 'http') or fn:startsWith(prop.propertyValue, 'www')}">
								<div class="c-clm" id="${prop.propertyId}_propVal" class="${modelUc.editclass}" align="left"  width="150" style="width:150px;word-wrap:break-word;"><a name="urlLink" id="urlLink" href="${prop.propertyValue}" target="_blank">${prop.propertyValue}</a></div>
							</c:if>

		        		</div>
		        	</c:if>
		  		</c:if>
		  </c:forEach>
		</div>
	</div>
</div>
>>>>>>> parent of a2c705f... AAA
