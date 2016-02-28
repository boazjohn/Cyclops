<%--
Document   : index
Created on : Aug 26, 2010, 12:05:11 PM
Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="module.css" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cyclops - Main</title>

    </head>
    <body>

        <div class="wrapper">


            <div class="bottomline">Administrator Login</div>

            <div class="loginBox">
                <div class="tag">Login</div>
                <form name="logg" method="POST" action="login-exec.jsp">
                    <table><tr><td>username:</td><td><input type="text" name="usr" class="textfield" /></td></tr>
                        <tr><td>password:</td><td><input type="password" name="pass" class="textfield" /></td></tr>
                        <tr><td></td><td><input type="Submit" name="submit" value="Login" class="button" /></td></tr>
                    </table>
                </form>
            </div>
            <div class="alert_red">Error 101: Wrong username or password. Try again.</div>
        </div>


            <div class="headline">
                <img src="images/logo.png" />
                <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>

            </div>
    </body>
</html>
