using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ServerValidation(object source, ServerValidateEventArgs args)
    {
        bool valid = Int32.TryParse(QtyInput.Text, out int qty);
        if (valid)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
}