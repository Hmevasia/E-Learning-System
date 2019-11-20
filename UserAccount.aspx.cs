using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserInfo"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
        else
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["UserInfo"];
            lblWelcome.InnerText = "Welcome, " + dt.Rows[0]["RealName"].ToString();

            if (dt.Rows[0]["RoleName"].ToString().Trim() == "Student")
            {
                lblChangePwd.Visible = false;
            }
            else {
                lblChangePwd.Visible = true;
                Response.Redirect("TutorDetails.aspx");
            }
        }

    }
}
