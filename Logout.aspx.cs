﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpContext.Current.Session["UserInfo"] = null;
        Response.Redirect("UserLogin.aspx");
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
    
    }
}
