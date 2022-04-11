<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WStatusDiagram.ascx.cs" Inherits="PwC.Common.Controls.WorkflowControl.StatusDiagram.StatusDiagram" %>
<style type="text/css">

    .addstage-textbox
    {
        margin: -3px 0 20px 86px;
        width: 350px;
    }

    .addstage-button
    {
        width: 60px;
        height: 22px;
    }

</style>

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="svg0" height="540px" width="4000px" 
    onmousemove="moveelement(event)" onmouseup="dropElement(event)" onmousedown="mousedownCanvas(event)">

    <script type="text/javascript">
         
        var selectedElement = null;
        var currentX = 0;
        var currentY = 0;
        var originalX = 0;
        var originalY = 0;
        var fromValue = null;
        var statusID = 0;
        var inSelectionMode = false;

        function svg_attr(n, a) {
            if (n != null) {
                return n.getAttributeNS(null, a);
            }
        }

        function svg_setattr(n, a, v) {
            if (n != null) {
                return n.setAttributeNS(null, a, v);
            }
        }

        function svg_get(type, id) {
            return document.getElementById(type + id);
        }


        $(document).ready(function () {
            $(document).on("contextmenu", function (e) {
                if (e.target.id == "svg0" || e.target.id == "divNewNodeInnerModal") {
                    e.preventDefault();
                }
            })
        });


        function mousedownCanvas(event) {
            
            // Right click
            if (event.button == 2) {

                // If user is clicking on the canvas somewhere and not on a specific node
                if (event.target.id == "svg0") {

                    $('#<%= divAddWorkflowNodeModal.ClientID %>').children().css({ "top": event.clientY, "left": event.clientX });

                    $('#<%= divAddWorkflowNodeModal.ClientID %>').show();
                    $('#<%= hidXCoordinate.ClientID %>').val(event.offsetX);
                    $('#<%= hidYCoordinate.ClientID %>').val(event.offsetY);


                    
                    // Edit labels and button text to reflect editing
                    $('#lblAddWFStage').text("Add Workflow Stage");
                    $('#<%= btnAddWorkflowNode.ClientID %>').val("Add");
                    $('#<%= txtStageName.ClientID %>').val("");
                }
                
            }

            if (event.button == 0) {
                $('#<%= divAddWorkflowNodeModal.ClientID %>').hide();
            }
        }


        function mousedownNode(event) {

            // only left clicks
            if (event.button == 0) {

                selectedElement = document.getElementById($(event.target).attr('class').split('|')[0]);
                fromValue = $(event.target).attr('class').split('|')[1];

                
                originalX = parseInt(selectedElement.getAttributeNS(null, "transform").replace("translate(", "").replace(")", "").split(",")[0]);
                originalY = parseInt(selectedElement.getAttributeNS(null, "transform").replace("translate(", "").replace(")", "").split(",")[1]);

                currentX = event.clientX;
                currentY = event.clientY;

            }

            if (event.button == 2) {

                // Get and set fromValue and statusID
                fromValue = $(event.target).attr('class').split('|')[1];
                statusID = $(event.target).attr('class').split('|')[2];

                $('#<%= hidStatusID.ClientID %>').val(statusID);
                $('#<%= txtStageName.ClientID %>').val(fromValue);

                // Position the modal to where the mouse was clicked
                $('#<%= divAddWorkflowNodeModal.ClientID %>').children().css({ "top": event.clientY, "left": event.clientX });

                // Edit labels and button text to reflect editing
                $('#lblAddWFStage').text("Edit Workflow Stage");
                $('#<%= btnAddWorkflowNode.ClientID %>').val("Edit");


                $('#<%= divAddWorkflowNodeModal.ClientID %>').show();


            }
        }

        function moveelement(event) {

            if (selectedElement != null) {
                newX = event.clientX - currentX;
                newY = event.clientY - currentY;

                newTransform = "translate(" + (originalX + newX) + "," + (originalY + newY) + ")";

                // Reposition arrows
                var allArrows = document.getElementsByClassName("workflowline");

                for (i = 0; i < allArrows.length; i++) {
                    // Reposition FROM arrows
                    if (allArrows[i].id.split("|")[1] == fromValue) {
                        svg_setattr(allArrows[i], "x1", (originalX + newX));
                        svg_setattr(allArrows[i], "y1", (originalY + newY));
                    }

                    // Reposition FROM arrows
                    if (allArrows[i].id.split("|")[2] == fromValue) {
                        svg_setattr(allArrows[i], "x2", (originalX + newX));
                        svg_setattr(allArrows[i], "y2", (originalY + newY));
                    }
                }
                
                // Reposition Text
                var allRoles = document.getElementsByClassName("workflowrole");

                for (i = 0; i < allRoles.length; i++) {
                    // Reposition text
                    if (allRoles[i].id.split("|")[1] == fromValue) {
                        svg_setattr(allRoles[i], "x", (parseInt(svg_attr(allRoles[i], "x")) + newX));
                        svg_setattr(allRoles[i], "y", (parseInt(svg_attr(allRoles[i], "y")) + newY));
                    }
                }

                svg_setattr(selectedElement, "transform", newTransform);
                currentX = event.clientX;
                currentY = event.clientY;
                originalX += newX;
                originalY += newY;
            }
            
        }

        function chooseWorkflow(workflow) {

            if (workflow == "from") {
                // Show selection label
                $('#workflowSelection').val("");
                $('#workflowSelection').show();
            }

        }


        function dropElement(event) {
            if (selectedElement != null) {

                // Save position
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: window.location.href + "/SaveNodePosition",
                    data: "{'fromValue': '" + fromValue + "','newX': " + originalX + ",'newY': " + originalY + "}",
                    dataType: "json",
                    success: function (response) {

                    }
                });


                selectedElement = null;
                fromValue = null;

                // Reset textboxes and labels
                $('#lblAddWFStage').text("Add Workflow Stage");
                $('#<%= txtStageName.ClientID %>').val("");
                $('#<%= btnAddWorkflowNode.ClientID %>').val("Add");
            }
        }

    </script>

    <style type="text/css">
        g.filter6 {
            cursor: pointer;
        }

        g.filter6.a.Current rect {
            fill: #ffAD10;
        }

        g.filter6.a.Next rect {
            fill: #E3001A;
        }

        g.filter6.a rect {
            fill: rgb(200,200,200);
            stroke: #ffffff;
            stroke-width: 1px;
        }

        g.filter6.a.selected rect {
            fill: rgb(0,194,200);
        }

        g.filter6.a.done rect {
            fill: rgb(57,89,99);
        }

        g.filter6 p {
            color: white;
            fill: white;
            text-align: center;
            padding: 4px;
        }

        g.filter6 text tspan {
            fill: white;
        }

        line.link1 {
            stroke: #395963;
            stroke-width: 2;
            fill: #395963;
            marker-end: url(#triangle);
        }

        line.link2 {
            stroke: #395963;
            stroke-width: 2;
            fill: #395963;
            marker-end: url(#triangle2);
        }

        line.link3 {
            stroke: #FF3838;
            stroke-width: 2;
            fill: #FF3838;
            marker-end: url(#triangle3);
        }

        line.link4 {
            stroke: #FF3838;
            stroke-width: 2;
            fill: #FF3838;
        }

    </style>

    <text x="20" y="10" class="workflowSelection" id="workflowSelection">
        <tspan x="0" y="0">Select 'From' status</tspan>
    </text>

    

    <marker id="triangle" viewBox="-120 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
        <path d="M -120 0 L -110 5 L -120 10 z" />
    </marker>
    <marker id="triangle2" viewBox="-200 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
        <path d="M -200 0 L -190 5 L -200 10 z" />
    </marker>
    <marker id="triangle3" viewBox="-120 0 10 10" refX="0" refY="5" fill="#FF3838" stroke="#FF3838" markerWidth="6" markerHeight="6" orient="auto">
        <path d="M -120 0 L -110 5 L -120 10 z" />
    </marker>

    

    <asp:Repeater ID="rptWorkflowDiagramArrows" runat="server">
        <ItemTemplate>

            <text x="<%#Eval("This_x") %>" y="<%#Eval("This_y") %>" class="workflowrole" id="<%# "workflowrole" + "|" + Eval("FromValue").ToString() + "|" + Eval("ToValue").ToString() %>">
                <tspan x="<%#Convert.ToInt32(Eval("This_x")) + ((Convert.ToInt32(Eval("Next_x")) - Convert.ToInt32(Eval("This_x"))) / 2) %>" y="<%# Convert.ToInt32(Eval("RowNum")) % 2 == 0 ? Convert.ToInt32(Eval("This_y")) - 30 : Convert.ToInt32(Eval("This_y")) + 100 %>"><%# Eval("Role") %></tspan>
            </text>

            <line id="<%# "workflowline" + "|" + Eval("FromValue").ToString() + "|" + Eval("ToValue").ToString() %>" transform="translate(75,35)" class="workflowline link1" x1="<%#Eval("This_x") %>" y1="<%#Eval("This_y") %>" x2="<%#Eval("Next_x") %>" y2="<%#Eval("Next_y") %>"></line>

            <text x="<%#Eval("This_x") %>" y="<%#Eval("This_y") %>" id="<%# "workflowsteptext" + "|" + Eval("FromValue").ToString() + "|" + Eval("ToValue").ToString() %>" class="workflowsteptext"  style="display: block;">
                <tspan x="<%#Eval("This_x") %>" y="<%#Eval("This_y") %>"><%# Eval("StepText") %></tspan>
            </text>
        </ItemTemplate>
    </asp:Repeater>
    

    <asp:Repeater ID="rptWorkflowDiagramNodes" runat="server">
        <ItemTemplate>
            <g id="<%# "diagramNode" + Eval("FromValue").ToString().Replace(" ", "") %>" statustext='<%#Eval("FromValue") %>' transform="translate(<%#Eval("Design_x") %>,<%#Eval("Design_y") %>)" baseclass="filter6 a" selected="true" 
                class="filter6 a <%# Eval("State").ToString() %>"  onmousedown="mousedownNode(event)" onmouseup="dropElement(event)">
                <rect height="70" width="150" y="0" x="0" class="<%# "diagramNode" + Eval("FromValue").ToString().Replace(" ", "") + "|" + Eval("FromValue").ToString() + "|" + Eval("StatusID").ToString() %>"></rect>

                <text x="0" y="0">
                    <tspan x="5" y="25" class="<%# "diagramNode" + Eval("FromValue").ToString().Replace(" ", "") + "|" + Eval("FromValue").ToString() + "|" + Eval("StatusID").ToString() %>"><%#((Eval("FromValue").ToString().Split(' ').Length >= 1) ? Eval("FromValue").ToString().Split(' ')[0] : "") + ' ' + ((Eval("FromValue").ToString().Split(' ').Length >= 2) ? Eval("FromValue").ToString().Split(' ')[1] : "") %></tspan>
                    <tspan x="5" y="40" class="<%# "diagramNode" + Eval("FromValue").ToString().Replace(" ", "") + "|" + Eval("FromValue").ToString() + "|" + Eval("StatusID").ToString() %>"><%#((Eval("FromValue").ToString().Split(' ').Length >= 3) ? Eval("FromValue").ToString().Split(' ')[2] : "") + ' ' + ((Eval("FromValue").ToString().Split(' ').Length >= 4) ? Eval("FromValue").ToString().Split(' ')[3] : "") + ' ' + ((Eval("FromValue").ToString().Split(' ').Length >= 5) ? Eval("FromValue").ToString().Split(' ')[4] : "") %></tspan>
                    <tspan x="5" y="55" class="<%# "diagramNode" + Eval("FromValue").ToString().Replace(" ", "") + "|" + Eval("FromValue").ToString() + "|" + Eval("StatusID").ToString() %>"><%#((Eval("FromValue").ToString().Split(' ').Length >= 6) ? Eval("FromValue").ToString().Split(' ')[5] : "") + ' ' + ((Eval("FromValue").ToString().Split(' ').Length >= 7) ? Eval("FromValue").ToString().Split(' ')[6] : "") + ' ' + ((Eval("FromValue").ToString().Split(' ').Length >= 8) ? Eval("FromValue").ToString().Split(' ')[7] : "") %></tspan>
                    <tspan x="5" y="70" class="<%# "diagramNode" + Eval("FromValue").ToString().Replace(" ", "") + "|" + Eval("FromValue").ToString() + "|" + Eval("StatusID").ToString() %>"><%#((Eval("FromValue").ToString().Split(' ').Length >= 9) ? Eval("FromValue").ToString().Split(' ')[8] : "") + ' ' + ((Eval("FromValue").ToString().Split(' ').Length >= 10) ? Eval("FromValue").ToString().Split(' ')[9] : "") + ' ' + ((Eval("FromValue").ToString().Split(' ').Length >= 11) ? Eval("FromValue").ToString().Split(' ')[10] : "") %></tspan>
                </text>
            </g>

            
        </ItemTemplate>
    </asp:Repeater>

</svg>

<div id="divAddWorkflowNodeModal" runat="server" style="display: none;">
    <div class="modal" id="divNewNodeInnerModal" style="width: 500px; position: fixed;">
        <div class="modal-title">
            <label id="lblAddWFStage">Add Workflow Stage</label>
        </div>
        <div class="modal-content">

            <div class="form-panel">
                <div class="form-panel-row" style="margin-top: 10px;">
                    <div style="float: left;">
                        Name:
                    </div>
                    <div style="float: left;">
                        <asp:TextBox ID="txtStageName" CssClass="addstage-textbox" runat="server"></asp:TextBox>
                    </div>
                </div>

            </div>
            <asp:HiddenField ID="hidXCoordinate" runat="server" />
            <asp:HiddenField ID="hidYCoordinate" runat="server" />
            <asp:HiddenField ID="hidStatusID" runat="server" />
            <asp:HiddenField ID="hidStatusIDFrom" runat="server" />
            <asp:HiddenField ID="hidStatusIDTo" runat="server" />


            <div style="width: 100%; float: left;">
                <asp:Button ID="btnCloseAddWorkflowNode" OnClick="btnCloseAddWorkflowNode_Click" runat="server" Text="Close" CssClass="addstage-button" />
                <asp:Button ID="btnAddWorkflowNode" OnClick="btnAddWorkflowNode_Click" runat="server" Text="Add" CssClass="addstage-button" OnClientClick="inSelectionMode = true;" />
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $stepText = $('#txtStepText');
        $stepText.on('mouseover', '#workflowLine', function () {
            $stepText.hide();
        });
        $stepText.on('mouseout', '#workflowLine', function () {
            $stepText.show();
        });
    })
</script>