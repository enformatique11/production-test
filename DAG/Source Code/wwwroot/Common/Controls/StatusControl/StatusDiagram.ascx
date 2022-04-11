<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatusDiagram.ascx.cs"
    Inherits="PwC.Controls.StatusDiagram" %>
<script type="text/javascript">
    
</script>

<style type="text/css">
    g.filter6 {
        cursor: pointer;
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
        z-index: -10;
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

    .condition_text {
    }

    .title_text {
        font-weight: bold;
        font-size: 1.2em;
    }
</style>

<div runat="server" id="divStatusVisualisation" class="pnNewAttachment" style="padding-right: 3px;">
    <div id="svLink" runat="server" class='viewstat1' style="cursor: pointer; float: left" onclick="bindClick(this)">
    </div>
    <%-- <script>
        function bindClick<%=svLink.ClientID%>(){
            var status = $('#' + <%=svLink.ClientID%>.id).parent().parent().parent().prev().prev().text();
            showMeStatusDiagram($('#' + <%=svLink.ClientID%>.id), status, <%=svLink.ClientID%>.id);
        }
    </script>
    --%>
    <div style="display: none;">
        <div class="modal-fill" style="background-color: #939598;">
        </div>
        <div class="modal" style="width: 1200px; position: fixed; margin-left: -600px; height: 311px; background-color: white;">
            <div class="modal-title">
                <span style="float: left;">Status Visualisation</span>

                <input type="button" value="Close" style="float: right" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />

            </div>
            <div class="modal-content" style="height: 275px;">

                <div class="mainpanel" style="height: 270px; width: 1190px; overflow: auto;">

                    <div class="status-diagram-netdar">


                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                            id="svg0"
                            height="250px"
                            width="2700px">

                            <!-- Text -->
                            <text x="20" y="50" class="title_text">NetDAR Workflow</text>

                            <marker id="triangle" viewBox="-120 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                                <path d="M -120 0 L -110 5 L -120 10 z" />
                            </marker>
                            <marker id="triangle2" viewBox="-200 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                                <path d="M -200 0 L -190 5 L -200 10 z" />
                            </marker>
                            <marker id="triangle3" viewBox="-120 0 10 10" refX="0" refY="5" fill="#FF3838" stroke="#FF3838" markerWidth="6" markerHeight="6" orient="auto">
                                <path d="M -120 0 L -110 5 L -120 10 z" />
                            </marker>

                            <!-- Lines -->
                            <line transform="translate(60,35)" x1="20" y1="100" x2="320" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="320" y1="100" x2="620" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="620" y1="100" x2="920" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="920" y1="100" x2="1220" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="1220" y1="100" x2="1520" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="1520" y1="100" x2="1820" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="1820" y1="100" x2="2120" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="2120" y1="100" x2="2420" y2="100" class="link1"></line>




                            <!-- Conditions -->
                            <text x="165" y="110" class="condition_text">DAG Compliance Officer</text>
                            <text x="495" y="110" class="condition_text">Business Lead</text>
                            <text x="790" y="110" class="condition_text">Business Lead</text>
                            <text x="1095" y="110" class="condition_text">Internal Audit</text>
                            <text x="1395" y="110" class="condition_text">Internal Audit</text>
                            <text x="1670" y="110" class="condition_text">DAG Compliance Officer</text>
                            <text x="1995" y="110" class="condition_text">Exec Owner</text>
                            <text x="2300" y="110" class="condition_text">Head of IA</text>



                            <!-- Stages -->
                            <g statustext="FINAL STAGE" transform="translate(20,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>

                                <text x="0" y="0">
                                    <tspan x="5" y="25">FINAL STAGE</tspan>

                                </text>
                            </g>

                            <!-- Ready to populate with submission and owners -->
                            <g statustext="Ready to populate with submission and owners" transform="translate(20,100)" actualtext="Saved as draft" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready to populate</tspan>
                                    <tspan x="5" y="40">with submission</tspan>
                                    <tspan x="5" y="55">and owners</tspan>
                                </text>
                            </g>

                            <!-- Ready for risk assessment -->
                            <g statustext="Ready for risk assessment" actualtext="Ready for risk assessment" transform="translate(320,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Risk</tspan>
                                    <tspan x="5" y="40">Assessment</tspan>
                                </text>
                            </g>

                            <!-- Ready to upload Methodology Statement -->
                            <g statustext="Ready to upload Methodology Statement" actualtext="Ready for methodology statement" transform="translate(620,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready to upload</tspan>
                                    <tspan x="5" y="40">Methodology</tspan>
                                    <tspan x="5" y="55">Statement</tspan>
                                </text>
                            </g>

                            <!-- Ready for Internal Audit Review -->
                            <g statustext="Ready for Internal Audit Review" actualtext="Ready for Internal Audit review" transform="translate(920,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Internal</tspan>
                                    <tspan x="5" y="40">Audit Review</tspan>
                                </text>
                            </g>

                            <!-- Ready to assign Assurance Activities -->
                            <g statustext="Ready to assign Assurance Activities" actualtext="Ready for assurance activities" transform="translate(1220,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready to assign</tspan>
                                    <tspan x="5" y="40">Assurance Activities</tspan>
                                </text>
                            </g>

                            <!-- Ready for DAG Officer Review -->
                            <g statustext="Ready for DAG Officer Review" actualtext="Ready for DAG Compliance Officer review" transform="translate(1520,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for DAG</tspan>
                                    <tspan x="5" y="40">Officer Review</tspan>
                                </text>
                            </g>

                            <!-- Ready for Exec Owner Sign-Off -->
                            <g statustext="Ready for Exec Owner Sign-Off" actualtext="Ready for Exec Owner sign-off (financial)" transform="translate(1820,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Exec</tspan>
                                    <tspan x="5" y="40">Owner Sign-Off</tspan>
                                </text>
                            </g>

                            <!-- Ready for HIA Sign-Off -->
                            <g statustext="Ready for HIA Sign-Off" actualtext="Ready for Head of Internal Audit sign-off" transform="translate(2120,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for HIA</tspan>
                                    <tspan x="5" y="40">Sign-Off</tspan>
                                </text>
                            </g>

                            <!-- Final Sign-Off completed -->
                            <g statustext="Final Sign-Off completed" actualtext="Final sign-off complete" transform="translate(2420,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Final Sign-Off</tspan>
                                    <tspan x="5" y="40">Complete</tspan>
                                </text>
                            </g>
                        </svg>

                    </div>
                    <div class="status-diagram-submission">

                        <svg xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                            id="svg1"
                            height="250px"
                            width="2700px">


                            <!-- Text -->
                            <text x="20" y="50" class="title_text">Submission Workflow</text>

                            <marker id="triangle" viewBox="-120 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                                <path d="M -120 0 L -110 5 L -120 10 z" />
                            </marker>
                            <marker id="triangle2" viewBox="-200 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                                <path d="M -200 0 L -190 5 L -200 10 z" />
                            </marker>
                            <marker id="triangle3" viewBox="-120 0 10 10" refX="0" refY="5" fill="#FF3838" stroke="#FF3838" markerWidth="6" markerHeight="6" orient="auto">
                                <path d="M -120 0 L -110 5 L -120 10 z" />
                            </marker>

                            <!-- Lines -->
                            <line transform="translate(60,35)" x1="20" y1="100" x2="320" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="320" y1="100" x2="620" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="620" y1="100" x2="920" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="920" y1="100" x2="1220" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="1220" y1="100" x2="1520" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="1520" y1="100" x2="1820" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="1820" y1="100" x2="2120" y2="100" class="link1"></line>
                            <line transform="translate(60,35)" x1="2120" y1="100" x2="2420" y2="100" class="link1"></line>


                            <!-- Conditions -->
                            <text x="195" y="110" class="condition_text">Data Preparer</text>
                            <text x="485" y="110" class="condition_text">Second Reviewer</text>
                            <text x="790" y="110" class="condition_text">Internal Expert</text>
                            <text x="1090" y="110" class="condition_text">Business Lead</text>
                            <text x="1365" y="110" class="condition_text">DAG Compliance Officer</text>
                            <text x="1695" y="110" class="condition_text">Exec Owner</text>
                            <text x="1990" y="110" class="condition_text">Internal Audit</text>
                            <text x="2300" y="110" class="condition_text">Head of IA</text>


                            <!-- Stages -->
                            <g statustext="FINAL STAGE" transform="translate(20,100)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>

                                <text x="0" y="0">
                                    <tspan x="5" y="25">FINAL STAGE</tspan>

                                </text>
                            </g>

                            <!-- Ready for submission upload -->
                            <g statustext="Ready for submission upload" transform="translate(20,100)" actualtext="Ready for data submission" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for</tspan>
                                    <tspan x="5" y="40">Submission Upload</tspan>

                                </text>
                            </g>

                            <!-- Ready for Second Person Review -->
                            <g statustext="Ready for Second Person Review" transform="translate(320,100)" actualtext="Ready for Second Person review" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Second</tspan>
                                    <tspan x="5" y="40">Person Review</tspan>
                                </text>
                            </g>

                            <!-- Ready for Internal Expert Review -->
                            <g statustext="Ready for Internal Expert Review" transform="translate(620,100)" actualtext="Ready for Internal Expert review" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Internal</tspan>
                                    <tspan x="5" y="40">Expert Review</tspan>
                                </text>
                            </g>

                            <!-- Ready for Business Lead Review -->
                            <g statustext="Ready for Business Lead Review" transform="translate(920,100)" actualtext="Ready for Business Lead review" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Business</tspan>
                                    <tspan x="5" y="40">Lead Review</tspan>
                                </text>
                            </g>

                            <!-- Ready for DAG Officer Review -->
                            <g statustext="Ready for DAG Officer Review" transform="translate(1220,100)" actualtext="Ready for Compliance Officer review" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for DAG</tspan>
                                    <tspan x="5" y="40">Officer Review</tspan>
                                </text>
                            </g>

                            <!-- Ready for Exec Owner Review -->
                            <g statustext="Ready for Exec Owner Review" transform="translate(1520,100)" actualtext="Ready for Exec Owner review" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Exec</tspan>
                                    <tspan x="5" y="40">Owner Review</tspan>
                                </text>
                            </g>

                            <!-- Ready for Internal Audit Review -->
                            <g statustext="Ready for Internal Audit Review" transform="translate(1820,100)" actualtext="Ready for Internal audit review" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Internal</tspan>
                                    <tspan x="5" y="40">Audit Review</tspan>
                                </text>
                            </g>

                            <!-- Ready for HIA Sign-Off -->
                            <g statustext="Ready for HIA Sign-Off" transform="translate(2120,100)" actualtext="Ready for Head of Internal Audit review" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for HIA</tspan>
                                    <tspan x="5" y="40">Sign-Off</tspan>
                                </text>
                            </g>

                            <!-- Final Sign-Off completed -->
                            <g statustext="Final Sign-Off completed" transform="translate(2420,100)" actualtext="Final sign-off complete" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Final Sign-Off</tspan>
                                    <tspan x="5" y="40">completed</tspan>
                                </text>
                            </g>


                            



                        </svg>



                    </div>

                    <asp:TextBox runat="server" ID="txtCurrentStatus4" Style="display: none"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtCurrentStatus5" Style="display: none"></asp:TextBox>

                </div>
            </div>
        </div>
    </div>
</div>

