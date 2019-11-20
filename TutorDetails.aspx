<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TutorDetails.aspx.cs" Inherits="TutorDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Tutor details</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#btnRemoveStudent').click(function (e) {
                if ($('#<%=lstStudents.ClientID%>').val() != '') {
                    var studentID = $('#<%=lstStudents.ClientID%>').val();
                    $.ajax({
                        type: "POST",
                        url: "TutorDetails.aspx/deleteStudent",
                        data: JSON.stringify({
                            'userid': parseInt(studentID)
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            $("#<%=lstStudents.ClientID%> option:selected").remove();
                        },
                        error: function (result) {
                            alert('error in remove student')
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
                <li><a href="UpdateTutorCourse.aspx">Update Tutor course</a></li>
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
                    <div class="col-md-1">
                        <label id="Label1">Course:</label>
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
                    <h3>Students(s) on your course:</h3>
                    <hr />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-10">
                    <div class="col-md-5">
                        <asp:ListBox ID="lstStudents" CssClass="form-control" Style="width: 100%;" runat="server"></asp:ListBox>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-10">
                    <div class="col-md-3">
                        <button id="btnRemoveStudent" type="button"
                            class="btn btn-lg btn-primary btn-block">
                            Remove Student
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%--<form id="form1" runat="server">
    <asp:Button ID="btnUserAccount" runat="server" PostBackUrl="~/UserAccount.aspx" 
        style="z-index: 1; left: 104px; top: 15px; position: absolute" 
        Text="User Account" />
    <div> 
        <asp:Label ID="lblTutorDetails" runat="server" Font-Bold="True" 
            Font-Size="Larger" 
            style="z-index: 1; left: 100px; top: 48px; position: absolute" 
            Text="Tutor Details" Font-Underline="True"></asp:Label>
    </div>
    <asp:Label ID="lblCourse" runat="server" 
        style="z-index: 1; left: 102px; top: 90px; position: absolute" Text="Course:"></asp:Label>
    <asp:TextBox ID="txtCourse" runat="server" ReadOnly="True" 
        style="z-index: 1; left: 165px; top: 87px; position: absolute"></asp:TextBox>
        
    <asp:Label ID="lblError" runat="server" ForeColor="Red" 
        style="z-index: 1; left: 321px; top: 89px; position: absolute"></asp:Label>
        
    <asp:Label ID="lblStudents" runat="server" 
        style="z-index: 1; left: 102px; top: 125px; position: absolute" 
        Text="Students(s) on your course:"></asp:Label>
    <asp:ListBox ID="lstStudents" runat="server"        
        style="z-index: 1; left: 102px; top: 159px; position: absolute; height: 72px; width: 180px">
    </asp:ListBox>
    
    <asp:Button ID="btnRemoveStudent" runat="server" 
        style="z-index: 1; left: 102px; top: 250px; position: absolute" 
        Text="Remove Student" onclick="btnRemoveStudent_Click" />
        
    <asp:Label ID="lblSuccess" runat="server" ForeColor="#009900" 
        style="z-index: 1; left: 104px; top: 293px; position: absolute"></asp:Label>
    
    </form>--%>
</body>
</html>
