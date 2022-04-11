<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PasswordControl.ascx.cs" Inherits="PwC.Common.Controls.ChangePasswordControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />

<asp:CustomValidator    ID="cvPassword" 
                        runat="server" 
                        ControlToValidate="txtPassword" 
                        OnServerValidate="txtPassword_Validate"
                        ClientValidationFunction="txtPassword_Validate"
                        Display="None"> </asp:CustomValidator>
                        
<ajaxToolkit:PasswordStrength ID="PasswordStrength" runat="server" TargetControlID="txtPassword"
            DisplayPosition="RightSide"
            StrengthIndicatorType="Text"
            PreferredPasswordLength="7" 
            PrefixText=""
            HelpStatusLabelID="txtPassword_StrengthLabel"                               
            TextStrengthDescriptions="Weak;Average;Strong"          
            TextStrengthDescriptionStyles="BarIndicator_weak;BarIndicator_average;BarIndicator_strong"                    
            RequiresUpperAndLowerCaseCharacters="true"
            />
            
                        
