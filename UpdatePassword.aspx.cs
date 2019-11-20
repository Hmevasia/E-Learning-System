using BLL;
using System;
using System.Data;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;


public partial class UpdatePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserInfo"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
    }

    [WebMethod, ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public  static int updatePWD(string oldpassword, string newpassword)
    {
        string result = string.Empty;
        DataTable dt = new DataTable();
        if (HttpContext.Current.Session["UserInfo"] != null)
        {
            dt = (DataTable)HttpContext.Current.Session["UserInfo"];

            ClsUsers ObjUser = new ClsUsers();
            ObjUser.UserPassword = clsEncryption.Encrypt(oldpassword);//currunt pwd 
            ObjUser.UserID = Convert.ToInt32(dt.Rows[0]["UserId"].ToString());
            return ClsUsers.ChangePwd(ObjUser, clsEncryption.Encrypt(newpassword));
        }
        else
            return 0;
        
    }

    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {

    }
}
