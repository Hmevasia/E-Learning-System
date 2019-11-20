using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using BLL;
using System.Web.Services;
using System.Web.Script.Services;

public partial class TutorDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserInfo"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
        else
        {
            //check here user role is student then redirect to useraccount
            //only tutor user can access this page
            DataTable dt = new DataTable();
            dt = (DataTable)Session["UserInfo"];
            String roleName = dt.Rows[0]["RoleName"].ToString();
            if (roleName.ToLower() == "student")
            {
                Response.Redirect("UserAccount.aspx");
            }
            else
            {
                int userid = Convert.ToInt32(dt.Rows[0]["UserID"].ToString());
                String courseName = ClsUsers.getTutorCourseName(userid);
                txtCourse.Text = courseName;
            }


        }
        if (!IsPostBack)
        {
            fillstudents();
        }

    }
    void fillstudents()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["UserInfo"];
        int CourseID = Convert.ToInt32(dt.Rows[0]["CourseID"].ToString());


        DataTable dtTtr = new DataTable();
        dtTtr = ClsUsers.GetStudents(CourseID);
        lstStudents.DataSource = dtTtr;
        lstStudents.DataTextField = "StudentName";
        lstStudents.DataValueField = "UserID";
        lstStudents.DataBind();
    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static int deleteStudent(int userid)
    {
        return ClsUsers.deleteStudent(userid);
    }

    protected void btnRemoveStudent_Click(object sender, EventArgs e)
    {

    }
}
