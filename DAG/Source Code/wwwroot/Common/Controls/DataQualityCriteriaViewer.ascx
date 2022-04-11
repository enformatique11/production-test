<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="DataQualityCriteriaViewer.ascx.cs" Inherits="PwC.Common.Controls.DataQualityCriteriaViewer" %>

<script type="text/javascript" language="javascript">
    var currentlyExpandedPanel = null;
    var currentlyExpandedButton = null;
    var currentlySelectedDQCXRefID = null;
    
    // toggles the expanded status of a panel and ensures that
    // only one panel is open at any given time.
    function toggleExpand(controlPanel, DQCXRefID, expandedButton)
    {            
        // if the panel currently expanded is the same as the
        // control panel clicked, then toggle it (which will 
        // essentially close it). Then set currentlyExpanded to
        // null as nothing will be open.
        if (currentlyExpandedPanel == controlPanel)
        {
            $('#' + currentlyExpandedPanel).slideToggle(250);             
            currentlyExpandedButton.style.backgroundImage = 'url(../img/expand_plus.png)';
            
            currentlyExpandedButton = null;            
            currentlyExpandedPanel = null;
            currentlySelectedDQCXRefID = null;
        }        
        else
        {
            // if the panels are different, then close the previously 
            // expanded panel.
            if (currentlyExpandedPanel != null)
            {
                $('#' + currentlyExpandedPanel).slideToggle(250); 
                currentlyExpandedButton.style.backgroundImage = 'url(../img/expand_plus.png)';
            }
               
            $('#' + controlPanel).slideToggle(250);
            expandedButton.style.backgroundImage = 'url(../img/expand_minus.png)';  
                    
            currentlyExpandedButton = expandedButton;
            currentlyExpandedPanel = controlPanel;
            currentlySelectedDQCXRefID = DQCXRefID;
        }
    }
    
    function AssignControls()
    {                       
        if (currentlySelectedDQCXRefID != null)
        {
            if (querySt("DataField") != null) window.location = "Controls.aspx?DataField=" + querySt("DataField") + "&DQCID=" + currentlySelectedDQCXRefID;  
            else window.location = "Controls.aspx?Definition=" + querySt("ID") + "&DQCID=" + currentlySelectedDQCXRefID;                      
        } 
        
        return true;
    }
    
    function querySt(id) 
    {
        URL = window.location.search.substring(1);
        queryStringItems = URL.split("&");
        for (i=0;i<queryStringItems.length;i++) 
        {
            ft = queryStringItems[i].split("=");
            if (ft[0] == id) 
            {
                return ft[1];
            }
        }
        return null;
    }
</script>

<div id="divDQC" runat="server" visible="false">
    <div class="fullWidthBlock" style="margin-bottom:2px; height:26px;">
        <div style="float:left;">
            <h2 id="TitleHeading" runat="server"></h2>
        </div>
        <div class="alignRight">
            <%--<asp:Button ID="btnAssignControls" runat="server" Text="Assign Controls" CssClass="plusIcon" Width="120px" OnClick="btnAssignControls_OnClick" />--%>
            <asp:Button ID="btnAssignDataQualityCriteria" runat="server" Text="Assign Criteria" CssClass="plusIcon" Width="130px" OnClick="btnAssignDataQualityCriteria_OnClick"/>
        </div>
    </div>
    
    <div id="DQCHeaderEmpty" runat="server" class="DQCPanelHeaderEmpty" style="padding-left:5px;">
        <span style="font-family:Arial; font-size:9pt; color:#000">There are no data quality criteria currently assigned.</span>
    </div>

    <div id="DQCHeader" runat="server" class="DQCPanelHeader">                            
        <div class="DQCPanelType" style="margin-left: 34px;">Type</div>
        <div class="DQCPanelTitle">Title</div>
        <div class="DQCPanelDescription">Description</div>
        <div class="DQCPanelNumControls">No. Controls</div>
    </div>  

    <asp:Repeater ID="rptDQC" runat="server" OnItemDataBound="rptDQC_OnItemDataBound">                   
        <ItemTemplate>
            <div id='<%# "DQC" + Container.ItemIndex %>' class='<%# "DQCPanelItemRow" + (Container.ItemIndex % 2) + "_NoHover" %> "'>
                <div class="DQCPanelExpandButton" onclick="toggleExpand('<%# "DQC" + Container.ItemIndex + "_Controls" %>', '<%# DataBinder.Eval(Container.DataItem, "DQCXRefID") %>', this);">
                    
                </div>
                <div class="DQCPanelType">
                    <%# DataBinder.Eval(Container.DataItem, "Type") %>
                </div>
                <div class="DQCPanelTitle">
                    <%# DataBinder.Eval(Container.DataItem, "Title") %>
                </div>
                <div class="DQCPanelDescription">
                    <%# DataBinder.Eval(Container.DataItem, "Description") %>
                </div>                
                <div class="DQCPanelNumControls">
                    <%# DataBinder.Eval(Container.DataItem, "NumControls") %>
                </div>
                <div style="clear:both"></div>                           
                
                    <div id='<%# "DQC" + Container.ItemIndex + "_Controls" %>' class="DQCPanelControls">
                        <div class="DQCPanelControlSectionTitle">                                            
                            Controls
                        </div>  
                        <div style="float: left; padding:0px 5px 5px 5px;">
                            <asp:Button ID="btnAssign" runat="server" Text="Assign Controls" CssClass="plusIcon" Width="130px" Height="20px" OnClientClick="AssignControls()" />
                        </div>   
                    
                        <asp:Repeater ID="rptDQC_Controls" runat="server">
                            <HeaderTemplate>
                                <div class="DQCPanelControlHeader">                                            
                                    <div class="DQCPanelControlID">ID</div>
                                    <div class="DQCPanelControlTitle">Title</div>
                                    <div class="DQCPanelControlDescription">Description</div>
                                    <div class="DQCPanelControlMeasurement">Measurement</div>
                                    <div class="DQCPanelControlType">Type</div>
                                    <div class="DQCPanelControlOwnedBy">Owned By</div>
                                    <div class="DQCPanelControlQuality">Quality</div>
                                </div>  
                                <%--<div class"DQCPanelControlHeaderEmpty" visible="false">
                                    No controls are currently assigned to this Data Quality Criteria.
                                </div>  --%>                        
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class='<%# "DQCPanelControlItemRow" + (Container.ItemIndex % 2) %>'>
                                    <div class="DQCPanelControlID">
                                        <%# DataBinder.Eval(Container.DataItem, "ID") %>
                                    </div>
                                    <div class="DQCPanelControlTitle">
                                        <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                    </div>
                                    <div class="DQCPanelControlDescription">
                                        <%# DataBinder.Eval(Container.DataItem, "Description") %>
                                    </div>
                                    <div class="DQCPanelControlMeasurement">
                                        <%# DataBinder.Eval(Container.DataItem, "Measurement") %>
                                    </div>
                                    <div class="DQCPanelControlType">
                                        <%# DataBinder.Eval(Container.DataItem, "Type") %>
                                    </div>
                                    <div class="DQCPanelControlOwnedBy">
                                        <%# DataBinder.Eval(Container.DataItem, "OwnedBy") %>
                                    </div>  
                                    <div class="DQCPanelControlQuality">
                                        <%# DataBinder.Eval(Container.DataItem, "ControlQuality") %>
                                    </div>                                                                                                                      
                                </div>                                        
                            </ItemTemplate>
                        </asp:Repeater>
                    <div style="clear:both; height:0px;"></div>                                 
                </div>
            </div>                        
        </ItemTemplate>
    </asp:Repeater>
</div>