<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CharsRemainingCounter._Default" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<!--region #Markup-->
<head runat="server">
    <title>Example</title>
    <script type="text/javascript">
        function RecalculateCharsRemaining(editor) {
    var maxLength = parseInt(editor.maxLength ? editor.maxLength : editor.GetInputElement().maxLength);
    var editValue = editor.GetValue();
    var valueLength = editValue != null ? editValue.toString().length : 0;
    var charsRemaining = maxLength - valueLength;
    SetCharsRemainingValue(editor, charsRemaining >= 0 ? charsRemaining : 0);
}
function SetCharsRemainingValue(textEditor, charsRemaining) {
    var associatedLabel = ASPxClientControl.GetControlCollection().Get(textEditor.name + "_cr");
    var color = GetLabelColor(charsRemaining).toString();
    associatedLabel.SetText("<span style='color: " + color + ";'>" + charsRemaining.toString() + "</span>");
}
function GetLabelColor(charsRemaining) {
    if(charsRemaining < 5) return "red";
    if(charsRemaining < 12) return "#F3A250";
    return "green";
}

// ASPxMemo - MaxLength emulation
function InitMemoMaxLength(memo, maxLength) {
    memo.maxLength = maxLength;
}
function EnableMaxLengthMemoTimer(memo) {
    memo.maxLengthTimerID = window.setInterval(function() {
        var text = memo.GetText();
        if(text.length > memo.maxLength) {
            memo.SetText(text.substr(0, memo.maxLength));
            RecalculateCharsRemaining(memo);
        }
    }, 50);
}
function DisableMaxLengthMemoTimer(memo) {
    if(memo.maxLengthTimerID) {
        window.clearInterval(memo.maxLengthTimerID);
        delete memo.maxLengthTimerID;
    }
}
    </script>
    <link href="Style.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <fieldset>
            <legend>ASPxTextBox</legend>
            <dxe:ASPxTextBox ID="tbTextBox" runat="server" Width="172px" MaxLength="22">
                <ClientSideEvents Init="RecalculateCharsRemaining" KeyDown="RecalculateCharsRemaining" KeyUp="RecalculateCharsRemaining" />
            </dxe:ASPxTextBox>
            <span class="chrm">
                Characters remaining: <dxe:ASPxLabel ID="tbTextBox_cr" runat="server" EnableClientSideAPI="True" />
            </span>
        </fieldset>
        <fieldset>
            <legend>ASPxMemo</legend>
            <dxe:ASPxMemo ID="txtMemo" runat="server" Rows="4" Columns="30">
                <ClientSideEvents
                    Init="function(s, e) { InitMemoMaxLength(s, 22); RecalculateCharsRemaining(s); }"
                    GotFocus="EnableMaxLengthMemoTimer" LostFocus="DisableMaxLengthMemoTimer"
                    KeyDown="RecalculateCharsRemaining" KeyUp="RecalculateCharsRemaining" />
            </dxe:ASPxMemo>
            <span class="chrm">
                Characters remaining: <dxe:ASPxLabel ID="txtMemo_cr" runat="server" EnableClientSideAPI="True" />
            </span>
        </fieldset>
    </form>
</body>
<!--endregion #Markup-->
</html>
