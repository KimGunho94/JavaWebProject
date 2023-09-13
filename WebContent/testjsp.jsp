<%@page import="dao.PageTotal"%>
<%@page import="dto.FandaDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<%@ page import="java.sql.*" %>
<%
	int pageNum = (int)request.getAttribute("pageNum");
	int totalPage = (int)request.getAttribute("pageTotal");
	ArrayList<FandaDto> signUpList = (ArrayList<FandaDto>)request.getAttribute("fandaList");
	int idx;
	try{
		idx = (int)session.getAttribute("idx");
	}catch(Exception e){
		idx = 0;
	}	
%>      

	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/fanda.css">
<link rel="stylesheet" href="resources/css/header_footer.css">
<script src="resources/js/jquery-3.7.0.min.js"></script>
<script src="resources/js/Stubby.js"></script>
<script type="text/javascript" src="resources/js/header_footer.js"></script>
</head>
	<body>
		<div id="customer_box">
			<div class="customer_img">
			<div class="customer_main_title">고객지원</div>
			<div class="customer_sub_title">자주하는질문</div>
             <div style="clear:both"></div>
			</div>
		
        
        <div class="customer_nav_box">
	       	<ul class="customer_nav">
	        	<li><button class="goNotice ">공지사항</button></li>
	        	<li><button class="goFanda action">자주하는 질문</button></li>
	        	<li><button class="goQanda ">문의하기</button></li>
	       	</ul>
	         <div style="clear:both"></div>
        </div>
        
        <a href="#top" id="top_go" class="scroll_top" style="display:none"><i></i></a>
         <div style="clear:both"></div>
        
        <div class="category_box">
	        <ul>
		        <li><button id = "signup" class="active" >회원가입</button></li>
		        <li><button id = "diary" class="">여행기 작성</button></li>
		        <li><button id = "plan" class="">여행 일정 작성</button></li>
		        <li><button id = "except" class="">기타</button></li>
	        </ul>
	         <div style="clear:both"></div>
  		</div>
        
        
      <div id = "fanda_signup" class="show" >
        <%
	     for(int i = 0; i < signUpList.size(); i++){
        %>
	        <div id = "<%=signUpList.get(i).getFno()%>"class="fanda_main_box">
	        	<div class="fanda_title_box">
	        	<div class="fanda_icon_q fl"><img src="resources/images/Qicon.png"></div>
	        	<div class="fanda_title fl"><%=signUpList.get(i).getFa()%></div>
	        	<div class="fanda_ud_icon fr"></div>
	         	<div style="clear:both"></div>
	        	</div>
	        	
	         	<div class="fanda_content_box" style="display:none">
	         		<div class="fanda_icon_a fl"><img src="resources/images/Aicon.png"></div>
	    <% 
	    	if(idx == 1){
	    %>
	         		<div class="fanda_content_btn_box fr">
	         			<span class="fanda_menu_btn fr"></span>
		         		<div class="fanda_content_btn fl">
		         			<button id = "<%=signUpList.get(i).getFno()%>" class="fanda_update">수정</button>
		         			<button id = "<%=signUpList.get(i).getFno()%>" class="fanda_delete">삭제</button>
		         		</div>
	         		</div>
	   <%
	    	}
	   %>
	         		<div class="fanda_content"><%=signUpList.get(i).getFq()%></div>
	         	</div>
	        </div>
	         	<div style="clear:both"></div>
	        <%}; %>
	   </div>
	   	
	   	<%
	   	if(idx == 1){
	   	%>	
	   	<div class="write_btn">
			<button class="fanda_write" onclick="location.href='fanda_write.jsp'">글쓰기</button>
		</div>
		<%
	   	}
		%>
		     <div class="page_btn">
		         	<div class="fl"><a href="Controller?command=fanda_signup_list"><img src="resources/images/double_left.png"/></a></div>
		         	<%if(pageNum == 1){%>
		         	<div class="fl"><a href="Controller?command=fanda_signup_list"><img src="resources/images/left_page.png"/></a></div>
		         	<% 
		         	}else{%>
		         	<div class="fl"><a href="Controller?command=fanda_signup_list&pageNum=<%=pageNum-1%>"><img src="resources/images/left_page.png"/></a></div>
				    <% };
				    for(int i = 1; i <= totalPage; i++){
						if(i == pageNum){
					%>
					<span><%=i%></span>
					<%
						}else{
					%>
					<a href= "Controller?command=fanda_signup_list&pageNum=<%=i%>"><%=i%></a>	
					<%
						}
				    };
				    if(pageNum == totalPage){%>
		         	<div class="fl"><a href="Controller?command=fanda_signup_list&pageNum=<%=pageNum%>"><img src="resources/images/right_page.png"/></a></div>
				   	<%}else{%>
		         	<div class="fl"><a href="Controller?command=fanda_signup_list&pageNum=<%=pageNum+1%>"><img src="resources/images/right_page.png"/></a></div>
		         	<%}; %>
		         	<div class="fl"><a href="Controller?command=fanda_signup_list&pageNum=<%=totalPage%>"><img src="resources/images/double_right.png"/></a></div>
			        <div style="clear:both"></div>
		      </div>
		 <div style="clear:both"></div>
		</div> 
</body>
</html>