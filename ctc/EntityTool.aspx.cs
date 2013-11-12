using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EntityTool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        String s = EntityCreateTool.getClass(this.TextBoxTableName.Text.Trim());
        this.TextBoxResult.Text = s;
    }
}