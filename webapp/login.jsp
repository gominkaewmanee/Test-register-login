<%@page import ="java.sql.*" pageEncoding = "UTF8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=" stylesheet"
              href ="css/bootstrap.css">
        <style>
            .btn-primary {
                width: 180px;
            }
            .background{
                background: lightgreen;
            }
        </style>
    </head>
    
    <body class="background">
        <div class="container"><br>            
            <form method="post">
                <center>
                    <table width ="400">
                        <h1 align="center">LOG IN</h1>
                        <tr>
                            <td>Email</td>
                            <td><input name="email"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input name="password" type="password"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button class="btn-primary">log In</button></td>
                        </tr>
                    </table>
                </center>
            </form>

<%
    String e = request.getParameter("email");
    String p = request.getParameter("password");
    if(e != null && p != null){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://35.240.202.99/test?user=gomin&password=1486";
            Connection cn = DriverManager.getConnection(url);
            String sql = "select * from member where email = ? and password = sha2(?,512)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, e); 
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();
            boolean ok = rs.next();
            if(ok){
                String name = rs.getString("name");
                session.setAttribute("user", name);
                response.sendRedirect("profile");
            }else{
                out.print("<br><center><h5>Invalid Email or password.</h5></center>");
            }
            rs.close(); ps.close(); cn.close();
            response.sendRedirect("login");
        }catch (Exception x){
            out.print("<br><center><h5>No Email.</h5></center>");
            }
        }
        session.setAttribute("email","");
%>
        </div>
    </body>
</html>