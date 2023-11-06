<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--Exercise 1, Part A  --%>
<% for (i = 1; i <= 10; i++){%>

	<% if (i == 10) {
	
		out.print(i);
	
		} else {
		
			out.print(i + ", ");
		
		} %>
		
		<%}%>
		
		</body>
		
		</html>
	
		
<%--Exercise 1, Part B  --%>
<html>

<body>
<%for (int i = 1; i <= 10; i++){%>

	if (i == 10) {
	
		out.print(i * i);
	
		} else {
		
			out.print(i * i + ", ");
		
		} %>
		
		<%}%>
		
</body>
		
</html>

<%--Exercise 1, Part C  --%>
<html>

<body>

<%! int sum = 0 %>

<%for (int i = 1; i <= 10; i++){%>

	<%sum = sum + (i * i); %>
	
	<%for (int i = 1; i < 10; i++){ %>
	
	<p>
	
	</p>

	if (i == 10) {
	
		out.print(i * i);
	
		} else {
		
			out.print(i * i + ", ");
		
		} %>
		
		<%}%>
		
</body>
		
</html>

<%--Exercise 1, Part D  --%>
<html>

<body>

<%! int sum = 0 %>

<%for (int i = 1; i <= 10; i++){%>

	<%sum = sum + (i * i); %>
	
	<%for (int i = 1; i < 10; i++){ %>
	
	<%if (i % 2 == 0){ %>
	
	<p style= "color:yellow;">
	
	<%}else %>
	
		<p style= "color:green;">
		
		
	<%}%>
	
	<% sum += i * i;%>
	
	<%=sum%>
	
	</p>
	
	<%}%>
		
</body>
		
</html>