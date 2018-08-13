<%@page import ="java.sql.*" pageEncoding = "UTF8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
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
                        <h1 align="center">REGISTER</h1>
                        <tr>
                            <td>Email</td>
                            <td><input name ="email" placeholder="Your Email" autofocus></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input name ="password" placeholder="Your Password" type="password"></td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td><input name ="name" placeholder="Your Name" ></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button class="btn-primary">Register</button></td>
                        </tr>
                    </table>
                </center>
            </form>
        
<%
  String e = request.getParameter("email");
  String p = request.getParameter("password");
  String f = request.getParameter("name");
  if(e != null && p != null && f != null){
        if(!e.equals("") && !p.equals("") && !f.equals("")){
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://35.240.202.99/test?user=gomin&password=1486";
                Connection cn = DriverManager.getConnection(url);
                String sql = "insert into member(email,password,name) values(?, sha2(?,512),?)";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, e); 
                ps.setString(2, p); 
                ps.setString(3, f);
                ps.execute();
                ps.close(); cn.close();
                response.sendRedirect("login");
            }catch (Exception x){
                out.print("<br><center><h5>Dupilcated email.</h5></center>");   
            }
        }else if(e.equals("") || p.equals("") || f.equals("")){
            out.print("<br><center><h5>Fill in not complete.</h5></center>");
        }
    }
%>
        </div>
    </body>
</html>