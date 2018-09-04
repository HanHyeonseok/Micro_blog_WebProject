<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/include/header.jsp"%>
   
<%
List<MemberDto> memberall = (List<MemberDto>)request.getAttribute("uesrList");
MemberDto usermem = (MemberDto)session.getAttribute("login");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>user info</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">id</th>
      <th scope="col">name</th>
      <th scope="col">email</th>
      <th scope="col">phone</th>
      <th scope="col">address</th>
    </tr>
  </thead>
  <tbody>
  <%
  if(memberall == null || memberall.size() == 0){
  %>
  <tr>
  	<td colspan="6">작성된 글이 없습니다</td>
  </tr>
  <%
  }
  for(int i = 0; i<memberall.size(); i++){
	  MemberDto memdto = memberall.get(i);
  %>
 	<tr>
      <th scope="row"><%=i+1 %></th>
      <td><%=memdto.getId() %></td>
      <td><%=memdto.getName() %></td>
      <td><%=memdto.getEmail() %></td>
      <td><%=memdto.getPhone() %></td>
      <th><%=memdto.getAddress() %></th>
    </tr>
  
    
  <%
  }
  %>
  </tbody>
</table>
<br><br><br>
</body>   

</html>
<%@ include file="/WEB-INF/include/footer.jsp"%>