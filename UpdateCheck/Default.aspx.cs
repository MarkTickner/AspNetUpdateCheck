using System;
using System.Web.UI;

namespace UpdateCheck
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Update"] == null)
            {
                // Check for updates (default option)

                DateTime newFile = DateTime.Parse("23/05/2013 16:53:13.000");
                DateTime currentFile = DateTime.Parse("23/05/2013 16:53:12.000");

                // Check if file to be uploaded is newer than current one
                if (DateTime.Compare(TruncateToSecond(newFile), TruncateToSecond(currentFile)) > 0)
                {
                    // Reload with update dialogue
                    Response.Redirect("Default.aspx?Update=Check");
                }
                else
                {
                    // Site is on current or newer version already, no update required
                    lblInfo.Text = "The site is on the latest version of the data file already. ";
                }
            }
        }

        /// <summary>
        /// Method which truncates the input DateTime to an accuracy of 1 second for easy comparisons
        /// </summary>
        /// <param name="original">The input DateTime to truncate</param>
        /// <returns>The output truncated DateTime</returns>
        private static DateTime TruncateToSecond(DateTime original)
        {
            return new DateTime(
                original.Year,
                original.Month,
                original.Day,
                original.Hour,
                original.Minute,
                original.Second);
        }
    }
}