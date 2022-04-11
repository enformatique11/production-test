function checkDropDown(source,args)
{
var sourceMain = document.getElementById(source.id);    
var sourceControl = document.getElementById(source.getAttribute("ControlToValidate"));

    if (sourceControl.selectedIndex==0)
    {

    args.IsValid=false;
    }
    else
    {

    args.IsValid=true;
    }
}

function checkFieldLength(source,args)
{
var sss = document.getElementById(source.id);    
var valueText = args.Value;

	if (valueText.length > source.getAttribute("TextMaxLength") )
	{
        source.errormessage= source.getAttribute("ErrorMessage_Base")+ " has max length of " + source.getAttribute("TextMaxLength") + " (" + valueText.length + " characters entered)";
	    args.IsValid=false;
	}
	else 
	{
	    if (source.getAttribute("Mandatory")=="true" && valueText.length==0)
	    {
	    source.errormessage= source.getAttribute("ErrorMessage_Base")+" is mandatory";
	    args.IsValid=false;
	    }
	    else
	    {
	    args.IsValid=true;
	    }
	}
}

function checkFieldIsEmail(source,args){
    var reg=/^(?:[a-zA-Z0-9_'^&amp;/+-])+(?:\.(?:[a-zA-Z0-9_'^&amp;/+-])+)*@(?:(?:\[?(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))\.){3}(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\]?)|(?:[a-zA-Z0-9-]+\.)+(?:[a-zA-Z]){2,}\.?)$/ 
	var valueText = args.Value;

    if (valueText.length > source.getAttribute("TextMaxLength") && source.getAttribute("TextMaxLength")!= null )
	{
        source.errormessage= source.getAttribute("ErrorMessage_Base")+ " has max length of " + source.getAttribute("TextMaxLength") + " (" + valueText.length + " characters entered)";
		args.IsValid=false;
	}
	else if (source.getAttribute("Mandatory")=="true" && valueText.length==0)
	{
	    source.errormessage= source.getAttribute("ErrorMessage_Base")+ " is mandatory";
	    args.IsValid=false;
	}
	else
	{
        if (valueText.search(reg)==-1) 
        {
        source.errormessage= source.getAttribute("ErrorMessage_Base")+ " is not a valid email address";
        args.IsValid=false;
        }
        else
        {
	    args.IsValid=true;
	    }
    }
}


