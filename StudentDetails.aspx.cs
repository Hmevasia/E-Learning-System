using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using BLL;

public partial class StudentDetails : System.Web.UI.Page
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

            if (dt.Rows[0]["RoleName"].ToString() == "Student")
            {
                lblChangePwd.Visible = false;
            }

        }
        if (!IsPostBack)
        {
            filldata();
            fillTutos();
        }
    }

    void filldata()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["UserInfo"];
        int userId = Convert.ToInt32(dt.Rows[0]["UserID"].ToString());


        DataTable dtModule = new DataTable();
        dtModule = ClsUsers.GetUserModule(userId);
        rptModules.DataSource = dtModule;
        rptModules.DataBind();
    }
    void fillTutos()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["UserInfo"];
        int CourseID = Convert.ToInt32(dt.Rows[0]["CourseID"].ToString());


        DataTable dtTtr = new DataTable();
        dtTtr = ClsUsers.GetTutors(CourseID);
        rptTutors.DataSource = dtTtr;
        rptTutors.DataBind();
    }
    protected void btnShowEmail_Click(object sender, EventArgs e)
    {

        DataTable dt = new DataTable();
        dt = (DataTable)Session["UserInfo"];
        string email = dt.Rows[0]["EmailAddress"].ToString();

        //get Email here 
       // lblEmail.InnerText = email;
    }
}
