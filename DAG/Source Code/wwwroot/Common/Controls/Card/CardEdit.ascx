<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CardEdit.ascx.cs" Inherits="PwC.Common.Controls.Card.CardEdit" %>
 <div runat="server" id="divEdit" visible="false">
<div class="modal-fill" style="background-color: #939598;">
            </div>
<div class="modal" style="width: 500px;  background-color: white;">
    <div class="modal-title">
        Edit card
    </div>
    <div class="modal-content">


        <asp:Repeater runat="server" ID="rptContent">
            <ItemTemplate>
              <div style="clear:both;height:25px;">
                  <div style="width:150px;float:left;">
                    <asp:Label runat="server" Text='<%#Eval("ParamCode") %>'></asp:Label>
                </div>
                <div  style="width:300px;float:left;" runat="server" visible='<%#Eval("ValueType").ToString()=="1" %>'>
                    <asp:TextBox runat="server" ID="txtValueInt" Text='<%#Eval("ValueInt") %>'></asp:TextBox>
                </div>
                <div  style="width:300px;float:left;" runat="server" visible='<%#Eval("ValueType").ToString()=="2" %>'>
                    <asp:TextBox runat="server" ID="txtValueDecimal" Text='<%#Eval("ValueDecimal") %>'></asp:TextBox>
                </div>
                <div  style="width:300px;float:left;" runat="server" visible='<%#Eval("ValueType").ToString()=="3" %>'>
                    <asp:TextBox runat="server" ID="txtValueString" Text='<%#Eval("ValueString") %>'></asp:TextBox>
                </div>
                <div  style="width:300px;float:left;" runat="server" visible='<%#Eval("ValueType").ToString()=="4" %>'>
                    <asp:TextBox runat="server" ID="txtValueDate" Text='<%#Eval("ValueDate") %>'></asp:TextBox>
                </div>
                <asp:HiddenField runat="server" ID="hidValueType" Value='<%#Eval("ValueType").ToString() %>' />
                <asp:HiddenField runat="server" ID="hidParamCode" Value='<%#Eval("ParamCode").ToString() %>' />
              </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Button runat="server" ID="btnClose" Text="Close" OnClick="btnClose_Click" />
        <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
    </div>


</div>
     </div> 