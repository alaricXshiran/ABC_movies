<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/adminlog.css">
        <title>WEBSITE ADMIN LOGIN</title>
        
    </head>
    <body>
            <section id="adminglog">
                <div class="card-A">
                    <div>
                        <h1 >ADMIN LOG</h1>
                    </div>
                    <form method="post" action="adminconfig">
                    <div class="input-field">
                        <label>ADMIN ID  :</label>
                        <input type="text" name="adminid" required>
                        
                    </div>
                        <div class="input-field">
                            <lable>ADMIN PASSWORD:</lable>
                            <input type="password" value="" id="adminpass" name="adminpass" required>
                            
                        </div>
                        <div class="center">
                            <input type="checkbox" onclick="hidepass()">Show Password<br>
                        </div>
                        <div class="center">
                            <input type="submit" value="LOGIN">
                        </div>
                        
                        <div class="center">
                            <a href="./contactus.jsp">Forgot password?</a>
                        </div>
                    </form>
                </div>              
            </section>

    </body>
<script src="js/adminlog.js"></script>
</html>
