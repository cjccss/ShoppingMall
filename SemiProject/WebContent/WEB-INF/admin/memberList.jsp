<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>

<jsp:include page="../header4.jsp"/>

<style type="text/css">
	div.container {		
		margin: 80px auto;		
	}
	
	h2 {				
		text-align: center;		
		font-size: 30pt; 
		font-family: 'Papyrus', Fantasy; 		
		margin: 20px auto;
	}	
	
	tr.memberInfo:hover {
		background-color: #f0f5f5;
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		if("${fn:trim(requestScope.searchWord)}" != ""){
			$("select#searchType").val("${requestScope.searchType}");
			$("input#searchWord").val("${requestScope.searchWord}");
		}			
		
		// *** select 태그에 대한 이벤트는  click 이 아니라 change 이다. *** //
		$("select#sizePerPage").bind("change", function(){
			goSearch();						
		});
		
		if("${requestScope.sizePerPage}" != ""){ // 처음에 회원목록을 클릭하면 기본값 X
			$("select#sizePerPage").val("${requestScope.sizePerPage}")
		}
		
		// 검색어에 엔터를 치면 검색이 되어지도록 한다.
		$("input#searchWord").bind("keyup",function(event){
			if(event.keyCode==13){
				goSearch();
			}
		});
		
		// 특정 회원을 클릭하면 그 회원의 상세정보를 보여주도록 한다.
		$("tr.memberInfo").click(function(){		
			var userid = $(this).children(".userid").text();		
			location.href="<%= ctxPath%>/admin/memberOneDetail.up?userid="+userid+"&goBackURL=${requestScope.goBackURL}";
		});
		
	});// end of $(document).ready(function(){})--------------------
	
	
	// Function declaration
	function goSearch(){
		var frm = document.memberFrm;
		frm.action = "<%= ctxPath%>/admin/memberList.up";
		frm.method = "GET";
		frm.submit();		
	}// end of function goSearch(){}--------------------
</script>
<div class="container">
	<h2>Member Management</h2>

	<div align="right">
		<form name="memberFrm">
			<select id="searchType" name="searchType">
				<option value="name">회원명</option>
				<option value="userid">아이디</option>
				<option value="email">이메일</option>
			</select>
			<input type="text" id="searchWord" name="searchWord" />			
			<input type="text" style="display: none;">		
			<button type="button" onclick="goSearch();" >검색</button>				
		</form>
	</div>
	<table id="memberTbl" class="table table-bordered" style="margin-top: 40px;">
		<thead>
			<tr>
				<th>아이디</th>
				<th>회원명</th>
				<th>이메일</th>
				<th>성별</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="mvo" items="${requestScope.memberList}">
				<tr class="memberInfo">
					<td class="userid">${mvo.userid}</td>
					<td>${mvo.name}</td>
					<td>${mvo.email}</td>
					<td>
						<c:choose>
							<c:when test="${mvo.gender eq 1}">
								남
							</c:when>
							<c:otherwise>
								여
							</c:otherwise>
						</c:choose>						
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div align="center" style="font-size: 13pt;">
		${requestScope.pageBar}
	</div>
</div>	
<jsp:include page="../footer.jsp"/>