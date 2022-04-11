<%@ Page Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="PwC.Home" %>

<%@ Register TagPrefix="cc" TagName="QuickLinks" Src="~/Common/Controls/QuickLinks.ascx" %>
<%@ Register Src="~/Common/Controls/AttachmentViewer.ascx" TagName="AttachmentViewer"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
       
    </script>
   
    
    
     <div class="contentPanel">
        <div style="clear: both; padding-top: 20px;">
            <div style="margin-top: 10px; line-height: 20px; font-family: RobotoLight; line-height: 20px;
                font-size: 14px;">
                <div style="float: left; width: 470px; padding: 10px;">
                    <div class="StaticQuickLinkNew QLTop BrandColor4 bg" onclick="window.location = 'Pages/RegulatoryReturns.aspx?format=usage';">
                        <div style="color: white">
                            Regulatory returns
                        </div>
                    </div>
                    <div class="StaticQuickLinkNew QLMid BrandColor2 bg" onclick="window.location = 'Pages/DataSources.aspx?format=source';">
                        <div style="color: white">
                            Data sources
                        </div>
                    </div>
                    <div class="StaticQuickLinkNew QLBot BrandColor3 bg" onclick="window.location = 'ContactUs.aspx';">
                        <div style="color: white">
                            Contact Us
                        </div>
                    </div>
                </div>
                <div style="float: left; width: 400px; padding-right: 20px; padding-top: 10px;">
                    This tool records information on the metrics required by Wales &amp; West Utilities.<br />
                    <br />
                    The tool also highlights the lineage of the data used to produce the regulation
                    reports.</div>
            </div>
        </div>
        <div style="clear: both; padding-top: 40px;">

        <asp:Image ID="Image1" runat="server" Width="130px" ImageUrl= "~/img/Brand/HomeIcon1.png" style="float:left; margin-left:50px;"   />
        <asp:Image ID="Image2" runat="server" Width="130px" ImageUrl= "~/img/Brand/HomeIcon2.png" style="float:left; margin-left:50px;"   />
        <asp:Image ID="Image3" runat="server" Width="130px" ImageUrl= "~/img/Brand/HomeIcon3.png" style="float:left; margin-left:50px;"   />
        <asp:Image ID="Image4" runat="server" Width="130px" ImageUrl= "~/img/Brand/HomeIcon4.png" style="float:left; margin-left:50px;"   />
        <asp:Image ID="Image5" runat="server" Width="130px" ImageUrl= "~/img/Brand/HomeIcon5.png" style="float:left; margin-left:50px;"   />
        
        </div>
    </div>
</asp:Content>
