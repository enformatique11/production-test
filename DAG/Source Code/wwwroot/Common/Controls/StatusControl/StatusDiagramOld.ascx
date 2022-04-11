<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatusDiagramOld.ascx.cs"
    Inherits="PwC.Controls.StatusDiagram" %>
<script type="text/javascript">
    
</script>

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
        <div class="modal" style="width: 1200px; position: fixed; margin-left: -600px; height: 600px; background-color: white;">
            <div class="modal-title">
                <span style="float: left;">Status Visualisation</span>

                 <input type="button" value="Close" style="float: right" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />

            </div>
            <div class="modal-content" style="height: 560px;">

                <div class="mainpanel" style="height: 560px; width: 1190px; overflow: auto;">

                    <div class="status-diagram-netdar">
                        
                        
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        id="svg0"
                        height="540px"
                        width="4000px">

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
                        </style>


                        <marker id="triangle" viewBox="-120 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                            <path d="M -120 0 L -110 5 L -120 10 z" />
                        </marker>
                        <marker id="triangle2" viewBox="-200 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                            <path d="M -200 0 L -190 5 L -200 10 z" />
                        </marker>
                        <marker id="triangle3" viewBox="-120 0 10 10" refX="0" refY="5" fill="#FF3838" stroke="#FF3838" markerWidth="6" markerHeight="6" orient="auto">
                            <path d="M -120 0 L -110 5 L -120 10 z" />
                        </marker>

                        <line transform="translate(60,35)" x1="20" y1="240" x2="320" y2="240" class="link1"></line>
                        <line transform="translate(60,35)" x1="320" y1="240" x2="620" y2="240" class="link1"></line>
                        <line transform="translate(60,35)" x1="620" y1="240" x2="920" y2="240" class="link1"></line>

                        <line transform="translate(60,35)" x1="920" y1="240" x2="1220" y2="140" class="link1"></line>
                        <line transform="translate(60,35)" x1="920" y1="240" x2="1220" y2="340" class="link1"></line>
                        <line transform="translate(60,35)" x1="1220" y1="140" x2="1520" y2="240" class="link1"></line>
                        <line transform="translate(60,35)" x1="1220" y1="340" x2="1520" y2="240" class="link1"></line>

                        <line transform="translate(60,35)" x1="1520" y1="240" x2="1820" y2="240" class="link1"></line>
                        

                        <line transform="translate(60,35)" x1="1820" y1="240" x2="2120" y2="140" class="link1"></line>
                        <line transform="translate(60,35)" x1="1820" y1="240" x2="2120" y2="340" class="link1"></line>
                        <line transform="translate(60,35)" x1="2120" y1="140" x2="2370" y2="240" class="link1"></line>
                        <line transform="translate(60,35)" x1="2120" y1="340" x2="2370" y2="240" class="link1"></line>


                        <line transform="translate(60,35)" x1="2370" y1="240" x2="2620" y2="140" class="link1"></line>
                        <line transform="translate(60,35)" x1="2370" y1="240" x2="2620" y2="340" class="link1"></line>
                        
                        <line transform="translate(60,35)" x1="2920" y1="140" x2="3220" y2="240" class="link1"></line>
                        <line transform="translate(60,35)" x1="2920" y1="340" x2="3220" y2="240" class="link1"></line>


                        <line transform="translate(60,35)" x1="2670" y1="140" x2="2920" y2="140" class="link1"></line>
                        <line transform="translate(60,35)" x1="2670" y1="340" x2="2920" y2="340" class="link1"></line>
                        <line transform="translate(60,35)" x1="3220" y1="240" x2="3520" y2="240" class="link1"></line>
                    




                       <%-- <!-- DAG Compliance Officer Send Backs -->
                        <line transform="translate(60,35)" x1="2070" y1="50" x2="620" y2="50" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Up from DAG Compliance Review -->
                        <line transform="translate(60,35)" x1="2070" y1="200" x2="2070" y2="50" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Down to Assurance Activities -->
                        <line transform="translate(60,35)" x1="1820" y1="50" x2="1820" y2="140" class="link4" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <path d="M 1875 117 L 1885 117 L 1880 126 z" fill="#FF3838" stroke="#FF3838" />
                        <!-- Down to Internal Audit Review -->
                        <line transform="translate(60,35)" x1="1520" y1="50" x2="1520" y2="240" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Down to Risk Assessment Completed -->
                        <line transform="translate(60,35)" x1="920" y1="50" x2="920" y2="240" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Down to Populated... -->
                        <line transform="translate(60,35)" x1="620" y1="50" x2="620" y2="240" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>

                        <!-- Exec Owner Send Backs -->
                        <line transform="translate(60,35)" x1="2620" y1="450" x2="620" y2="450" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Down to From Exec Owner -->
                        <line transform="translate(60,35)" x1="2620" y1="240" x2="2620" y2="450" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Up to Assurance Activities -->
                        <line transform="translate(60,35)" x1="1820" y1="450" x2="1820" y2="350" class="link4" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <path d="M 1875 447 L 1885 447 L 1880 438 z" fill="#FF3838" stroke="#FF3838" />
                        <!-- Up to Internal Audit Review -->
                        <line transform="translate(60,35)" x1="1520" y1="450" x2="1520" y2="240" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Up to DAG Compliance Review -->
                        <line transform="translate(60,35)" x1="2070" y1="450" x2="2070" y2="240" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Up to Risk Assessment Completed -->
                        <line transform="translate(60,35)" x1="920" y1="450" x2="920" y2="240" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>
                        <!-- Up to Populated... -->
                        <line transform="translate(60,35)" x1="620" y1="450" x2="620" y2="240" class="link3" stroke-dasharray="10" stroke="#FF3838" fill="#FF3838"></line>--%>


<%--                        <path d='M 1580,240 A 200,80 1 1 0 980,240' fill="none" stroke="#FF3838" stroke-dasharray="10" stroke-width="2" />

                        <path d='M 1580,240 A 200,100 1 1 1 680,240' fill="none" stroke="#FF3838" stroke-dasharray="10" stroke-width="2" />--%>


                        <!-- TRIANGLE -->
                       <%-- <path d="M 1270 117 L 1280 111 L 1280 123 z" fill="#FF3838" stroke="#FF3838" />
                        <path transform="translate(-160,347)" d="M 1270 117 L 1280 111 L 1280 123 z" fill="#FF3838" stroke="#FF3838" />--%>


                        <!-- Conditions -->
                        <text x="156" y="250" class="condition_text">DAG Compliance Officer</text>
                        <text x="456" y="250" class="condition_text">DAG Compliance Officer</text>
                        <text x="785" y="250" class="condition_text">Business Lead</text>
                        <text transform="translate(1075, 225) rotate(-19)" class="condition_text">Business Lead</text>
                        <text transform="translate(1075, 335) rotate(19)" class="condition_text">Business Lead</text>
                        <text transform="translate(1385, 195) rotate(18)" class="condition_text">Automatic</text>
                        <text transform="translate(1385, 360) rotate(-19)" class="condition_text">Automatic</text>

                        <text transform="translate(1695, 250) " class="condition_text">IA Officer</text>
                        <text transform="translate(1995, 225) rotate(-19)" class="condition_text">IA Officer</text>
                        <text transform="translate(1995, 335) rotate(19)" class="condition_text">IA Officer</text>
                        <text transform="translate(2285, 200) rotate(22)" class="condition_text">Automatic</text>
                        <text transform="translate(2285, 360) rotate(-22)" class="condition_text">Automatic</text>

                        <text transform="translate(2495, 225) rotate(-19)" class="condition_text">DAG Compliance Officer</text>
                        <text transform="translate(2495, 335) rotate(19)" class="condition_text">DAG Compliance Officer</text>
                        
                        <text transform="translate(3085, 200) rotate(22)" class="condition_text">Automatic</text>
                        <text transform="translate(3085, 360) rotate(-22)" class="condition_text">Automatic</text>


                        <text x="2815" y="150" class="condition_text">Exec Owner</text>
                        <text x="2815" y="400" class="condition_text">Exec Owner</text>
                        <text x="3360" y="250" class="condition_text">Head of Internal Audit</text>
                  

                        <!-- Send back conditions -->
                        <%--<text transform="translate(1500, 145) rotate(30)" class="condition_text" color="#FF3838">IA Officer</text>
                        <text transform="translate(1500, 395) rotate(-35)" class="condition_text" color="#FF3838">IA Officer</text>
                        <text transform="translate(1950, 75)" class="condition_text" color="#FF3838">DAG Compliance Officer</text>
                        <text transform="translate(2625, 475) rotate(-35)" class="condition_text" color="#FF3838">Exec Owner</text>--%>


                        <g statustext="FINAL STAGE" transform="translate(20,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>

                            <text x="0" y="0">
                                <tspan x="5" y="25">FINAL STAGE</tspan>

                            </text>
                        </g>

                        <g statustext="Not started" transform="translate(20,240)" actualtext="Not started" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>
                            <text x="0" y="0">
                                <tspan x="5" y="25">Not started</tspan>

                            </text>
                        </g>
                        <g statustext="Populated with submission and owners" actualtext="Ready for risk assessment" transform="translate(620,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Populated with </tspan>
                                <tspan x="5" y="40">submission and</tspan>
                                <tspan x="5" y="55">owners</tspan>

                            </text>

                        </g>

                        <g statustext="Methodology statement uploaded financial" actualtext="Methodology statement uploaded financial" transform="translate(1220,140)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Methodology</tspan>
                                <tspan x="5" y="40">statement</tspan>
                                <tspan x="5" y="55">uploaded financial</tspan>

                            </text>

                        </g>
                        <g statustext="Methodology statement uploaded workload" actualtext="Methodology statement uploaded workload" transform="translate(1220,340)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Methodology</tspan>
                                <tspan x="5" y="40">statement</tspan>
                                <tspan x="5" y="55">uploaded workload</tspan>

                            </text>

                        </g>
                        <g statustext="Ready for DAG Compliance Officer review" actualtext="Ready for DAG Compliance Officer review" transform="translate(2370,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Ready for </tspan>
                                <tspan x="5" y="40">DAG Compliance</tspan>
                                <tspan x="5" y="55">Officer review</tspan>

                            </text>


                        </g>
                        <g statustext="Assurance activities determined financial" actualtext="Assurance activities determined financial" transform="translate(2120,140)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Assurance activities</tspan>
                                <tspan x="5" y="40">determined </tspan>
                                <tspan x="5" y="55">financial</tspan>

                            </text>

                        </g>
                        <g statustext="Assurance activities determined workload" actualtext="Assurance activities determined workload" transform="translate(2120,340)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Assurance activities</tspan>
                                <tspan x="5" y="40">determined </tspan>
                                <tspan x="5" y="55">workload</tspan>

                            </text>

                        </g>
                        <g statustext="Ready for Internal Audit Review" actualtext="Ready for Internal Audit review" transform="translate(1520,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Ready for Internal </tspan>
                                <tspan x="5" y="40">Audit Review</tspan>

                            </text>

                        </g>

                        <g statustext="Reviewed by Internal Audit" actualtext="Ready for assurance activities (financial); Ready for assurance activities (workload)" transform="translate(1820,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Reviewed by</tspan>
                                <tspan x="5" y="40">Internal Audit</tspan>

                            </text>

                        </g>

                        <g statustext="Risk assessment completed" actualtext="Ready for methodology statement (financial); Ready for methodology statement (workload)" transform="translate(920,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>

                            <text x="0" y="0">
                                <tspan x="5" y="25">Risk assessment</tspan>
                                <tspan x="5" y="40">completed</tspan>

                            </text>


                        </g>




                        <g statustext="Ready for Exec Owner Sign-Off (Financial)" actualtext="Ready for exec owner sign-off (financial)" transform="translate(2620,140)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>

                            <text x="0" y="0">
                                <tspan x="5" y="25">Ready for</tspan>
                                <tspan x="5" y="40">Exec Owner Sign-Off</tspan>
                                <tspan x="5" y="55">financial</tspan>

                            </text>


                        </g>


                        <g statustext="Ready for Exec Owner Sign-Off (Workload)" actualtext="Ready for exec owner sign-off (workload)" transform="translate(2620,340)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>

                            <text x="0" y="0">
                                <tspan x="5" y="25">Ready for</tspan>
                                <tspan x="5" y="40">Exec Owner Sign-Off</tspan>
                                <tspan x="5" y="55">workload</tspan>


                            </text>


                        </g>


                         <g statustext="Signed Off by Exec Owner (Financial)" actualtext="Signed Off by Exec Owner (Financial)" transform="translate(2920,140)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>

                            <text x="0" y="0">
                                <tspan x="5" y="25">Signed of by</tspan>
                                <tspan x="5" y="40">Exec Owner</tspan>
                                <tspan x="5" y="55">financial</tspan>

                            </text>


                        </g>


                        <g statustext="Signed Off by Exec Owner (Workload)" actualtext="Signed Off by Exec Owner (Workload)" transform="translate(2920,340)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>

                            <text x="0" y="0">
                                <tspan x="5" y="25">Signed of by</tspan>
                                <tspan x="5" y="40">Exec Owner</tspan>
                                <tspan x="5" y="55">workload</tspan>


                            </text>


                        </g>







                        <g statustext="Saved as draft" actualtext="Saved as draft" transform="translate(320,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Saved as draft</tspan>

                            </text>
                        </g>
                        <g statustext="Signed Off by Head of Internal Audit" actualtext="Final sign-off complete" transform="translate(3520,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Final Sign-Off</tspan>
                                    <tspan x="5" y="40">complete</tspan>

                            </text>
                        </g>
                        <g statustext="Ready for Head of Internal Audit review" actualtext="Ready for Head of Internal Audit sign-off" transform="translate(3220,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                            <rect height="70" width="120" y="0" x="0"></rect>


                            <text x="0" y="0">
                                <tspan x="5" y="25">Ready for </tspan>
                                <tspan x="5" y="40">Head of Internal</tspan>
                                <tspan x="5" y="55">Sign-Off</tspan>

                            </text>
                        </g>
                     


                    </svg>

                    </div>

                    <div class="status-diagram-submission">
                        
                        <svg xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink"
                             id="svg1"
                             height="540px"
                             width="5300px">
                            
                            <line transform="translate(60,35)" x1="20" y1="240" x2="320" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="20" y1="240" x2="620" y2="240" class="link2"></line>
                            <line transform="translate(60,35)" x1="320" y1="120" x2="620" y2="240" class="link1"></line>

                            
                        <text transform="translate(165, 222) rotate(-21)" class="condition_text">DAG Compliance Officer</text>
                        <text x="317" y="260" class="condition_text">DAG Compliance Officer</text>
                        <text transform="translate(480, 180) rotate(21)" class="condition_text">DAG Compliance Officer</text>
                        <text transform="translate(800, 210) rotate(-21)" class="condition_text">Automatic</text>
                        <text transform="translate(800, 350) rotate(21)" class="condition_text">Automatic</text>

                        <!-- Workload -->
                        <text x="1088" y="140" class="condition_text">Workload Owner</text>
                        <text x="1358" y="140" class="condition_text">Workload Second Reviewer</text>
                        <text x="1705" y="140" class="condition_text">Automatic</text>
                        <text x="1965" y="140" class="condition_text">Workload Internal Expert</text>
                        <text x="2252" y="140" class="condition_text">Workload Internal Data Audit</text>
                        <text x="2544" y="140" class="condition_text">Workload Internal Process Audit</text>
                        <text x="2852" y="140" class="condition_text">Workload External Data Audit</text>
                        <text x="3143" y="140" class="condition_text">Workload External Process Audit</text>
                        <text x="3460" y="140" class="condition_text">Workload Senior Manager</text>

                        <!-- Financial -->
                        <text x="1088" y="420" class="condition_text">Financial Owner</text>
                        <text x="1358" y="420" class="condition_text">Financial Second Reviewer</text>
                        <text x="1705" y="420" class="condition_text">Automatic</text>
                        <text x="1965" y="420" class="condition_text">Financial Internal Expert</text>
                        <text x="2252" y="420" class="condition_text">Financial Internal Data Audit</text>
                        <text x="2544" y="420" class="condition_text">Financial Internal Process Audit</text>
                        <text x="2852" y="420" class="condition_text">Financial External Data Audit</text>
                        <text x="3143" y="420" class="condition_text">Financial External Process Audit</text>
                        <text x="3460" y="420" class="condition_text">Financial Senior Manager</text>

                            
                        <text transform="translate(3810, 188) rotate(21)" class="condition_text">Automatic</text>
                        <text transform="translate(3810, 370) rotate(-21)" class="condition_text">Automatic</text>

                        
                        <text x="4068" y="260" class="condition_text">DAG Compliance Officer</text>
                        <text x="4373" y="260" class="condition_text">Head of Internal Audit</text>
                        <text x="4700" y="260" class="condition_text">Exec Owner</text>
                        

                            
                        <marker id="triangle" viewBox="-120 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                            <path d="M -120 0 L -110 5 L -120 10 z" />
                        </marker>
                        <marker id="triangle2" viewBox="-200 0 10 10" refX="0" refY="5" fill="#395963" stroke="#395963" markerWidth="6" markerHeight="6" orient="auto">
                            <path d="M -200 0 L -190 5 L -200 10 z" />
                        </marker>
                        <marker id="triangle3" viewBox="-120 0 10 10" refX="0" refY="5" fill="#FF3838" stroke="#FF3838" markerWidth="6" markerHeight="6" orient="auto">
                            <path d="M -120 0 L -110 5 L -120 10 z" />
                        </marker>

                            <!-- Workload -->
                            <line transform="translate(60,35)" x1="620" y1="240" x2="920" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="920" y1="120" x2="1220" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="1220" y1="120" x2="1520" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="1520" y1="120" x2="1820" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="1820" y1="120" x2="2120" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="2120" y1="120" x2="2420" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="2420" y1="120" x2="2720" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="2720" y1="120" x2="3020" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="3020" y1="120" x2="3320" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="3320" y1="120" x2="3620" y2="120" class="link1"></line>
                            <line transform="translate(60,35)" x1="3620" y1="120" x2="3920" y2="240" class="link1"></line>

                            <!-- Financial -->
                            <line transform="translate(60,35)" x1="620" y1="240" x2="920" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="920" y1="360" x2="1220" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="1220" y1="360" x2="1520" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="1520" y1="360" x2="1820" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="1820" y1="360" x2="2120" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="2120" y1="360" x2="2420" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="2420" y1="360" x2="2720" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="2720" y1="360" x2="3020" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="3020" y1="360" x2="3320" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="3320" y1="360" x2="3620" y2="360" class="link1"></line>
                            <line transform="translate(60,35)" x1="3620" y1="360" x2="3920" y2="240" class="link1"></line>


                            
                            <line transform="translate(60,35)" x1="3920" y1="240" x2="4220" y2="240" class="link1"></line>
                            <line transform="translate(60,35)" x1="4220" y1="240" x2="4520" y2="240" class="link1"></line>
                            <line transform="translate(60,35)" x1="4520" y1="240" x2="4820" y2="240" class="link1"></line>
                            
                            <g statustext="FINAL STAGE" transform="translate(20,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>

                                <text x="0" y="0">
                                    <tspan x="5" y="25">FINAL STAGE</tspan>

                                </text>
                            </g>
                            
                            <g statustext="Not started" transform="translate(20,240)" actualtext="Not started" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Not started</tspan>

                                </text>
                            </g>


                            <g statustext="Saved as draft" actualtext="Saved as draft" transform="translate(320,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Saved as draft</tspan>
                                </text>
                            </g>


                            <g statustext="Mark as ready for submission" actualtext="Mark as ready for submission" transform="translate(620,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Mark as ready</tspan>
                                    <tspan x="5" y="40">for submission</tspan>
                                </text>
                            </g>


                            <g statustext="Ready for Workload data submission" actualtext="Ready for workload data submission" transform="translate(920,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Workload</tspan>
                                    <tspan x="5" y="40">data submission</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Submitted by Workload owner" actualtext="Ready for workload second person review" transform="translate(1220,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Submitted by</tspan>
                                    <tspan x="5" y="40">Workload owner</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Reviewed by Workload mandatory second person" actualtext="Reviewed by Workload mandatory second person" transform="translate(1520,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Reviewed by</tspan>
                                    <tspan x="5" y="40">Workload mandatory</tspan>
                                    <tspan x="5" y="55">second person</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Ready for Workload Assurance Activities" actualtext="Ready for workload internal expert review" transform="translate(1820,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Workload</tspan>
                                    <tspan x="5" y="40">Assurance Activities</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Workload data reviewed by Internal Expert" actualtext="Ready for workload internal data audit review" transform="translate(2120,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Workload data</tspan>
                                    <tspan x="5" y="40">reviewed by</tspan>
                                    <tspan x="5" y="55">Internal Expert</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Workload data reviewed by Internal Data Audit" actualtext="Ready for workload internal process audit review" transform="translate(2420,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Workload data</tspan>
                                    <tspan x="5" y="40">reviewed by</tspan>
                                    <tspan x="5" y="55">Internal Data Audit</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Workload data reviewed by Internal Process Audit" actualtext="Ready for workload external data audit review" transform="translate(2720,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="15">Workload data</tspan>
                                    <tspan x="5" y="30">reviewed by</tspan>
                                    <tspan x="5" y="45">Internal Process</tspan>
                                    <tspan x="5" y="60">Audit</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Workload data reviewed by External Data Audit" actualtext="Ready for workload external process audit review" transform="translate(3020,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="15">Workload data</tspan>
                                    <tspan x="5" y="30">reviewed by</tspan>
                                    <tspan x="5" y="45">External Data</tspan>
                                    <tspan x="5" y="60">Audit</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Workload data reviewed by External Process Audit" actualtext="Ready for workload senior manager review" transform="translate(3320,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="15">Workload data</tspan>
                                    <tspan x="5" y="30">reviewed by</tspan>
                                    <tspan x="5" y="45">External Process</tspan>
                                    <tspan x="5" y="60">Audit</tspan>
                                </text>
                            </g>
                            

                            <g statustext="Workload data signed-off by Senior Manager" actualtext="Workload data signed-off by Senior Manager" transform="translate(3620,120)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Workload data</tspan>
                                    <tspan x="5" y="40">signed-off by</tspan>
                                    <tspan x="5" y="55">Senior Manager</tspan>
                                </text>
                            </g>

                            <g statustext="Ready for Financial data submission" actualtext="Ready for financial data submission" transform="translate(920,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Financial</tspan>
                                    <tspan x="5" y="40">data submission</tspan>
                                </text>
                            </g>

                            <g statustext="Submitted by Financial owner" actualtext="Ready for financial second person review" transform="translate(1220,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Submitted by</tspan>
                                    <tspan x="5" y="40">Financial owner</tspan>
                                </text>
                            </g>

                            <g statustext="Reviewed by Financial mandatory second person" actualtext="Reviewed by Financial mandatory second person" transform="translate(1520,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Reviewed by</tspan>
                                    <tspan x="5" y="40">Financial mandatory</tspan>
                                    <tspan x="5" y="55">second person</tspan>
                                </text>
                            </g>

                            <g statustext="Ready for Financial Assurance Activities" actualtext="Ready for financial internal expert review" transform="translate(1820,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for Financial</tspan>
                                    <tspan x="5" y="40">Assurance Activities</tspan>
                                </text>
                            </g>

                            <g statustext="Financial data reviewed by Internal Expert" actualtext="Ready for financial internal data audit review" transform="translate(2120,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Financial data</tspan>
                                    <tspan x="5" y="40">reviewed by</tspan>
                                    <tspan x="5" y="55">Internal Expert</tspan>
                                </text>
                            </g>

                            <g statustext="Financial data reviewed by Internal Data Audit" actualtext="Ready for financial internal process audit review" transform="translate(2420,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Financial data</tspan>
                                    <tspan x="5" y="40">reviewed by</tspan>
                                    <tspan x="5" y="55">Internal Data Audit</tspan>
                                </text>
                            </g>

                            <g statustext="Financial data reviewed by Internal Process Audit" actualtext="Ready for financial external data audit review" transform="translate(2720,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="15">Financial data</tspan>
                                    <tspan x="5" y="30">reviewed by</tspan>
                                    <tspan x="5" y="45">Internal Process</tspan>
                                    <tspan x="5" y="60">Audit</tspan>
                                </text>
                            </g>

                            <g statustext="Financial data reviewed by External Data Audit" actualtext="Ready for financial external process audit review" transform="translate(3020,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="15">Financial data</tspan>
                                    <tspan x="5" y="30">reviewed by</tspan>
                                    <tspan x="5" y="45">External Data</tspan>
                                    <tspan x="5" y="60">Audit</tspan>
                                </text>
                            </g>

                            <g statustext="Financial data reviewed by External Process Audit" actualtext="Ready for financial senior manager review" transform="translate(3320,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="15">Financial data</tspan>
                                    <tspan x="5" y="30">reviewed by</tspan>
                                    <tspan x="5" y="45">External Process</tspan>
                                    <tspan x="5" y="60">Audit</tspan>
                                </text>
                            </g>

                            <g statustext="Financial data signed-off by Senior Manager" actualtext="Financial data signed-off by Senior Manager" transform="translate(3620,360)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Financial data</tspan>
                                    <tspan x="5" y="40">signed-off by</tspan>
                                    <tspan x="5" y="55">Senior Manager</tspan>
                                </text>
                            </g>

                            <g statustext="Ready for Compliance Officer Review" actualtext="Ready for compliance officer review" transform="translate(3920,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Ready for</tspan>
                                    <tspan x="5" y="40">Compliance Officer</tspan>
                                    <tspan x="5" y="55">Review</tspan>
                                </text>
                            </g>

                            <g statustext="Reviewed by Compliance Officer" actualtext="Ready for head of internal audit review" transform="translate(4220,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Reviewed by</tspan>
                                    <tspan x="5" y="40">Compliance Officer</tspan>
                                </text>
                            </g>

                            <g statustext="Signed-off by Head of Internal Audit" actualtext="Ready for exec owner review" transform="translate(4520,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                    <tspan x="5" y="25">Signed-off by</tspan>
                                    <tspan x="5" y="40">Head of</tspan>
                                    <tspan x="5" y="55">Internal Audit</tspan>
                                </text>
                            </g>

                            <g statustext="Signed Off by Exec Owner" actualtext="Final sign-off complete" transform="translate(4820,240)" baseclass="filter6 a" selected="true" class="filter6 a">
                                <rect height="70" width="120" y="0" x="0"></rect>
                                <text x="0" y="0">
                                   <tspan x="5" y="25">Final Sign-Off</tspan>
                                    <tspan x="5" y="40">complete</tspan>
                                </text>
                            </g>

                           

                        </svg>

                    </div>


                </div>

                <asp:TextBox runat="server" ID="txtCurrentStatus" Style="display: none"></asp:TextBox>
                
            </div>
        </div>
    </div>
</div>

