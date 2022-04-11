$(function() {
    var metadataLoader = new ThemeBuilder.MetadataLoader(),
        historyChangesManager = new ThemeBuilder.HistoryChangesManager(window.sessionStorage),
        previewIframeNotifier = new ThemeBuilder.PreviewIframeNotifier();

    function listener(event) {
        var data = JSON.parse(event.data);
        switch(data.action) {
            case "getCSS":
                ThemeBuilder.viewModel.showCSSPopup(data.actionData);
                break;
            case "saveCSS":
                ThemeBuilder.viewModel.saveCSSAs(data.actionData);
                break;
            case "stylesUpdated":
                ThemeBuilder.viewModel.toolboxValueUpdated();
                break;
        }
    }

    if(window.addEventListener)
        window.addEventListener("message", listener, false);
    else
        window.attachEvent("onmessage", listener);

    ThemeBuilder.themes = [
        { themeId: 1, name: "generic", colorScheme: "light", text: "Light", selectable: true, selected: true },
        { themeId: 2, name: "generic", colorScheme: "dark", text: "Dark", selectable: true },
        { themeId: 9, name: "generic", colorScheme: "light-compact", text: "Light Compact", selectable: true },
        { themeId: 10, name: "generic", colorScheme: "dark-compact", text: "Dark Compact", selectable: true },
        { themeId: 3, name: "ios7", colorScheme: "default", text: "iOS 7", selectable: true },
        { themeId: 6, name: "android5", colorScheme: "light", text: "Android 5", selectable: true },
        { themeId: 7, name: "win8", colorScheme: "black", text: "Win8 Black", selectable: true },
        { themeId: 8, name: "win8", colorScheme: "white", text: "Win8 White", selectable: true }
    ];

    ThemeBuilder.defaultWidgetGroup = "base.common";

    ThemeBuilder.groupsAliasesRepository = new ThemeBuilder.GroupsAliasesRepository();
    ThemeBuilder.metadataRepository = new ThemeBuilder.MetadataRepository(metadataLoader);
    ThemeBuilder.metadataVersion = ThemeBuilder.__get_metadata_version();
    ThemeBuilder.viewModel = new ThemeBuilder.ViewModel(ThemeBuilder.metadataRepository, historyChangesManager, previewIframeNotifier, { beautify: css_beautify });
    ThemeBuilder.navigationTree = new ThemeBuilder.NavigationTree({
        rootItemClick: $.proxy(ThemeBuilder.viewModel.treeRootItemClick, ThemeBuilder.viewModel),
        childItemClick: $.proxy(ThemeBuilder.viewModel.treeItemClick, ThemeBuilder.viewModel)
    });
    ThemeBuilder.navigationTreeManager = new ThemeBuilder.NavigationTreeManager(ThemeBuilder.navigationTree, ThemeBuilder.viewModel, ThemeBuilder.metadataRepository);

    ThemeBuilder.viewModel.init(ThemeBuilder.themes);

    ko.applyBindings(ThemeBuilder.viewModel);
});