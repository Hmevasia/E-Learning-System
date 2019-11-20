<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .login-form {
            width: 340px;
            margin: 50px auto;
        }

            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }

            .login-form h2 {
                margin: 0 0 15px;
            }

        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }

        .btn {
            font-size: 15px;
            font-weight: bold;
        }
    </style>
 <script type="text/javascript">
     $(document).ready(function () {
         $('#btnLogin').click(function () {

             if ($('#txtUserName').val() == '') {
                 alert('Username is required!');
                 $('#txtUserName').focus();
                 return;
             }
             
             if ($('#txtPassword').val() == '') {
                 alert('Password is required!');
                 $('#txtPassword').focus();
                 return;
             }
             var username = $('#txtUserName').val();
             var pwd = $('#txtPassword').val();


             $.ajax({
                 type: "POST",
                 url: "UserLogin.aspx/login",
                 data: JSON.stringify({
                     'username': username,
                     'pwd': pwd
                 }),
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 beforeSend: function () {
                     $('#btnLogin').button('loading');
                 },
                 complete: function () {
                     setTimeout(function myfunction() {
                         $('#btnLogin').button('reset');
                     }, 1000);
                 },
                 success: function (result) {
                     console.log(result);
                     if (result.d == 'success') {
                         //alert('success');
                         window.location = 'UserAccount.aspx';
                     } else if (result.d == 'fail') {
                         alert('invalid username or password.');
                         $('#txtUserName').focus();
                     } else
                         alert('error in login')
                 },
                 error: function (result) {
                     alert('error in login')
                 }
             });
         });
     });
    </script>
</head>
<body>
    <div class="login-form">
        <form runat="server">
            <h2 class="text-center">Log in</h2>
            <div class="form-group">
                <%--<input type="text" class="form-control" placeholder="Username" required="required">--%>
                  <asp:TextBox ID="txtUserName" runat="server"
                                                  class="form-control"
                                                  autofocus
                                                   placeholder="Username">
                                              </asp:TextBox>
            </div>
            <div class="form-group">
               <%-- <input type="password" class="form-control" placeholder="Password" required="required">--%>
                  <asp:TextBox ID="txtPassword" 
                                                            class="form-control"
                                                            runat="server" 
                                                            placeholder="Password" 
                                                            TextMode="Password">
                                                        </asp:TextBox>
            </div>
            <div class="form-group">
                <%--<button type="submit" class="btn btn-primary btn-block">Log in</button>--%>
                <%--<asp:Button Text="Login" runat="server" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-block" />--%>
                 <button 
                     id="btnLogin" 
                     type="button" 
                     class="btn btn-lg btn-primary btn-block" 
                     data-loading-text="<i class='glyphicon glyphicon-refresh glyphicon-refresh-animate'></i> logging in..">
                     <span class="glyphicon glyphicon-lock"></span>&nbsp;Login</button>
            </div>
        </form>
        <p class="text-center">
            <a href="StudentRegistration.aspx" title="Create new account">Student not registered?</a>
        </p>
    </div>
</body>
</html>
