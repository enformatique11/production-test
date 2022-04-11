(function(ThemeBuilder) {
    ThemeBuilder.CssTemplateLoader = function(){
        this.load = function(theme, colorScheme) {
            var d = $.Deferred(),
                themeName = (theme ? theme + "-" : "");

            window.cssTemplateLoadedCallback = function(css) {
                d.resolve(css);
            };

            $.ajax({
                url: "Content/Data/CSS/theme-builder-" + themeName + colorScheme + ".css.js",
                dataType: "jsonp",
                crossDomain: true,
                jsonpCallback: "cssTemplateLoadedCallback"
            });

            return d.promise();
        };
    };
})(ThemeBuilder);