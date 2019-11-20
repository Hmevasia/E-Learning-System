<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentDetails.aspx.cs" Inherits="StudentDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student details</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#btnShowEmail').click(function () {
                showEmail();
            });
        });
        function showEmail() {
            var found = false;
            $('.tutorEmail').each(function () {
                if ($(this).prop('checked')) {
                    $('#lblEmail').text($(this).val());
                    found = true;
                }
            });
            if (!found) {
                alert('Please select tutor to show email!');
            }
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
                <li class="active"><a href="StudentDetails.aspx">Student Details</a></li>
                <li runat="server" id="lblChangePwd"><a href="UpdatePassword.aspx">Change Password</a></li>
                <li>
                    <a href="#" onclick="confirm('are you sure to logout?')?window.location='Logout.aspx':''">
                        <span class="glyphicon glyphicon-off text-danger"></span>&nbsp;Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <h2 id="lblWelcome" runat="server">Welcome</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10">
                    <h3>Modules on your course:</h3>
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10">
                    <table class="table">
                        <thead>
                            <tr>

                                <th>Module Code</th>
                                <th>Module Name</th>
                            </tr>
                        </thead>
                        <asp:Repeater ID="rptModules" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("ModuleCode") %></td>
                                    <td><%#Eval("ModuleName") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-10">
                    <h3>Tutor(s) on your course:</h3>
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <table class="table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Tutor Name</th>
                            </tr>
                        </thead>
                        <asp:Repeater ID="rptTutors" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <input type="radio"
                                            name="module"
                                            class="tutorEmail"
                                            value="<%#Eval("EmailAddress")%>" />
                                    </td>
                                    <td><%#Eval("TutorName") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10">
                    <div class="col-md-3">
                        <%--<asp:Button ID="btnShowEmail" runat="server"
                        Style="z-index: 1; left: 102px; top: 250px; position: absolute"
                        Text="Show Email"  />--%>
                        <%--//onclick="showEmail(this.value);"--%>
                        <%--  <asp:Button Text="Show Email"
                            runat="server"
                            OnClick="btnShowEmail_Click"
                            CssClass="btn btn-lg btn-primary btn-block" />--%>
                        <button id="btnShowEmail" type="button"
                            class="btn btn-lg btn-primary btn-block">
                            <span class="glyphicon glyphicon-mail"></span>&nbsp;Show Email
                        </button>
                    </div>
                    <div class="col-md-4">
                        <label id="lblEmail"></label>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%--<asp:Button ID="btnShowEmail" runat="server" 
        style="z-index: 1; left: 102px; top: 250px; position: absolute" 
        Text="Show Email" onclick="btnShowEmail_Click" />
    <asp:Label ID="lblEmail" runat="server" Font-Italic="True" 
        style="z-index: 1; left: 236px; top: 254px; position: absolute" 
        Text="Email will appear here."></asp:Label>--%>
</body>
</html>
