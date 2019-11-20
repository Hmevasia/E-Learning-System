<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="UpdatePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#btnChange').click(function (e) {
                if (!validationPWD()) {
                    e.preventDefault();
                    return false;
                }
                else {
                    //////debugger;
                    $.ajax({
                        type: "POST",
                        url: 'UpdatePassword.aspx/updatePWD',
                        dataType: 'Json',
                        contentType: "application/json; charset=utf-8",
                        beforeSend: function () {
                            $('#btnChange').button('loading');
                        },
                        complete: function () {
                            setTimeout(function () {
                                $('#btnChange').button('reset');
                            }, 2000);
                        },
                        data: JSON.stringify({
                            'oldpassword': $('#txtCurrentPassword').val()
                            , 'newpassword': $('#txtNewPassword').val()
                        }),
                        success: function (result) {
                            console.log(result);
                            if (result.d == -1) {
                                alert("your current password is incorrect!");
                                return false;
                            }
                            else if (result.d == 1) {
                                alert('Successfully update new password.');
                                window.location = 'UserAccount.aspx';
                            }
                        },
                        error: function (result) {
                            console.log(result);
                            //////debugger; 
                            alert('error in change password.');
                        }
                    });
                }
            });
        });

        function validationPWD() {
            var result = true;
            $('.requiredValidation').each(function () {
                if ($(this).val().trim() == "" || $(this).val().trim() == "0") {
                    $(this).css('border-color', '#C9302C');
                    alert($(this).attr('title').concat(' is required.'));
                    result = false;
                    return false;
                }
                else {

                    var newpass = $('#txtNewPassword');
                    var confirmpass = $('#txtConfirmPassword');
                    if ($(newpass).val() != $(confirmpass).val()) {
                        alert('confirm password is not match with new password');
                        result = false;
                        return false;
                    }
                }
            });
            return result;
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-book text-info"></span>&nbsp;ELearning</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="UserAccount.aspx">User Account</a></li>
                <li class="active"><a href="UpdatePassword.aspx">Change Password</a></li>
                <li>
                    <a href="#" onclick="confirm('are you sure to logout?')?window.location='Logout.aspx':''">
                        <span class="glyphicon glyphicon-off text-danger"></span>&nbsp;Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-lg-10">
                <h2>Update password</h2>
            </div>
        </div>
        <div class="form-group row">
            <label for="txtCurrentPassword"
                class="col-md-2 col-form-label text-bold-600">
                Current Password
            </label>
            <div class="col-md-4 required">
                <input class="form-control requiredValidation"
                    id="txtCurrentPassword"
                    title="Current Password"
                    name="password"
                    type="password"
                    maxlength="8"
                    placeholder="Current password" />
                <%--<asp:TextBox runat="server" ID="" />--%>
            </div>
        </div>
        <div class="form-group row">
            <label for="txtNewPassword"
                class="col-md-2 col-form-label text-bold-600">
                New Password
            </label>
            <div class="col-md-4 required">
                <input class="form-control requiredValidation"
                    id="txtNewPassword"
                    name="password"
                    title="New Password"
                    type="password"
                    maxlength="8"
                    placeholder="New password" />
            </div>
        </div>
        <div class="form-group row">
            <label for="txtConfirmPassword"
                class="col-md-2 col-form-label text-bold-600">
                Confirm Password
            </label>
            <div class="col-md-4 required">
                <input class="form-control requiredValidation"
                    id="txtConfirmPassword"
                    title="Confirm Password"
                    name="password"
                    type="password"
                    placeholder="Confirm New Password" />
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-2"></div>
            <div class="col-md-4">
                <button id="btnChange"
                    type="button"
                    class="btn btn-warning"
                    data-loading-text="<i class='glyphicon glyphicon-refresh glyphicon-refresh-animate'></i> loading..">
                    <i class="glyphicon glyphicon-repeat" aria-hidden="true"></i>&nbsp;Change
                </button>
            </div>
        </div>
    </div>
</body>
</html>
