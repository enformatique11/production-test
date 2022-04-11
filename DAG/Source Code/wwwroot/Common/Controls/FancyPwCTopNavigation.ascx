<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FancyPwCTopNavigation.ascx.cs"
    Inherits="PwC.Common.FancyPwCTopNavigation" %>
    
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

<div class="pwcTopNav" id="pwcTopNavMenu">
    <ul> 
        <li id='Li7' class='item'>
            <a href='#' class="selected">Home</a>                                                        
        </li>     
        <li id='Li2' class='item'>
            <a href='#' rel='dropmenu3' onmouseover="javascript:ShowSubMenu('dropmenu3');" onmouseout="javascript:HideSubMenu('dropmenu3');">Documents Repository</a>                            
            <div id='dropmenu3' class='dropMenuItemMultiple' style="left: -112px; width:948px;" onmouseover="javascript:ShowSubMenu('dropmenu3');" onmouseout="javascript:HideSubMenu('dropmenu3');">
                <div class='dropMenuInner'>
                    <div class="StartItem borderRight">
                        <h1>
                            Document Repository
                        </h1>
                        <h3>
                            This section of the site contains documents related to different aspects of the Data Assurance business.
                        </h3>
                        <p>
                            You will be able to select a range of different documents sections based on the service line and type of work.
                        </p>
                    </div>
                    <div class='MiddleItem paddingRight'>
                        <h2>
                            Cirriculum Vitaes
                        </h2>
                        <p>
                            This section of the site can be used to manage and generate CV's for our people. 
                        </p>
                        <a href='#'>View CV's for our peope</a>                                                          
                    </div>
                    <div class='MiddleItem paddingRight'>
                        <h2>
                            Proposal Documents
                        </h2>
                        <p>
                            This section of the site can be used to manage and view proposal documents for any Data related engagements.
                        </p>
                        <a href='#'>View proposal documents</a>                                                                
                    </div>
                    <div class='MiddleItem borderRight'>
                        <h2>
                            Citations
                        </h2>
                        <p>
                            This section of the siet can be used to manage and view citations for any Data related enegements.
                        </p>
                        <a href='#'>View citations</a>                                                              
                    </div>
                    <div class='EndPictureItem'>
                        <asp:Image runat="server" ID="imgMenu1" CssClass="ItemImage" ImageUrl="~/img/image.jpg" />                                       
                        <p>
                            <b>
                                This is a test heading
                            </b>
                            <br />
                            This is some example text which will be used to explain some extra information about this menu poption if required.
                        </p>
                        <a href='#'>Sub 1</a> 
                        <a href='#'>Sub 2</a>                         
                    </div>
                </div>                                
             </div>
        </li>     
                                         
        <li id='Li1' class='item'>            
            <a href='#' rel='dropmenu2' onmouseover="javascript:ShowSubMenu('dropmenu2');" onmouseout="javascript:HideSubMenu('dropmenu2');">Our People</a>                            
            <div id='dropmenu2' class='dropMenuItemSingle' onmouseover="javascript:ShowSubMenu('dropmenu2');" onmouseout="javascript:HideSubMenu('dropmenu2');">
                <div class="dropMenuInner">
                    <h1>Our People</h1>
                    <h3>
                        Taking pride in our people.
                    </h3>
                    <p>
                        This section contains details about the people that make up the UK Data Assurance team.
                    </p>
                    <asp:HyperLink ID="lnkOurPeople" runat="server" NavigateUrl="~/Pages/OurPeople/PeopleList.aspx">Go to Our People</asp:HyperLink>
                </div>                               
             </div>
        </li>
        
        <li id='Li4' class='item'>
            <a href='#'>My Details</a>                                                        
        </li>
        <li id='Li5' class='item'>
            <a href='#'>Data Opportunities</a>                                                        
        </li>
        <li id='Li6' class='item'>
            <a href='#' rel='dropmenu11' onmouseover="javascript:ShowSubMenu('dropmenu11');" onmouseout="javascript:HideSubMenu('dropmenu11');">Management Reporting</a>                            
            <div id='dropmenu11' class='dropMenuItemMultiple' onmouseover="javascript:ShowSubMenu('dropmenu11');" onmouseout="javascript:HideSubMenu('dropmenu11');">
                <div class='dropMenuInner'>
                    <div class="StartItem borderRight">
                        <h1>
                            Sudheer Test
                        </h1>
                        <h3>
                            This is some test text, explaining the current menu item that has been selected.
                        </h3>
                        <p>
                            This is some example text which will be used to explain some extra information about this menu poption if required.
                        </p>
                    </div>
                    <div class='MiddleItem'>
                        <h2>
                            I Love Harjeet
                        </h2>
                        <p>
                            This is some example text which will be used to explain some extra information about this menu poption if required.
                        </p>
                        <a href='#'>Sub 1</a> 
                        <a href='#'>Sub 2</a>                         
                    </div>
                </div>                                
             </div>                                                   
        </li>    
        <li id='nav_Test' class='item'>
            <a href='#' rel='dropmenu1' onmouseover="javascript:ShowSubMenu('dropmenu1');" onmouseout="javascript:HideSubMenu('dropmenu1');">Change Password</a>                            
            <div id='dropmenu1' class='dropMenuItemSingle' onmouseover="javascript:ShowSubMenu('dropmenu1');" onmouseout="javascript:HideSubMenu('dropmenu1');">
                <div class='dropMenuInner' >
                    <h1>
                        Sudheer Test
                    </h1>
                    <h3>
                        This is some test text, explaining the current menu item that has been selected.
                    </h3>
                    <p>
                        This is some example text which will be used to explain some extra information about this menu poption if required.
                    </p>
                    <a href='#'>Menu Option 1</a> 
                    <a href='#'>Menu Option 2</a>               
                </div>
             </div>
        </li>                    
        <li id='Li3' class='endItem' >
            <a href='#' rel='dropmenu4' onmouseover="javascript:ShowSubMenu('dropmenu4');" onmouseout="javascript:HideSubMenu('dropmenu4');">Global Document Search</a>                            
            <div id='dropmenu4' class='dropMenuItemMultiple' style="left: -190px; border-top: #DC6900;" onmouseover="javascript:ShowSubMenu('dropmenu4');" onmouseout="javascript:HideSubMenu('dropmenu4');">
                <div class='dropMenuInner'>
                    <div class="StartItem borderRight">
                        <h1>
                            Sudheer Test
                        </h1>
                        <h3>
                            This is some test text, explaining the current menu item that has been selected.
                        </h3>
                        <p>
                            This is some example text which will be used to explain some extra information about this menu poption if required.
                        </p>
                    </div>
                    <div class='MiddleItem'>
                        <h2>
                            I Love Harjeet
                        </h2>
                        <p>
                            This is some example text which will be used to explain some extra information about this menu poption if required.
                        </p>
                        <a href='#'>Sub 1</a> 
                        <a href='#'>Sub 2</a>                         
                    </div>
                </div>                                
             </div>
        </li>
    </ul>
</div>


