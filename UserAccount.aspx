<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAccount.aspx.cs" Inherits="UserAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Account</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"> <span class="glyphicon glyphicon-book text-info"></span>&nbsp;ELearning</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="UserAccount.aspx">User Account</a></li>
      <li><a href="StudentDetails.aspx">Student Details</a></li>
      <li runat="server" id="lblChangePwd"><a href="UpdatePassword.aspx">Change Password</a></li>
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
                <h2 id="lblWelcome" runat="server">Welcome</h2>
            </div>
        </div>
    </div>
    <%--  <form id="form1" runat="server">
   
        <asp:Label ID="lblTutorChangePassword" runat="server"
            Style="z-index: 1; left: 118px; top: 144px; position: absolute"
            Text="If this is the first time you have logged in, please change your password."
            Visible="False"></asp:Label>
        
    <asp:Button ID="btnUpdatePassword" runat="server" 
        style="z-index: 1; top: 29px; position: absolute; left: 280px" 
        Text="Update Password" PostBackUrl="~/UpdatePassword.aspx" />
        
    <asp:Button ID="btnUserDetails" runat="server" 
        PostBackUrl="~/StudentDetails.aspx" 
        style="z-index: 1; left: 120px; top: 29px; position: absolute" 
        Text="Student Details"/>
        
    <asp:Button ID="btnUpdateTutorCourse" runat="server" 
        style="z-index: 1; left: 457px; top: 30px; position: absolute" 
        Text="Update Tutor Course" Visible="False" 
        PostBackUrl="~/UpdateTutorCourse.aspx" />
        
    
    <asp:Label ID="lblUpdateSuccess" runat="server" ForeColor="#009900" 
        style="z-index: 1; left: 121px; top: 189px; position: absolute"></asp:Label>
        
    
    </form>--%>
</body>
</html>
