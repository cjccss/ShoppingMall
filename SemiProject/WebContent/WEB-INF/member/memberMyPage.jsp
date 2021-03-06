<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
    
<%
    String ctxPath = request.getContextPath();

%>
   
   
<jsp:include page="../header4.jsp" />  
    

<style type="text/css">
 

 
h2{
	clear: right;
	padding: 200px 40px 0 0;
	color: #000;
	font-size: 30px;
	text-align: center;
	font-family: Georgia;
}
p{
	padding: 0 40px 70px 0;
    color: #a7a7a7;
    font-size: 16px;
    text-align: center;	
}

 
.button_base {
	margin-right: 13px;
    border: 0;
    font-size: 18px;
    position: relative;
    width: 200px;
    height: 45px;
    text-align: center;
    box-sizing: border-box;
    display: inline-block;
    left: 21%;
    margin-bottom: 40px;
}


.button_base:hover {
    cursor: pointer;
}

/* ### ### ### 01 */
.b01 {
    color: #9FA7B6;
    border: #CBCBCB solid 2px;
    padding: 8px;
    background-color: #ffffff;
}

.b01:hover {
    color: #ffffff;
    background-color: #CBCBCB;
}

div.personalInfo{
	padding: 30px;
/* 	border: solid 2px #9FA7B6; */
	width: 650px;
	position: relative;
    left: 21%;
     background-color: #F1F3F4; 
     margin-bottom: 150px;
    

	
}

span.input{
	font-weight: bold;
}

dfn {
 /*  background: rgba(0,0,0,0.2); */
  border-bottom: dashed 1px rgba(0,0,0,0.8);
  padding: 0 0.4em;
  /* cursor: help; */
  position: relative;
  
}
dfn::after {
  content: attr(data-info);
  display: inline;
  position: absolute;
  top: 22px; left: 0;
  opacity: 0;
  width: 230px;
  font-size: 13px;
  font-weight: 700;
  line-height: 1.5em;
  padding: 0.5em 0.8em;
  background: rgba(0,0,0,0.8);
  color: #fff;
  pointer-events: none; /* This prevents the box from apearing when hovered. */
  transition: opacity 250ms, top 250ms;
}
dfn::before {
  content: '';
  display: block;
  position: absolute;
  top: 12px; left: 20px;
  opacity: 0;
  width: 0; height: 0;
  border: solid transparent 5px;
  border-bottom-color: rgba(0,0,0,0.8);
  transition: opacity 250ms, top 250ms;
}
dfn:hover {z-index: 2;} /* Keeps the info boxes on top of other elements */
dfn:hover::after,
dfn:hover::before {opacity: 1;}
dfn:hover::after {top: 30px;}
dfn:hover::before {top: 20px;}

 
 </style>   
 <script type="text/javascript">
 $(function(){
	 
	 $("div#orderList").bind("click", function(){
		 location.href= "<%= ctxPath%>/order/orderList.up";
	 });
	 $("div#myInfo").bind("click", function(){
		 location.href= "<%= ctxPath%>/member/memberEdit.up?userid=${sessionScope.loginuser.userid}";
	 });
	 $("div#coupon").bind("click", function(){
		 location.href= "<%= ctxPath%>/member/showMyReview.up";
	 });
	 
 });

 
 
 </script>
 


<div class="container">
	<h2>MY PAGE</h2>
	<p>??????????????? RHOME??? ?????????????????? ???????????????. <br><span style="font-weight: bold; color: black;">${(sessionScope.loginuser).name}</span>?????? ??????????????? ?????????.</p>
	     <div class="button_base b01" id="orderList">
	     	ORDER LIST
	     </div>
	     <div class="button_base b01" id="myInfo">
	     	MY INFO
	     </div>
	     <div class="button_base b01" id="coupon">
	     	REVIEW LIST
	     </div>
	     
	     <div class="personalInfo">
	     	<div><span class="input">${(sessionScope.loginuser).name}</span>?????? <span class="input" >[????????????]</span>????????????.</div>
	     	<br>
	     	<div>POINT :&nbsp;&nbsp;&nbsp;&nbsp;<span class="input" id="point"><fmt:formatNumber value="${(sessionScope.loginuser).point}" pattern="###,###" /></span></div>
	     	<div>???????????? &nbsp;<dfn data-info="???????????? '????????????'??? ????????????  ??????????????????!"><a href="<%= ctxPath%>/order/cartController.up" style="color: black;">????????????</a></dfn> ?????????&nbsp;<span class="input" id="point">${requestScope.cartCount}</span>&nbsp;?????? ????????? ???????????????.</div>
	     </div> 
		       
		
</div>
<jsp:include page="../footer.jsp" />  