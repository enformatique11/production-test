<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="PwC.Common.Controls.Footer" %>

<script type="text/javascript" language="javascript">

    function openFooterPopup(url)
    {
        var newwindow = window.open(url, '', "height=700, width=810, scrollbars=1");
        if (window.focus)
        {
            newwindow.focus();
        }
    }

</script>

<div id="footer" runat="server" class="footer">
    <span>&copy;  2017 PricewaterhouseCoopers. All rights reserved. "PricewaterhouseCoopers" 
    and "PwC" refer to the network of member firms of PricewaterhouseCoopers International Limited (PwCIL). 
    Each member firm is a separate legal entity and does not act as agent of PwCIL or any other member firm. 
    Neither PwCIL nor any member firm is responsible or liable for the acts or omissions of any other member 
    firm nor control the exercise of another member firm's professional judgment or bind another member firm or 
    PwCIL in any way.
    </span> 
    <div id="links" runat="server">
        <a href="javascript:openFooterPopup('https://www.pwc.co.uk/who-we-are/privacy-statement.html');">Privacy Statement</a> | <a href="javascript:openFooterPopup('https://www.pwc.co.uk/who-we-are/legal-disclaimer.html');">Legal Disclaimer</a> 
    
    
    </div>   
</div>
