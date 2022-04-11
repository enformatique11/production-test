(function() {

    var getWidgetNameByContentType = function(type) {
        var widgetName = null;
        switch(type) {
            case "color": widgetName = "dxColorBox"; break;
            case "text": widgetName = "dxTextBox"; break;
        }

        return widgetName;
    };

    ko.bindingHandlers.toolboxEditor = {
        init: function(element, valueAccessor, allBindings, viewModel, bindingContext) {
            var values = valueAccessor(),
                widgetName = getWidgetNameByContentType(values.type);
                

            ko.bindingHandlers[widgetName].init.apply(this, arguments);
        },
        update: function(element, valueAccessor, allBindings, viewModel, bindingContext) { }
    };

})();