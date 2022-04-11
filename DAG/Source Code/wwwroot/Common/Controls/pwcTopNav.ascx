<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="pwcTopNav.ascx.cs"
    Inherits="PwC.Common.pwcTopNav" %>
    
<script type="text/javascript" language="javascript">
    
    var menuTimeOut;
    var currentSubMenuSelected;
    
    function ShowSubMenu(submenu_id)
    {            
        if (submenu_id == currentSubMenuSelected)
        {
            clearTimeout(menuTimeOut);
        }
        else 
        {           
            // if an item is currently selected, then we need to clear the time out and
            // hide the current item.   
            if (currentSubMenuSelected != "")
            {              
                clearTimeout(menuTimeOut);
                $("#" + currentSubMenuSelected).animate({opacity: 0.0}).css({visibility: "hidden"});
            }
        
            currentSubMenuSelected = submenu_id;
            $("#" + submenu_id).css({opacity: 0.0, visibility: "visible"}).animate({opacity: 1.0}); 
        }
    }
    
    function HideSubMenu(submenu_id)
    {
        menuTimeOut = setTimeout(function() { $("#" + submenu_id).animate({opacity: 0.0}).css({visibility: "hidden"}); currentSubMenuSelected = ""; }, 500);            
    }
    
    function HideMe(submenu_id)
    {            
        currentSubMenuSelected = "";
        menuTimeOut = null;            
    }
    
</script>

<div class="pwcTopNav" id="PwCTopNavMenu">   
    <ul> 
        <asp:Literal ID="menuItems" runat="server" />        
    </ul>
</div>


