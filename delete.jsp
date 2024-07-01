<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Expense</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Expense Tracking System!</font>
<FORM action="delete.jsp" method="get">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >
<TR>
<TH width="50%">Expense ID:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="exp_id"></TD>
</tr>
<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
</tr>
</TABLE> 
<%
String exp_id = request.getParameter("exp_id");
int i = 0;
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ETS?characterEncoding=latin1", "root", "tiger");
    Statement st = conn.createStatement();
    i = st.executeUpdate("DELETE FROM expense WHERE exp_id=" + exp_id);
    conn.close();
    st.close();
} catch(Exception e) {
    // Handle exception
}
if (i != 0) {
%>
<br>
<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
<tr><th>Expense is deleted successfully from database.</th></tr>
</TABLE>
<%
} 
%>        
</FORM>    
</body>
</html>
