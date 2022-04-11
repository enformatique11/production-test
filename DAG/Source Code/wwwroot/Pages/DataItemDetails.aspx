<%@ Page Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="DataItemDetails.aspx.cs" Inherits="PwC.Pages.DataItemDetails" Title="Data Field Definition" %>

<%@ Register Src="~/Common/Controls/ucAttachmentViewer.ascx" TagName="AttachmentViewer" TagPrefix="uc1" %>
<%@ Register Src="~/Common/Controls/OwnerAssigner.ascx" TagName="OwnerAssigner" TagPrefix="uc1" %>
<%@ Register Src="~/Common/Controls/DataQualityCriteriaViewer.ascx" TagName="DataQualityCriteriaViewer" TagPrefix="uc1" %>
<%@ Register Src="~/Common/Controls/DataQualityCriteriaInheritedViewer.ascx" TagName="DataQualityCriteriaInheritedViewer" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function fnConfirmExit() 
        {
            if (confirm("Are you sure you want to exit the page without saving?")) 
            {
                return true;      
            }      
            
            return false;      
        }           
        
        function drpUsedGroup_OnSelectedIndexChange()
        {
            var dropdownvalue = $('#ctl00_MainContent_drpUsedGroups option:selected').val();
            var dropdowntext = $('#ctl00_MainContent_drpUsedGroups option:selected').text();
            
            if (dropdowntext == dropdownvalue) $('#ctl00_MainContent_txtGroup').val(dropdowntext);      
            else $('#ctl00_MainContent_txtGroup').val('');                  
        } 
        
        function drpUsedMateriality_OnSelectedIndexChange()
        {
            var dropdownvalue = $('#ctl00_MainContent_drpUsedMateriality option:selected').val();
            var dropdowntext = $('#ctl00_MainContent_drpUsedMateriality option:selected').text();
            
            if (dropdowntext == dropdownvalue) $('#ctl00_MainContent_txtMateriality').val(dropdowntext);      
            else $('#ctl00_MainContent_txtMateriality').val('');                  
        }      
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 runat="server" ID="heading1">Data Item Details</h1>
    <asp:UpdatePanel ID="updPanel" runat="server">        
        <ContentTemplate>
            <asp:ValidationSummary ID="vsDefinition" runat="server" class="validationsummary" HeaderText="<h3>Please provide the following information:</h3>" ValidationGroup="DataItemValidation" CssClass="errorSummary" Visible="true" />        
        
            <div id="mainDiv" class="formPanel" runat="server" >
                <div id="divTitle" class="formPanelRow" runat="server">
                    <div class="pItemLbl_large">
                        Title
                    </div>
                    <div class="pItemCtl_auto">
                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="200" Width="530px" Text='' />
                        <asp:RequiredFieldValidator ID="rfvtxtTitle" runat="server" ValidationGroup="DataItemValidation" ControlToValidate="txtTitle" ErrorMessage="Please enter a title" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div id="divDescription" class="formPanelRow_x3" runat="server">
                    <div class="pItemLbl_large">
                        Description
                    </div>
                    <div class="pItemCtl_auto">
                        <asp:TextBox ID="txtDescription" runat="server" Width="530px" Height="70px" Text=''
                            TextMode="MultiLine" />
                        <%--<asp:RequiredFieldValidator ID="rfvDescription" runat="server" ValidationGroup="DataItemValidation" ControlToValidate="txtDescription" ErrorMessage="Please enter a description" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                        <asp:RegularExpressionValidator ID="regDescription" runat="server" ValidationGroup="DataItemValidation" ControlToValidate="txtDescription" ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The description must contained less than 4000 characters" SetFocusOnError="true">*</asp:RegularExpressionValidator>              
                    </div>
                </div>
                <div class="formPanelRow" runat="server">
                    <div class="pItemLbl_large">
                        Group
                    </div>
                    <div class="pItemCtl">
                        <asp:TextBox ID="txtGroup" runat="server" MaxLength="200" Width="180px" Text='' />                        
                    </div>
                    <div id="divUsedGroups" runat="server">
                        <div class="pItemLbl_large" style="width:120px; font-size:8pt;">
                            Used Groups &nbsp;&nbsp;
                            <a href="#">
                                <asp:Image runat="server" ImageAlign="AbsMiddle" ImageUrl="~/img/PwCIcons/15x15/info_icon15.png" CssClass="icon15x15 PwCOrange" />
                                <span>
                                    <h2>Previously Used Groups</h2>
                                    <p>
                                        The previously used drop down list displays all groups that have been used for any data items within this definition.<br /><br />
                                        Selecting a group from this drop down list will automatically populate the Group input field.
                                    </p>
                                </span>
                            </a>
                        </div>
                        <div class="pItemCtl">
                            <asp:DropDownList ID="drpUsedGroups" runat="server" Width="200" Style="background-color:#FCFFCC;" />
                        </div>
                    </div>
                </div>
                <div class="formPanelRow" runat="server" visible="false">
                    <div class="pItemLbl_large">
                        Materiality
                    </div>
                    <div class="pItemCtl">
                        <asp:TextBox ID="txtMateriality" runat="server" MaxLength="200" Width="180px" Text='' />
                        <%--<asp:RequiredFieldValidator ID="rfvtxtMateriality" runat="server" ValidationGroup="DataItemValidation" ControlToValidate="txtMateriality" ErrorMessage="Please enter a materiality" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                    </div>
                    <div id="divUsedMateriality" runat="server">
                        <div class="pItemLbl_large" style="width:120px; font-size:8pt;">
                            Used Materiality &nbsp;&nbsp;
                            <a href="#">
                                <asp:Image runat="server" ImageAlign="AbsMiddle" ImageUrl="~/img/PwCIcons/15x15/info_icon15.png" CssClass="icon15x15 PwCOrange" />
                                <span>
                                    <h2>Previously Used Materiality</h2>
                                    <p>
                                        The previously used drop down list displays all materiality that have been used for any data items within the data report.<br /><br />
                                        Selecting a materiality from this drop down list will automatically populate the Materiality input field.
                                    </p>
                                </span>
                            </a>
                        </div>
                        <div class="pItemCtl">
                            <asp:DropDownList ID="drpUsedMateriality" runat="server" Width="200" Style="background-color:#FCFFCC;" />
                        </div>
                    </div>
                </div>
                <div class="formPanelRow_x3" runat="server" visible="false">
                    <div class="pItemLbl_large">
                        Materiality Justification
                    </div>
                    <div class="pItemCtl_auto">
                        <asp:TextBox ID="txtMaterialityJustification" runat="server" Width="530px" Height="70px"
                            Text='' TextMode="MultiLine" />
                    </div>
                </div>
                <div class="formPanelRow" runat="server">
                    <div class="pItemLbl_large">
                        External Information
                    </div>
                    <div class="pItemCtl_auto">
                        <asp:CheckBox ID="chkbxExternalInformation" runat="server" Text="Tick if Yes" TextAlign="Right" />
                    </div>
                </div>
                <div id="divUsageInputFields" runat="server">
                    <div class="formPanelRow_x2" runat="server">
                        <div class="pItemLbl_large">
                            Expert Judgement Used?
                        </div>
                        <div class="pItemCtl_auto">
                            <asp:CheckBox ID="chkbxJudgementUsed" runat="server" Text="Tick if Yes" TextAlign="Right" />
                        </div>
                    </div>
                    <div id="divJudgementComments" class="formPanelRow_x3" runat="server">
                        <div class="pItemLbl_large">
                            Expert Judgement Comments
                        </div>
                        <div class="pItemCtl_auto">
                            <asp:TextBox ID="txtJudgementComments" runat="server" Width="530px" Height="70px"
                                Text='' TextMode="MultiLine" />
                        </div>
                    </div>
                    <div class="formPanelRow_x3" runat="server" visible="false">
                        <div class="pItemLbl_large">
                            Usage
                        </div>
                        <div class="pItemCtl_auto">
                            <asp:TextBox ID="txtUsage" runat="server" Width="530px" Height="70px" Text='' TextMode="MultiLine" />
                        </div>
                    </div>
                </div>
                <div class="formPanelRow_x3" runat="server" visible="false">
                    <div class="pItemLbl_large">
                        Mapping Comments
                    </div>
                    <div class="pItemCtl_auto">
                        <asp:TextBox ID="txtMappingComments" runat="server" Width="530px" Height="70px" Text='' TextMode="MultiLine" />
                    </div>
                </div>
                <div class="formPanelRow_x3" runat="server">
                    <div class="pItemLbl_large">
                        Additional Comments
                    </div>
                    <div class="pItemCtl_auto">
                        <asp:TextBox ID="txtMonitoringComments" runat="server" Width="530px" Height="70px" Text='' TextMode="MultiLine" />
                    </div>
                </div>
                <div class="controls" runat="server" style="padding: 0px 0px 10px 0px">
                    <asp:Button ID="btnSave" runat="server" Text="Save Data Item Details" CssClass="iconButton Save" Width="180" OnClick="btnSave_Click" CausesValidation="true" ValidationGroup="DataItemValidation" />
                    <asp:Button ID="btnCancel" runat="server" Text="Back" CssClass="iconButton Exit" Width="65" OnClick="btnCancel_Click" OnClientClick="javascript:return fnConfirmExit()" />               
                </div>
                <div class="formPanelFooter" id="divLastUpdated" runat="server">
                    <div class="pItemCtl_auto">
                        <asp:Label ID="lblLastUpdatedBy" runat="server" /></div>
                    <div class="pItemCtl_auto">
                        <asp:Label ID="lblLastUpdatedDate" runat="server" /></div>
                </div>
            </div>
            <div id="divOwners" runat="server" style="margin-bottom:15px;">
                <uc1:OwnerAssigner ID="ucOwners" runat="server" ReferenceType="DATAFIELD" />
            </div>
            <div id="divDataQualityCriteria" runat="server" style="margin-bottom:15px;">
                <uc1:DataQualityCriteriaViewer ID="DQCViewer" runat="server" ReferenceType="DATAFIELD" ></uc1:DataQualityCriteriaViewer>
            </div>
            <div id="divDataQualityCriteriaInherited" runat="server" style="margin-bottom:15px;">
                <uc1:DataQualityCriteriaInheritedViewer ID="DQCInheritedViewer" runat="server" ReferenceType="DATAFIELD" ></uc1:DataQualityCriteriaInheritedViewer>
            </div>
            <div id="divMappings" runat="server" style="margin-bottom:15px;">
                <div class="fullWidthBlock" style="margin-bottom: 2px; height:26px;">
                    <div style="float: left;">
                        <h2>Data Mappings</h2>                        
                    </div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Button ID="btnShowChart" runat="server" Text="Show Chart" OnClick="btnShowChart_Click" Visible="true" />
                    </div>
                    <div class="alignRight">
                        <asp:Button ID="btnAddMapping" runat="server" Text="Add Mapping" CssClass="plusIcon"
                            Width="120px" OnClick="btnAddMapping_OnClick" />
                    </div>
                </div>
                <asp:GridView ID="gvMappings" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsMappings"
                    PageSize="15" >
                    <EmptyDataTemplate>
                        There are no data mappings currently assigned.
                    </EmptyDataTemplate>
                    <RowStyle CssClass="row1" />
                    <AlternatingRowStyle CssClass="row0" />
                    <PagerStyle CssClass="pager" />
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="180px">
                            <HeaderTemplate runat="server">
                                Source Definition and Item</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# "<b>" + Eval("SourceDefinitionTitle") + "</b> (<i>" + Eval("SourceDefinitionSubTitle") + "</i>)<br/>" + Eval("SourceField") %> '></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="80px">
                            <ItemTemplate>
                                <asp:Image runat="server" ImageAlign="Middle" ImageUrl="~/img/arrow_right.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="180px">
                            <HeaderTemplate runat="server">
                                Target Definition and Item</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# "<b>" + Eval("TargetDefinitionTitle") + "</b> (<i>" + Eval("TargetDefinitionSubTitle") + "</i>)<br/>" + Eval("TargetField") %> '></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Type" DataField="MappingType" SortExpression="MappingType" />
                        <asp:BoundField HeaderText="Risk" DataField="MappingRisk" SortExpression="MappingRisk" />
                        <asp:BoundField HeaderText="Mapping Description" DataField="TruncatedDescription" SortExpression="TruncatedDescription" />
                        <asp:TemplateField HeaderText="Edit" SortExpression="ID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnEditMapping" runat="server" OnClick="EditMapping"  CausesValidation="false" intValue1='<%# Eval("ID") %>' intValue2='<%# Eval("SourceID") %>' intValue3='<%# Eval("TargetID") %>' CssClass="icon20x20 PwCOrange" ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" SortExpression="ID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnDeleteMapping" runat="server" OnClick="DeleteMapping"  CausesValidation="false" intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png' CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want to delete this mapping?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div id="divDeficiencies" runat="server" style="margin-bottom:15px;">
                <div class="fullWidthBlock" style="margin-bottom: 2px; height:26px;">
                    <div style="float: left;">
                        <h2>Deficiencies</h2>
                    </div>
                    <div class="alignRight">
                        <asp:Button ID="btnAddDeficiency" runat="server" Text="Add Deficiency" CssClass="plusIcon"
                            Width="130px" OnClick="btnAddDeficiency_OnClick" />
                    </div>
                </div>
                <asp:GridView ID="gvDeficiencies" runat="server" AutoGenerateColumns="false" GridLines="None"
                    CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDeficiencies"
                    PageSize="15">
                    <EmptyDataTemplate>
                        There are no deficiencies currently assigned.
                    </EmptyDataTemplate>
                    <RowStyle CssClass="row1" />
                    <AlternatingRowStyle CssClass="row0" />
                    <PagerStyle CssClass="pager" />
                    <Columns>
                        <asp:BoundField HeaderText="Title" DataField="Title" SortExpression="Title" />                        
                        <asp:BoundField HeaderText="Created Date" DataField="CreatedDate" SortExpression="CreatedDate" />
                        <asp:BoundField HeaderText="Assigned To" DataField="Owners" SortExpression="Owners" />
                        <asp:BoundField HeaderText="Impact" DataField="DeficiencyLevel" SortExpression="DeficiencyLevel" />
                        <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status" />
                        <asp:BoundField HeaderText="Target Date" DataField="TargetDate" SortExpression="TargetDate" />
                        <asp:BoundField HeaderText="Last Updated" DataField="LastUpdatedDate" SortExpression="LastUpdatedDate" />
                        <asp:TemplateField HeaderText="Edit" SortExpression="ID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnEditDeficiency" runat="server" OnClick="EditDeficiency"  CausesValidation="false" intValue1='<%# Eval("ID") %>' CssClass="icon20x20 PwCOrange" ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" SortExpression="ID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnDeletedDeficiency" runat="server" OnClick="DeleteDeficiency"  CausesValidation="false" intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png' CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want to delete this deficiency?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            
            <div id="divOwnerAndAttachments" runat="server" visible="false" style="margin-bottom:15px;">
                <uc1:AttachmentViewer ID="atvAttachments" runat="server" BehaviourID="attachments"
                    ReferenceType="DATAFIELD" Title="Attachments" ShowAddAttachment="true" EnableDelete="true" />
            </div>
            
            <asp:SqlDataSource ID="sdsDeficiencies" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                SelectCommand="uspDeficiencyGetListWithReferenceIDAndType" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Role" SessionField="UserRole" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:QueryStringParameter Name="ReferenceID" QueryStringField="DataField" DbType="Int32"
                        ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="ReferenceType" Direction="Input" Type="String" DefaultValue="DATAFIELD" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Valid" Direction="Output" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="sdsMappings" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                SelectCommand="uspMappingGetListForDataFieldID_All" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Role" SessionField="UserRole" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:QueryStringParameter Name="DataFieldID" QueryStringField="DataField" DbType="Int32"
                        ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Valid" Direction="Output" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
