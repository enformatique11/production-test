$(function() {
    try {
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    } catch (e) {
    }

    SetupCollapsiblePanels();
    
    pageFilter.Initialize();

    jQuery.fn.setVisibility = function(visible, callback) {
        this.each(function(idx, el) {
            if (visible) {
                $(el).show();
            } else {
                $(el).hide();
            }

            if (callback) {
                callback(visible, el);
            }
        });
    };

    jQuery.fn.toggleClassesOnCondition = function(condition, classA, classB) {
        this.each(function(idx, el) {
            if (condition) {
                $(el)
                .removeClass(classB)
                .addClass(classA);
            } else {
                $(el)
                .removeClass(classA)
                .addClass(classB);
            }
        });
    };
});

var pageFilter = {

    Initialize: function() {
        $(".filterTitle").on("click", function() {
            var panel = pageFilter.GetPanelElement(this);
            var isVisible = $(".fContent", panel).is(":visible");

            $(".fContent", panel).slideToggle('fast', pageFilter.SaveFilterControlState);
            pageFilter.SetFilterIcon(!isVisible, panel);
        });
    },

    SetFilterControlState: function() {
        $(".filterPanel").each(function(idx, el) {
            var content = $(".fContent", el);
            var hiddenEls = $("input[type=hidden]", el);

            if (hiddenEls.length == 1) {
                var hidVisible = hiddenEls[0];
                var isVisible = hidVisible.value != "false";

                $(content).setVisibility(isVisible, function(v, el) {
                    var panel = pageFilter.GetPanelElement(el);
                    pageFilter.SetFilterIcon(v, panel);
                });
            }
        });
    },

    SaveFilterControlState: function(e) {
        $(".filterPanel").each(function(idx, el) {
            var content = $(".fContent", el);
            var hiddenEls = $("input[type=hidden]", el);
            if (hiddenEls.length == 1) {
                var hidVisible = hiddenEls[0];
                var name = hidVisible.name;
                hidVisible.value = $(content).is(":visible");
            }
        });
    },

    SetFilterIcon: function(visible, context) {
        if (!$(context).hasClass("filterPanel")) {
            context = pageFilter.GetPanelElement(context);
        }

        $(".filterTitle", context).toggleClassesOnCondition(visible, "upIcon", "downIcon");
    },

    GetPanelElement: function(childElement) {
        return $(childElement).parent(".filterPanel")[0];
    }
}


function BeginRequestHandler(sender, e) {
    
    //pageFilter.SaveFilterControlState(e);
}

function EndRequestHandler(sender, e) {
    pageFilter.SetFilterControlState();
    
    if (e.get_error() != undefined) {
        ProcessAjaxError(sender, e);
    }
}

function ProcessAjaxError(sender, e) {
    if (window['OnAjaxError']) {
        OnAjaxError(sender, e);
    }
}

function ConfirmSaveAndNavigateAway() {
    return confirm("You are about to navigate off this page. Any changes you have made will be saved first. Are you sure?")
}

function CancelForm(location) {
    if (confirm("You are about to navigate off this page. Any changes you have made will be lost. Are you sure?")) {
        window.location = location;
    }
}

function fixWatermarkControl() {
    // The default implementation wipes existing css classes during watermark stage.
    // This corrects that by just adding the watermark class to the end.
    
    if (window["AjaxControlToolkit"] && window["AjaxControlToolkit"]["TextBoxWatermarkBehavior"]) {
        AjaxControlToolkit.TextBoxWatermarkBehavior.prototype._applyWatermark = function() {            
            var wrapper = AjaxControlToolkit.TextBoxWrapper.get_Wrapper(this.get_element());
            wrapper.set_Watermark(this._watermarkText);
            wrapper.set_IsWatermarked(true);
            if (this._watermarkCssClass) {
                $(this.get_element()).addClass(this._watermarkCssClass);
            }
        }
    }
}

function SetupCollapsiblePanels() {
    $(".collapsiblePanel").each(function() {
        var content = $(".panelContent", this);
        $(".panelHeaderTitle h3", this).click(function() {
            var header = this;
            content.slideToggle(function() {
                var visible = $(this).is(":visible");
                $(header).toggleClassesOnCondition(visible, "upIcon", "downIcon");
            });

        });
    });
}
