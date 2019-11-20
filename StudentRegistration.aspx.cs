using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Web.Services;
using System.Web.Script.Services;
using BLL;
using Newtonsoft.Json;

public partial class StudentRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {

    }
    

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static int register(ClsUsers ObjUser)
    {
        int result = ClsUsers.InsertUpdate(ObjUser);
        return result;
    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getCourseList()
    {
        DataTable dt = ClsCource.GetCourse();
        if (dt != null && dt.Rows.Count > 0)
            return JsonConvert.SerializeObject(dt);
        else
            return "empty";
    }


}
