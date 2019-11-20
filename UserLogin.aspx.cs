using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;
using BLL;
using System.Data;

public partial class UserLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {


    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string login(string username, string pwd)
    {
        String result = "";

        ClsUsers oBJ = new ClsUsers();
        oBJ.UserName = username;
        oBJ.UserPassword = clsEncryption.Encrypt(pwd);

        DataTable dt = new DataTable();
        dt = ClsUsers.Login(oBJ);

        if (dt != null && dt.Rows.Count != 0)
        {
            HttpContext.Current.Session["UserInfo"] = dt;
            result = "success";
        }
        else {
            result = "fail";
        }
        return result;
    }
}
