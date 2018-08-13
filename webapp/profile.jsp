<%@page import="java.text.DecimalFormat"%>
<%@page pageEncoding="UTF8" %>
<%
    Object o = session.getAttribute("user");
    if(o == null)
    response.sendRedirect("login");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Calculate speed</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=" stylesheet"
              href ="css/bootstrap.css">
        <style>
            .btn-primary {
                color: black;
                background: lightblue;
                border-color: black;
                width: 180px;
                border-radius: 20px
            }
            .background{
                background: lightgreen;
            }
            

        </style>
    </head>
    <body class="background">
        <br>
        <div class="container">
            <form method="post">
            <table width ="500">
                <h1>คำนวณความเร็วรถยนต์ เกียร์ธรรมดา ขับเคลื่อน 2 ล้อ</h1>
            <tr>
                <td>ความเร็วรอบที่ทดสอบ</td>
                <td><input name = "rpm" placeholder="รอบต่อนาที"></td>
            </tr>
                  
            <tr><td>อัตราทดเกียร์</td>
                <td><input name = "gear" placeholder="ดูจากข้อมูลของผู้ผลิต"></td>
            </tr>
                  
            <tr><td>อัตราทดเฟืองท้าย</td>
                <td><input name = "fgear" placeholder="ดูจากข้อมูลของผู้ผลิต"></td>
            </tr>
                  
            <tr>
                <td><br><B>ขนาดของยาง (เช่น 195/50R15)</B></td>
            <tr>
                <td>ความกว้าง</td>
                <td><input name = "width" placeholder="195"></td>
            </tr>

            <tr><td>ซีรี่ย์</td>  
                <td><input name = "series" placeholder="50"></td>
            </tr>
                  
            <tr><td>ขอบของยาง</td>  
                <td><input name = "wheel" placeholder="15"></td>
            </tr>

            <tr><td></td>
                <td><button class="btn-primary">คำนวณ</button></td>
            </tr>
            </table>
            </form>
            <%
                String rpm = request.getParameter("rpm");
                String gear = request.getParameter("gear");
                String fgear = request.getParameter("fgear");
                String width = request.getParameter("width");
                String series = request.getParameter("series");
                String wheel = request.getParameter("wheel");
                DecimalFormat df = new DecimalFormat("0.00");
                if((rpm != null)&&(gear != null)&&(fgear != null)&&(width != null)&&(series != null)&&(wheel != null)){
                    try{
                    double Drpm = Double.valueOf(rpm);
                    double Dgear = Double.valueOf(gear);
                    double Dfgear = Double.valueOf(fgear);
                    double Dwidth = Double.valueOf(width);
                    double Dseries = Double.valueOf(series);
                    double Dwheel = Double.valueOf(wheel);
                    double girth = (3.14*((Dwidth*Dseries/100*2)+(Dwheel*25.4)))*0.001;
                    double speed = ((Drpm*60*girth)/(1000*Dgear*Dfgear));
                    String speedShow = df.format(speed);
                    out.print("<tr><td><br><h4>ความเร็วที่คำนวณได้ " +speedShow + "  กิโลเมตรต่อชั่วโมง </h4></td>");
                    }catch(Exception e){
                        out.print("กรุณากรอกข้อมูลให้ถูกต้อง");
                    }
                }
            %>    
        </div>
    </body>
</html>