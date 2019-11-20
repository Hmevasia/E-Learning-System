<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentRegistration.aspx.cs" Inherits="StudentRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Registration</title>
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
            $('#btnRegister').click(function () {

                if ($('#txtUserName').val() == '') {
                    alert('Username is required!');
                    $('#txtUserName').focus();
                    return;
                }


                if ($('#txtUserName').val().length < 5 || $('#txtUserName').val().length > 20) {
                    alert('Username must beetween 5 to 20 chars!');
                    $('#txtUserName').focus();
                    return;
                }

                if ($('#txtPassword').val() == '') {
                    alert('Password is required!');
                    $('#txtPassword').focus();
                    return;
                }


                if ($('#txtPassword').val() != $('#txtConfirmPassword').val()) {
                    alert('Password not match!');
                    $('#txtConfirmPassword').focus();
                    return;
                }

                if ($('#txtFullName').val() == '') {
                    alert('Full name is required!');
                    $('#txtFullName').focus();
                    return;
                }

                if ($('#txtEmail').val() == '') {
                    alert('Email is required!');
                    $('#txtEmail').focus();
                    return;
                }

                if (!isEmail($('#txtEmail').val())) {
                    alert('Please enter valid Email!');
                    $('#txtEmail').focus();
                    return;
                }

                if ($('#ddlCourse').val() == '0') {
                    alert('Please select course!');
                    $('#ddlCourse').focus();
                    return;
                }

                var _Obj = {
                    'UserName': $('#txtUserName').val(),
                    'UserPassword': $('#txtPassword').val(),
                    'RealName': $('#txtFullName').val(),
                    'EmailAddress': $('#txtEmail').val(),
                    'RoleID': 1,
                    'MODE': 'INSERT',
                    'CourseID': $('#ddlCourse').val()
                };

                $.ajax({
                    type: "POST",
                    url: "StudentRegistration.aspx/register",
                    data: JSON.stringify({ 'ObjUser': _Obj }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        $('#btnRegister').button('loading');
                    },
                    complete: function () {
                        setTimeout(function myfunction() {
                            $('#btnRegister').button('reset');
                        }, 1000);
                    },
                    success: function (result) {
                        console.log(result);
                        if (result.d == 1) {
                            alert('Registration successfull.')
                            window.location = 'UserLogin.aspx';
                        } else if (result.d == -2) {
                            alert('Username already exists.');
                            $('#txtUserName').focus();
                        } else
                            alert('error in registraion')
                    },
                    error: function (result) {
                        alert('Fail to fill Course list');
                    }
                });
            });

            fillCourse();
        });
        function isEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
        function fillCourse() {
            $.ajax({
                type: "POST",
                url: "StudentRegistration.aspx/getCourseList",
                data: "{'data':''}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    //$("#loading").show(10);
                },
                complete: function () {
                    //$("#loading").hide(10);
                },
                success: function (result) {
                    $('#ddlCourse').empty().append($("<option></option>").val(0).html('Select Course'));
                    if (result.d == 'empty') {
                        alert('no course found.!');
                        return;
                    } else {
                        var jsdata = JSON.parse(result.d);
                        var ddl = $('#ddlCourse');
                        var groupChar = '';
                        var curruntGroupChar = '';
                        var charGroup = null;
                        $.each(jsdata, function (key, value) {
                            groupChar = value.CourseName.charAt(0);
                            if (curruntGroupChar == groupChar) {
                                $(ddl).append($(charGroup).append($("<option/>", { value: value.CourseID, text: value.CourseName })));
                            } else {
                                charGroup = null;
                                //charGroup = $('<optgroup>', { label: groupChar, id: groupChar });
                                charGroup = $('<optgroup>', { label: groupChar });
                                curruntGroupChar = groupChar;
                                $(ddl).append($(charGroup).append($("<option/>", { value: value.CourseID, text: value.CourseName })));
                            }
                        });

                    }
                },
                error: function (result) {
                    alert('Fail to fill Course list');
                }
            });
        }
    </script>
</head>
<body>
    <div class="login-form">
        <form id="Form1">
            <h2 class="text-center">Registration</h2>
            <div class="form-group">
                <input type="text"
                    class="form-control"
                    placeholder="Username"
                    id="txtUserName"
                    required="required" />
                <%--<asp:TextBox ID="txtUserName" runat="server"
                    class="form-control"
                    autofocus
                    placeholder="Username">
                </asp:TextBox>--%>
            </div>
            <div class="form-group">
                <input type="password"
                    class="form-control"
                    placeholder="Password"
                    maxlength="5"
                    id="txtPassword"
                    required="required" />
            </div>
            <div class="form-group">
                <input type="password"
                    class="form-control"
                    placeholder="Confirm Password"
                    id="txtConfirmPassword"
                    maxlength="5"
                    required="required" />
            </div>
            <div class="form-group">
                <input type="text"
                    class="form-control"
                    placeholder="Full name"
                    id="txtFullName"
                    required="required" />
            </div>
            <div class="form-group">
                <input type="text"
                    class="form-control"
                    placeholder="Email"
                    id="txtEmail" />
            </div>
            <div class="form-group">
                <select id="ddlCourse"
                    class="form-control"
                    required="required">
                </select>
            </div>
            <div class="form-group">
                <%--<button type="submit" class="btn btn-primary btn-block">Log in</button>--%>
                <%--<asp:Button ID="Button1" Text="Login" runat="server" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-block" />--%>
                <button id="btnRegister" type="button"
                    class="btn btn-lg btn-primary btn-block"
                    data-loading-text="<i class='glyphicon glyphicon-refresh glyphicon-refresh-animate'></i> Loding...">
                    <span class="glyphicon glyphicon-user"></span>&nbsp;Register
                </button>
            </div>
        </form>
        <p class="text-center">
            <a href="UserLogin.aspx" title="login">Login here</a>
        </p>
    </div>
</body>
</html>
