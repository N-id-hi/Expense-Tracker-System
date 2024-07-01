<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Expense</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Expense Tracking System!</font>
<FORM action="insert.jsp" method="get">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >
<TR>
<TH width="50%">Expense Type:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="exp_type"></TD>
</tr>
<TR>
<TH width="50%">Expense:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="exp"></TD>
</tr>
<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
</tr>
</TABLE>
<%
int uq = 0;
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ETS?characterEncoding=latin1", "root", "tiger");
    PreparedStatement pstatement = con.prepareStatement("INSERT INTO expense (exp_type, exp) VALUES (?, ?)");
    pstatement.setString(1, request.getParameter("exp_type"));
    pstatement.setString(2, request.getParameter("exp"));
    uq = pstatement.executeUpdate();
    pstatement.close();
    con.close();
} catch(Exception ex) {
    // Handle exception
}
if (uq != 0) {
%>
<br>
<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
<tr><th>Expense is inserted successfully in database.</th></tr>
</table>
<%
} 
%> 
</form> 
</body>
</html>
