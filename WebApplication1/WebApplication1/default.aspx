<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication1._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.signalR-0.5.3.min.js" type="text/javascript"></script>
    <script src="/signalr/hubs" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script type="text/javascript">
                $(function () {
                    // Proxy created on the fly
                    var chat = $.connection.chat;

                    // Declare a function on the chat hub so the server can invoke it
                    chat.addMessage = function (message) {
                        $('#messages').append('<li>' + message + '</li>');
                    };

                    $("#broadcast").click(function () {
                        // Call the chat method on the server
                        chat.send($('#msg').val());
                    });

                    // Start the connection
                    $.connection.hub.start();
                });
            </script>
            <input id="msg" />
            <input id="broadcast" type="button" />
            <ul id="messages"></ul>


        </div>
    </form>
</body>
</html>
