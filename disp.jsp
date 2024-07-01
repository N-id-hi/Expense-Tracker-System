<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Expense</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Expense Tracking System!</font>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ETS?characterEncoding=latin1", "root", "tiger");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM expense");
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr><th>Expense ID</th><th>Expense Type</th><th>Expense</th></tr>
<%
    while (rs.next()) {
%>
<tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
</tr>
<%
    }
    rs.close();
    st.close();
    con.close();
} catch (Exception ex) {
%>
<%
}
%>
</TABLE>
</body>
</html>
