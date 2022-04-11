<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="RiskAssessment.aspx.cs" Inherits="PwC.Pages.RiskAssessment" %>

<%@ Register Src="~/Common/Controls/StatusControl/StatusControl.ascx" TagPrefix="uc"
    TagName="StatusControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .tdHeaders
        {
            border-bottom: 2px solid #333;
            padding: 5px;
            text-align: center;
            font-size: 16px;
            color: Black;
            font-weight: bold;
        }
        .small
        {
            font-size: 12px !important;
            width: 100px;
            padding-top: 5px !important;
            padding-right: 5px !important;
            padding-bottom: 5px !important;
            font-weight: normal;
        }
        .options
        {
            width: 195px !important;
        }
        .answerRow
        {
            padding: 10px;
            vertical-align: top;
            border-bottom:solid 1px rgb(0,194,200);
        }
        
        .question
        {
            text-align: left;
            width: 130px;
        }
        .answer
        {
            cursor: pointer;
            font-size: 11px;
            width: 200px !important;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {

            
                var val = $("#ctl00_MainContent_hdnQ1").val();
                var count = 1;
                $($(".optionQ1").get().reverse()).each(function () {
                    if (val == count) {
                        if (count == 4) { $(this).parent().css("background-color", "#FF8080"); $(this).parent().css("color", "#000000"); } else if (count == 3) { $(this).parent().css("background-color", "#FFCC80"); $(this).parent().css("color", "#000000"); } else if (count == 2) { $(this).parent().css("background-color", "#FFFF80"); $(this).parent().css("color", "#000000"); } else if (count == 1) { $(this).parent().css("background-color", "#80E680"); $(this).parent().css("color", "#000000"); }
                    }
                    count++;
                });
                var val = $("#ctl00_MainContent_hdnQ2").val();
                var count = 1;
                $($(".optionQ2").get().reverse()).each(function () {
                    if (val == count) {
                        if (count == 4) { $(this).parent().css("background-color", "#FF8080"); $(this).parent().css("color", "#000000"); } else if (count == 3) { $(this).parent().css("background-color", "#FFCC80"); $(this).parent().css("color", "#000000"); } else if (count == 2) { $(this).parent().css("background-color", "#FFFF80"); $(this).parent().css("color", "#000000"); } else if (count == 1) { $(this).parent().css("background-color", "#80E680"); $(this).parent().css("color", "#000000"); }
                    }
                    count++;
                });
                var val = $("#ctl00_MainContent_hdnQ3").val();
                var count = 1;
                $($(".optionQ3").get().reverse()).each(function () {
                    if (val == count) {
                        if (count == 4) { $(this).parent().css("background-color", "#FF8080"); $(this).parent().css("color", "#000000"); } else if (count == 3) { $(this).parent().css("background-color", "#FFCC80"); $(this).parent().css("color", "#000000"); } else if (count == 2) { $(this).parent().css("background-color", "#FFFF80"); $(this).parent().css("color", "#000000"); } else if (count == 1) { $(this).parent().css("background-color", "#80E680"); $(this).parent().css("color", "#000000"); }
                    }
                    count++;
                });
                var val = $("#ctl00_MainContent_hdnQ4").val();
                var count = 1;
                $($(".optionQ4").get().reverse()).each(function () {
                    if (val == count) {
                        if (count == 4) { $(this).parent().css("background-color", "#FF8080"); $(this).parent().css("color", "#000000"); } else if (count == 3) { $(this).parent().css("background-color", "#FFCC80"); $(this).parent().css("color", "#000000"); } else if (count == 2) { $(this).parent().css("background-color", "#FFFF80"); $(this).parent().css("color", "#000000"); } else if (count == 1) { $(this).parent().css("background-color", "#80E680"); $(this).parent().css("color", "#000000"); }
                    }
                    count++;
                });
            
        });


        function SetQuestionAnswer(s, n, o) {
            if ($("#ctl00_MainContent_btnSave").length>0) {

                $("." + o).each(function () {
                    $(this).parent().css("background-color", "#fff");
                    $(this).parent().css("color", "#6d6e71");
                });
                if (n == 4) {
                    $(s).css("background-color", "#FF8080");
                    $(s).css("color", "#000000");
                } else if (n == 3) {
                    $(s).css("background-color", "#FFCC80");
                    $(s).css("color", "#000000");
                } else if (n == 2) {
                    $(s).css("background-color", "#FFFF80");
                    $(s).css("color", "#000000");
                } else if (n == 1) {
                    $(s).css("background-color", "#80E680");
                    $(s).css("color", "#000000");
                }

                if (o == "optionQ1") {
                    $("#ctl00_MainContent_hdnQ1").val(n);
                } else if (o == "optionQ2") {
                    $("#ctl00_MainContent_hdnQ2").val(n);
                } else if (o == "optionQ3") {
                    $("#ctl00_MainContent_hdnQ3").val(n);
                } else if (o == "optionQ4") {
                    $("#ctl00_MainContent_hdnQ4").val(n);
                }
            }
        }

        function dep(event) {
            if (event.stopPropagation) {
                event.stopPropagation();
            }
            else if (window.event) {
                window.event.cancelBubble = true;
            }
        }


    </script>
    <h1>
        Risk Assessment - Impact metric</h1>
    <div style="margin: 20px 0 10px 0; color: red">
        <label>Note: Your session will end if you are inactive for 20 minutes and changes will not be saved.   Please ensure you save your changes before this.</label>
    </div>
    <asp:ValidationSummary ID="vsummary" runat="server" CssClass="errorSummary" Style="margin-top: 20px;"
        HeaderText="<h3>The following errors have occured:</h3>" ValidationGroup="RiskAssessmentValidation" />
    <table>
        <tr>
            <td class="tdHeaders">
                &nbsp
            </td>
            <td class="tdHeaders options">
                4
            </td>
            <td class="tdHeaders options">
                3
            </td>
            <td class="tdHeaders options">
                2
            </td>
            <td class="tdHeaders options">
                1
            </td>
            <td class="tdHeaders small">
                Explain Rationale for Impact Selection
            </td>
        </tr>
        <tr>
            <asp:HiddenField ID="hdnQ1" runat="server" />
            <td class="answerRow question">
                <b>
                    <asp:Label ID="lblQ1" runat="server" Text=""></asp:Label></b>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,4,'optionQ1');">
                <asp:Label ID="lblQ1O4" runat="server" class="optionQ1" Text="option4"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,3,'optionQ1');">
                <asp:Label ID="lblQ1O3" runat="server" class="optionQ1" Text="option3"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,2,'optionQ1');">
                <asp:Label ID="lblQ1O2" runat="server" class="optionQ1" Text="option2"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,1,'optionQ1');">
                <asp:Label ID="lblQ1O1" runat="server" class="optionQ1" Text="option1"></asp:Label>
            </td>
            <td class="answerRow answer">
                <asp:TextBox ID="txtQ1" runat="server" TextMode="MultiLine" Width="200px" Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtQ1" ControlToValidate="txtQ1" ErrorMessage="a. Rationale explanation is mandatory"
                    runat="server" ValidationGroup="RiskAssessmentValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <asp:HiddenField ID="hdnQ2" runat="server" />
            <td class="answerRow question">
                <b>
                    <asp:Label ID="lblQ2" runat="server" Text=""></asp:Label></b>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,4,'optionQ2');">
                <asp:Label ID="lblQ2O4" runat="server" class="optionQ2" Text="option4"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,3,'optionQ2');">
                <asp:Label ID="lblQ2O3" runat="server" class="optionQ2" Text="option3"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,2,'optionQ2');">
                <asp:Label ID="lblQ2O2" runat="server" class="optionQ2" Text="option2"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,1,'optionQ2');">
                <asp:Label ID="lblQ2O1" runat="server" class="optionQ2" Text="option1"></asp:Label>
            </td>
            <td class="answerRow answer">
                <asp:TextBox ID="txtQ2" runat="server" TextMode="MultiLine" Width="200px"  Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtQ2" ControlToValidate="txtQ2" ErrorMessage="b. Rationale explanation is mandatory"
                    runat="server" ValidationGroup="RiskAssessmentValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <asp:HiddenField ID="hdnQ3" runat="server" />
            <td class="answerRow question">
                <b>
                    <asp:Label ID="lblQ3" runat="server" Text=""></asp:Label></b>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,4,'optionQ3');">
                <asp:Label ID="lblQ3O4" runat="server" class="optionQ3" Text="option4"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,3,'optionQ3');">
                <asp:Label ID="lblQ3O3" runat="server" class="optionQ3" Text="option3"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,2,'optionQ3');">
                <asp:Label ID="lblQ3O2" runat="server" class="optionQ3" Text="option2"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,1,'optionQ3');">
                <asp:Label ID="lblQ3O1" runat="server" class="optionQ3" Text="option1"></asp:Label>
            </td>
            <td class="answerRow answer">
                <asp:TextBox ID="txtQ3" runat="server" TextMode="MultiLine" Width="200px"  Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtQ3" ControlToValidate="txtQ3" ErrorMessage="c. Rationale explanation is mandatory"
                    runat="server" ValidationGroup="RiskAssessmentValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <asp:HiddenField ID="hdnQ4" runat="server" />
            <td class="answerRow question">
                <b>
                    <asp:Label ID="lblQ4" runat="server" Text=""></asp:Label></b>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,4,'optionQ4');">
                <asp:Label ID="lblQ4O4" runat="server" class="optionQ4" Text="option4"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,3,'optionQ4');">
                <asp:Label ID="lblQ4O3" runat="server" class="optionQ4" Text="option3"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,2,'optionQ4');">
                <asp:Label ID="lblQ4O2" runat="server" class="optionQ4" Text="option2"></asp:Label>
            </td>
            <td class="answerRow answer" onclick="SetQuestionAnswer(this,1,'optionQ4');">
                <asp:Label ID="lblQ4O1" runat="server" class="optionQ4" Text="option1"></asp:Label>
            </td>
            <td class="answerRow answer">
                <asp:TextBox ID="txtQ4" runat="server" TextMode="MultiLine" Width="200px"  Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtQ4" ControlToValidate="txtQ4" ErrorMessage="d. Rationale explanation is mandatory"
                    runat="server" ValidationGroup="RiskAssessmentValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <div style="width: 100%; font-family: Arial; position: fixed; bottom: 0; left: 0;
        background: white; z-index: 999999; border-top: 4px solid #e0301e; padding: 5px 5px 5px 5px;">
        <div style="float: left; padding: 5px 15px 0px 10px; font-size: 9pt;">
            Page Controls
        </div>
        <div style="float: left; width: 300px">
            <asp:Button ID="btnCancel" runat="server" Text="Back" CssClass="iconButton Exit"
                Width="65" OnClick="btnCancel_OnClick" OnClientClick="return confirm('You are about to leave the page, any unsaved changes will be lost. Do you wish to continue?');"
                CausesValidation="false" />
            <asp:Button ID="btnSave" runat="server" Text="Save Risk Assessment" CssClass="iconButton Save"
                Width="200" OnClick="btnSave_OnClick" CausesValidation="true" ValidationGroup="RiskAssessmentValidation" />
            <uc:StatusControl Visible="false" runat="server" ID="ucStatusControl1" ShowHistory="false"
                ShowCurrent="false" ShowNext="true" />
        </div>
    </div>
</asp:Content>
