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

public partial class UpdateTutorCourse : System.Web.UI.Page
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
            fillCourseList();
        }
    }
    void fillCourseList()
    {
        DataTable dtTtr = new DataTable();
        dtTtr = ClsCource.GetCourse();
        lstCourses.DataSource = dtTtr;
        lstCourses.DataTextField = "CourseName";
        lstCourses.DataValueField = "CourseID";
        lstCourses.DataBind();
    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static int updateCourse(int courseid)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)HttpContext.Current.Session["UserInfo"];
        int userid = Convert.ToInt32(dt.Rows[0]["UserID"].ToString());
        return ClsUsers.updateTutorCourse(userid, courseid);
    }

    protected void btnUpdateCourse_Click(object sender, EventArgs e)
    {

    }
}
