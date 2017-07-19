<%@ Page Title="Home" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UpdateCheck.Default" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Home</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            if (GetQueryVariable("Update") === "Check") {
                window.bootbox.dialog({
                    title: "Update Available",
                    message: "There is a newer data file available for this website. Please choose an option below to continue.",
                    buttons: {
                        cancel: { // User has declined update
                            label: "Use current data file",
                            className: "btn-default",
                            callback: function () {
                                FadeToUrl("Default.aspx?Update=UpdateDeclined");
                            }
                        },
                        main: { // User has requested to run the update
                            label: "Update and use new data file",
                            className: "btn-primary",
                            callback: function () {
                                FadeToUrl("Update.aspx");
                            }
                        }
                    }
                });
            }
        });

        // Function that allows the dialog box to fade out fully before changing page
        function FadeToUrl(url) {
            setTimeout(function () {
                window.location.href = url;
            }, 200);
        };

        // Function that returns the specified query string variable
        function GetQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] === variable) { return pair[1]; }
            }
            return (false);
        };
    </script>

</head>
<body>
    <form runat="server">
        <div class="container body-content">
            <h2><%: Title %></h2>
            <h4>Check if there is a newer data file available.</h4>

            <p>
                <asp:Literal ID="lblInfo" runat="server"></asp:Literal>Admin link: <a href="Default.aspx?Update=Check">check for update</a>.
            </p>
        </div>
    </form>
</body>
</html>