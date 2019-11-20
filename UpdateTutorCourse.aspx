<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateTutorCourse.aspx.cs" Inherits="UpdateTutorCourse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Update Tutor Course</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#btnUpdateCourse').click(function (e) {
                if ($('#<%=lstCourses.ClientID%>').val() != '') {
                    var courseid = $('#<%=lstCourses.ClientID%>').val();
                    $.ajax({
                        type: "POST",
                        url: "UpdateTutorCourse.aspx/updateCourse",
                        data: JSON.stringify({
                            'courseid': parseInt(courseid)
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            alert('Course updated successfully.');
                            window.location = 'TutorDetails.aspx';
                        },
                        error: function (result) {
                            alert('error in update course')
                        }
                    });
                }
            });
        });
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
                <li class="active"><a href="UpdateTutorCourse.aspx">Update Tutor course</a></li>
                <li runat="server" id="lblChangePwd"><a href="UpdatePassword.aspx"><span class="glyphicon glyphicon-refresh text-warning"></span>&nbsp;Change Password</a></li>
                <li>
                    <a href="#" onclick="confirm('are you sure to logout?')?window.location='Logout.aspx':''">
                        <span class="glyphicon glyphicon-off text-danger"></span>&nbsp;Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <form id="Form1" runat="server">
        <div class="container">
            <div class="form-group row">
                <div class="col-lg-10">
                    <div class="col-md-2">
                        <label>Current Course:</label>
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtCourse"
                            class="form-control" ReadOnly="True"
                            runat="server">
                        </asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-10">
                    <h3>Switch to Course:</h3>
                    <hr />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-10">
                    <div class="col-md-5">
                        <asp:ListBox ID="lstCourses"
                            CssClass="form-control"
                            Style="width: 100%;" runat="server"></asp:ListBox>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-10">
                    <div class="col-md-3">
                        <button id="btnUpdateCourse" type="button"
                            class="btn btn-lg btn-primary btn-block">
                            Update Course</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
