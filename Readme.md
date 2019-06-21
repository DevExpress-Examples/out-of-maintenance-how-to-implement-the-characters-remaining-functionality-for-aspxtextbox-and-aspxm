<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# How to implement the "characters remaining" functionality for ASPxTextBox and ASPxMemo using MaxLength
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e1424/)**
<!-- run online end -->


<p>When inputting a value into a text box whose maximum length is limited, it could be useful for end-users to know how many characters they still can type. This example demonstrates how to implement this feature.</p><p>The number of remaining characters is printed on a label near the editor. In this example we're using the MaxLength property of the ASPxTextBox, which allows us to specify the maximum length of the ASPxTextBox control. However, the ASPxMemo does not have this property, because the <textarea> HTML element doesnt support a native maxlength attribute. That's why the MaxLength-functionality for the ASPxMemo is implemented here in a roundabout way using a timer to check every 50ms of the memo text's length and trim the text if necessary.</p><p>See also:<br />
<a href="https://www.devexpress.com/Support/Center/p/E393">ASPxMemo - How to limit the length of text that can be entered into the control using MaxLength</a><br />
<a href="https://www.devexpress.com/Support/Center/p/E4334">How to set the text max length in the ASPxMemo control</a></p>

<br/>


