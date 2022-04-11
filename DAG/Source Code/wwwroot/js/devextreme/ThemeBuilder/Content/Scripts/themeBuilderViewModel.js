(function(ThemeBuilder) {

    var ViewModel = function(metadataRepository, historyChangesManager, previewIframeNotifier, cssBeautifier) {
        var exportedMetadata = ko.observableArray(),
            updatePreviewStyles = true,
            initialKeyValuePairs = [],
            defaultHue = null,
            defaultHighlightColor = "#606060",
            defaultWidgetGroup = ThemeBuilder.defaultWidgetGroup,
            metadataVersion = ThemeBuilder.metadataVersion,
            $previewIframe = $("#preview-panel-iframe");
        
        ThemeBuilder.Utils.proxyEventsToFrame($previewIframe);

        var loadPreviewIframe = function(metadata) {
            var that = this;
            $previewIframe.attr("src", "preview.html");
            var loaded = false;
            $previewIframe.on("load", function() {
                if(!loaded) {
                    previewIframeNotifier.notify($previewIframe, "load", {
                        metadata: metadata,
                        currentTheme: that.currentTheme(),
                        currentColorScheme: that.currentColorScheme(),
                        metadataRepositoryData: ThemeBuilder.metadataRepository.getData(),
                        group: ThemeBuilder.defaultWidgetGroup
                    });
                }
                loaded = true;
            });
        };

        var getExportedMetadataValueByKey = function(metadata, key) {
            var result = null;

            for(var i = 0, len = metadata.length; i < len; i++) {
                if(metadata[i].key === key) {
                    result = metadata[i].value;
                    break;
                }
            }

            return result;
        };

        var showFailureMessage = function(message) {
            DevExpress.ui.dialog.alert(message, "Theme Builder");
            this.showApplyButton(false);
        };

        var makeExportedMetadataString = function(metadata) {
            this.exportedMetadataAsString(null);
            if(metadata) {
                var items = "",
                    themeId = "\"themeId\": \"" + metadata.themeId + "\"",
                    date = "\"date\": \"" + metadata.date + "\"",
                    hue = "\"hue\": " + (metadata.hue ? "\"" + metadata.hue + "\"" : null),
                    highlightColor = "\"highlightColor\": \"" + metadata.highlightColor + "\"",
                    version = "\"version\": \"" + metadataVersion + "\"";

                if(metadata.items.length)
                    items = "\"items\": [" + metadata.items.join(",\n") + "]";

                this.exportedMetadataAsString("{" + [version, date, themeId, hue, highlightColor, items].join(",\n") + "}");
            }
        };

        var getLastTreeItemKey = function() {
            var lastItem = this.tree.slice(-1)[0];
            if(lastItem.data)
                return lastItem.data.slice(-1)[0].key;

            return lastItem.children.data.slice(-1)[0].key;
        };

        var _updatedData = [];
        var createDataItem = function(item) {
            _updatedData.push(item);
        };
        var updateTreeData = function(items, valueUpdateFunction, lastTreeItemKey) {
            var that = this;
            $.each(items, function(_, item) {
                if(item.data) {
                    for(var i = 0, len = item.data.length; i < len; i++) {
                        var updatedValue = valueUpdateFunction.call(that, item.data[i]);
                        if(item.data[i].key === lastTreeItemKey) {
                            updatePreviewStyles = true;
                            createDataItem({ key: item.data[i].key, value: updatedValue });
                            metadataRepository.updateData(_updatedData, { name: that.currentTheme(), colorScheme: that.currentColorScheme() });
                            
                            _updatedData = [];
                            that.tree = items;
                        }

                        var previousValue = item.data[i].value();
                        item.data[i].value(updatedValue);

                        if(previousValue === updatedValue)
                            that.toolboxValueSubscribe(item, updatedValue);

                        createDataItem({ key: item.data[i].key, value: updatedValue });
                    }
                } else {
                    updateTreeData.call(that, item.children, valueUpdateFunction, lastTreeItemKey);
                }
            });
            this.tree = items;
        };
        
        var updateToolboxGroupsValues = function(valueUpdateFunction) {
            var tree = $.extend(true, [], this.tree),
                lastTreeItemKey = getLastTreeItemKey.call(this);
                
            updatePreviewStyles = false;
            updateTreeData.call(this, tree, valueUpdateFunction, lastTreeItemKey);
        };

        var updateUndoButtonActivity = function(historyItemsCount, indexOfActivHistoryItem) {
            var isButtonDisabled = false;

            if(!historyItemsCount || !indexOfActivHistoryItem) {
                isButtonDisabled = true;
            }

            this.isUndoButtonDisabled(isButtonDisabled);
        };

        var updateRedoButtonActivity = function(historyItemsCount, indexOfActivHistoryItem) {
            var isButtonDisabled = false;

            if(!historyItemsCount || indexOfActivHistoryItem === (historyItemsCount - 1)) {
                isButtonDisabled = true;
            }

            this.isRedoButtonDisabled(isButtonDisabled);
        };

        var makePair = function(data, stringifyData) {
            var result = [];
            for(var i = 0, len = data.length; i < len; i++) {
                var pair = { key: data[i].key, value: data[i].value() };
                if(stringifyData)
                    pair = JSON.stringify(pair);
                result.push(pair);
            }
            return result;
        };

        var convertMetadataToKeyValuePairs = function(stringifyData) {
            var result = [];
            
            $.each(this.tree || [], function(_, group) {
                if(group.data) {
                    result = result.concat(makePair(group.data, stringifyData));
                } else {
                    $.each(group.children, function(_, child) {
                        result = result.concat(makePair(child.data, stringifyData));
                    });
                }
            });

            return result;
        };

        var createHistoryChangesItem = function() {
            var result = {
                items: convertMetadataToKeyValuePairs.call(this),
                themeId: this.themeId(),
                hue: this.hue(),
                highlightColor: this.highlightColor()
            };

            this.historyChangesManager.addItem(result);

            var historyItemsCount = this.historyChangesManager.getItems().length,
                indexOfActivHistoryItem = this.historyChangesManager.getCurrentIndex();

            updateUndoButtonActivity.call(this, historyItemsCount, indexOfActivHistoryItem);
            updateRedoButtonActivity.call(this, historyItemsCount, indexOfActivHistoryItem);
        };

        var doNotCreateHistoryItem = false;
        var useNewMetadata = function(metadata) {
            doNotCreateHistoryItem = true;
            this.updateThemeId(Number(metadata.themeId));
            
            if(metadata.hue)
                this.hue(metadata.hue);

            if(metadata.highlightColor)
                this.highlightColor(metadata.highlightColor);

            updateToolboxGroupsValues.call(this, function(item) {
                return getExportedMetadataValueByKey(metadata.items, item.key);
            });
            doNotCreateHistoryItem = false;
            createHistoryChangesItem.call(this);
        };

        var applyImportedMetadata = function() {

            var updatedMetadata = "",
                d = $.Deferred();
            try {
                updatedMetadata = JSON.parse(this.exportedMetadataAsString() || "");
            } catch(e) {
                showFailureMessage.call(this, "Metadata has a wrong format");
                d.resolve();
            }

            if(updatedMetadata) {
                if(updatedMetadata.version !== metadataVersion) {
                    var that = this;
                    DevExpress.ui.dialog.confirm(
                        "Your version of metadata does not match the Theme Builder v" + metadataVersion + "<br />Do you want to continue?", "Theme Builder")
                        .done(function(dialogResult) {
                        if(dialogResult) {
                            useNewMetadata.call(that, updatedMetadata);
                            d.resolve();
                        } else {
                            that.metadataPopupVisible(false);
                            that.exportedMetadataAsString(null);
                        }
                    });
                } else {
                    useNewMetadata.call(this, updatedMetadata);
                    d.resolve();
                }
            }

           return d.promise();
        };

        var historyChangesHasItems = function() {
            var historyItems = this.historyChangesManager.getItems(),
                historyItemsCount = historyItems.length;

            if(!historyItemsCount)
                return false;

            return true;
        };

        var getThemeById = function(themeId) {
            return $.grep(this.themes, function(theme) {
                return theme.themeId === Number(themeId);
            })[0];
        };

        var updateMetadata = function(itemKey, itemValue, metadata) {
            $.each(metadata, function(_, group) {
                $.each(group, function(_, item) {
                    if(item.Key === itemKey) {
                        item.Value = itemValue;
                        return false;
                    }
                });
            });

            return metadata;
        };

        this.treeIsUpdated = ko.observable(true);

        // todo: get rid of this
        var isHistoryNavigationAction = false;
        var historyChangesManagerNavigated = function(direction, oldThemeId) {
            
            this.treeIsUpdated(false);

            this.loadMetadata(true);

            var historyItemsCount = this.historyChangesManager.getItems().length,
                indexOfCurrentHistoryItem = this.historyChangesManager.getCurrentIndex(),
                data = this.historyChangesManager.getCurrentItem().data;

            if(direction === "back" && !data.items.length)
                data.items = initialKeyValuePairs;

            if(oldThemeId !== this.themeId()) {
                _updatedData = [];
                this.currentWidgetGroup(defaultWidgetGroup);
                ThemeBuilder.navigationTreeManager.initTree(data.items, this.currentWidgetGroup());
                this.refreshWidgetsVisibility();
                activateFirstToolboxItem.call(this);
            }

            isHistoryNavigationAction = true;

            this.hue(data.hue);
            this.highlightColor(data.highlightColor);

            updateToolboxGroupsValues.call(this, function(item) {
                return getExportedMetadataValueByKey(data.items, item.key);
            });

            this.treeIsUpdated(true);

            isHistoryNavigationAction = false;

            updateUndoButtonActivity.call(this, historyItemsCount, indexOfCurrentHistoryItem);
            updateRedoButtonActivity.call(this, historyItemsCount, indexOfCurrentHistoryItem);
        };

        var activateFirstToolboxItem = function() {
            $.each(this.tree, function(index, item) {
                item.opened(!index);
            });
        };

        var treeHasOpenedItem = function() {
            var result = false;
            $.each(this.tree, function(_, item) {
                if(item.opened()) {
                    result = true;
                    return false;
                }
            });
            return result;
        };
        
        this._inlineStylesUpdatedCallback = $.noop;
        this.historyChangesManager = historyChangesManager;
        this.themeId = ko.observable(1);
        this.currentTheme = ko.observable("generic");
        this.currentColorScheme = ko.observable("light");
        this.CSSPopupVisible = ko.observable(false);
        this.CSSContent = ko.observable();
        this.hue = ko.observable(defaultHue);
        this.highlightColor = ko.observable(defaultHighlightColor);
        this.metadataPopupVisible = ko.observable(false);
        this.exportedMetadataAsString = ko.observable(null);
        this.showApplyButton = ko.observable(false);
        this.isUndoButtonDisabled = ko.observable(true);
        this.isRedoButtonDisabled = ko.observable(true);
        this.toolboxItems = ko.observableArray();
        this.currentWidgetGroup = ko.observable(defaultWidgetGroup);
        this.baseThemingVisible = ko.observable(true);
        this.advancedThemingVisible = ko.observable(false);
        this.isMobileTheme = ko.observable(false);
        
        var getDataByKey = function(data, key) {
            var result = null;
            $.each(data, function(_, item) {
                if(item.key === key) {
                    result = item;
                    return false;
                }
            });
            return result;
        };

        this.toolboxValueSubscribe = function(item, value) {
            var metadata = metadataRepository.getData({
                name: this.currentTheme(),
                colorScheme: this.currentColorScheme()
            });

            var currentWidgetGroup = this.currentWidgetGroup();
            
            $.each(metadata[currentWidgetGroup], function(index, metadataItem) {
                if(metadataItem.Key === item.Key) {
                    metadata[currentWidgetGroup][index].Value = value;
                    return false;
                }
            });
            
            if(updatePreviewStyles) {
                previewIframeNotifier.notify($previewIframe, "update", {
                    metadata: metadata,
                    group: currentWidgetGroup,
                    currentTheme: this.currentTheme(),
                    currentColorScheme: this.currentColorScheme()
                });

                if(!isHistoryNavigationAction && !doNotCreateHistoryItem) {
                    createHistoryChangesItem.call(this);
                }
            }
        };

        this.getTreeItemDataByKey = function(key) {
            var result = null, that = this;
            $.each(this.tree, function(index, item) {
                if(item.data) {
                    result = getDataByKey(item.data, key);
                    if(result)
                        return false;
                } else {
                    $.each(item.children, function(_, child) {
                        result = getDataByKey(child.data, key);
                        if(result)
                            return false;
                    });
                }
                if(result)
                    return false;
            });
            
            return result;
        };

        this.showBaseTheming = function() {
            this.baseThemingVisible(true);
            this.advancedThemingVisible(false);
        };

        this.showAdvancedTheming = function() {
            this.baseThemingVisible(false);
            this.advancedThemingVisible(true);
            if(!treeHasOpenedItem.call(this))
                activateFirstToolboxItem.call(this);
        };

        this.toolboxValueUpdated = function() {
            this._inlineStylesUpdatedCallback();
        };

        this.selectedTheme= ko.observable();

        this.currentThemeDisplayName = ko.computed(function() {
            //initialize computed calculation
            var themeId = this.themeId();

            if(!this.themes) {
                return "Light";
            }

            var theme = getThemeById.call(this, themeId);
            this.selectedTheme(theme);
            return theme.text;
        }, this);

        this.themesMenuVisible = ko.observable(false);
        this.showThemesMenu = function() {
            this.themesMenuVisible(true);
        };

        this.updateThemeIdFromMenu = function(value) {
            var that = this;
            return DevExpress
                .ui
                .dialog
                .confirm("Are you sure you want to change the base theme?<br />All changes will be lost.", "Theme Builder")
                .done(function(dialogResult) {
                    if(dialogResult) {
                        that.updateThemeId(value.itemData.themeId);
                    }
                });
        };

        this._isMobileTheme = function(themeName) {
            return $.inArray(themeName, ["ios7", "win8", "android5"]) > -1;
        };

        this.updateThemeId = function(value) {
            
            var theme = getThemeById.call(this, value);
            this.currentTheme(theme.name);
            this.currentColorScheme(theme.colorScheme);
            this.currentWidgetGroup(defaultWidgetGroup);
            _updatedData = [];
            this.treeIsUpdated(false);
            this.init(this.themes, true);
            this.treeIsUpdated(true);
            activateFirstToolboxItem.call(this);
            this.refreshWidgetsVisibility();

            this.isMobileTheme(this._isMobileTheme(theme.name));

            this.themeId(value);

            this.hue(defaultHue);
            this.highlightColor(defaultHighlightColor);

            if(!doNotCreateHistoryItem)
                createHistoryChangesItem.call(this);
        };

        this.loadMetadata = function(checkHistoryChanges) {
            var metadata = metadataRepository.getData({ name: this.currentTheme(), colorScheme: this.currentColorScheme() });
            if(checkHistoryChanges && historyChangesHasItems.call(this)) {
                var currentTheme = getThemeById.call(this, this.historyChangesManager.getCurrentItem().data.themeId);
                metadata = metadataRepository.getData({ name: currentTheme.name, colorScheme: currentTheme.colorScheme });
                $.each(this.historyChangesManager.getCurrentItem().data.items, function(index, item) {
                    updateMetadata(item.key, item.value, metadata);
                });
                
                this.themeId(currentTheme.themeId);
                this.selectedTheme(currentTheme);

                this.isMobileTheme(this._isMobileTheme(currentTheme.name));

                this.currentTheme(currentTheme.name);
                this.currentColorScheme(currentTheme.colorScheme);
            }

            if(!historyChangesHasItems.call(this)) {
                initialKeyValuePairs = convertMetadataToKeyValuePairs.call(this);
                createHistoryChangesItem.call(this);
            }

            if(!this.selectedTheme())
                this.selectedTheme(this.themes[0]);

            return metadata;
        };

        this.saveCSS = function() {
            this.getCSS(true);
        };

        this.copyCSS = function() {
            this.getCSS();
        };

        this.getCSS = function(saveFile) {
            var actionName = saveFile ? "saveCSS" : "getCSS";
            previewIframeNotifier.notify($previewIframe, actionName, metadataVersion);
        };

        this.showCSSPopup = function(content) {
            this.CSSPopupVisible(true);
            this.CSSContent(cssBeautifier.beautify(content));
        };

        this.saveCSSAs = function(css) {
            var fileName = [this.currentTheme(), this.currentColorScheme(), "custom"].join(".");
            DevExpress.dxClientExporter.fileSaver.saveAs(fileName, "CSS", new Blob([cssBeautifier.beautify(css)]));
        };

        this.closeCSSPopup = function() {
            this.CSSPopupVisible(false);
        };

        this._applyCustomHue = function(e) {

            var hue = e.value;
            if(!hue)
                return;

            var customThemeCreator = new ThemeBuilder.CustomThemeCreator(hue);
            updateToolboxGroupsValues.call(this, function(item) {
                var result = item.value();
                if(item.type === "color" && !item.affectedByHighlightColor) {
                    result = customThemeCreator.getColor(item.value());
                }

                return result;
            });
        };

        this._applyHighlightColor = function(e) {
            var paletteColor = e.value;
            updateToolboxGroupsValues.call(this, function(item) {
                var result = item.value();
                if(item.paletteColorOpacity) {
                    var opacity = Number(item.paletteColorOpacity);
                    if(opacity === 1) {
                        result = paletteColor;
                    }
                    else {
                        var color = new DevExpress.Color(paletteColor);
                        result = "rgba(" + [color.r, color.g, color.b, opacity].join(",") + ")";
                    }
                    item.affectedByHighlightColor = true;
                }

                return result;
            });
        };

        this._getBuildDate = function(){
            return Globalize.format(new Date(), "M/d/yyyy");
        },

        this.importMetadata = function() {
            var that = this;
            applyImportedMetadata.call(this).done(function() {
                that.metadataPopupVisible(false);
                that.exportedMetadataAsString(null);
            });
        };

        this.exportMetadata = function() {
            var result = {
                items: convertMetadataToKeyValuePairs.call(this, true),
                themeId: this.themeId(),
                hue: this.hue(),
                highlightColor: this.highlightColor(),
                date: this._getBuildDate()
            };
            this.metadataPopupVisible(true);
            this.showApplyButton(false);
            exportedMetadata(result);
            makeExportedMetadataString.call(this, result);
        };

        this.showMetadataPopup = function() {
            this.showApplyButton(true);
            this.metadataPopupVisible(true);
            exportedMetadata(null);
        };

        this.closeMetadataPopup = function() {
            this.metadataPopupVisible(false);
            this.exportedMetadataAsString(null);
        };

        this.tree = null;
        
        this.init = function(themes, doNotCheckLocalChanges) {
            doNotCheckLocalChanges = doNotCheckLocalChanges || false;
            var that = this;
            this.themes = themes;
            return metadataRepository.init(themes).done(function() {

                var historyItems = that.historyChangesManager.getItems(),
                    lastHistoryItem = null,
                    theme = undefined;

                if(historyItems.length && !doNotCheckLocalChanges) {

                    var currentHistoryData = that.historyChangesManager.getCurrentItem().data;

                    lastHistoryItem = currentHistoryData.items;

                    if(currentHistoryData.hue && currentHistoryData.hue !== that.hue())
                        that.hue(currentHistoryData.hue);

                    if(currentHistoryData.highlightColor && currentHistoryData.highlightColor !== that.highlightColor())
                        that.highlightColor(currentHistoryData.highlightColor);

                    try {
                        var currentTheme = getThemeById.call(that, that.historyChangesManager.getCurrentItem().data.themeId);
                        theme = {};
                        theme.name = currentTheme.name;
                        theme.colorScheme = currentTheme.colorScheme;
                    } catch(e) { }
                }

                ThemeBuilder.navigationTreeManager.initTree(lastHistoryItem, that.currentWidgetGroup(), theme);
                var metadata = that.loadMetadata(!doNotCheckLocalChanges);

                loadPreviewIframe.call(that, metadata);
            });
        };
        
        this.refreshCurrentWidgetGroup = function() {
            var group = this.currentWidgetGroup();
            this.currentWidgetGroup("");
            this.currentWidgetGroup(group);
        };

        this.refreshWidgetsVisibility = function() {
            var widgetPanelVisible = this.advancedThemingVisible();
            this.advancedThemingVisible(!widgetPanelVisible);
            this.advancedThemingVisible(widgetPanelVisible);
        };

        this.refreshCustomPaletteVisibility = function() {
            var baseThemingVisible = this.baseThemingVisible();
            this.baseThemingVisible(!baseThemingVisible);
            this.baseThemingVisible(baseThemingVisible);
        };

        this.undo = function() {
            this.historyChangesManager.navigateToPreviousItem();
            historyChangesManagerNavigated.call(this, "back", this.themeId());
            this.refreshCurrentWidgetGroup();
        };

        this.redo = function() {
            this.historyChangesManager.navigateToNextItem();
            historyChangesManagerNavigated.call(this, "forward", this.themeId());
            this.refreshCurrentWidgetGroup();
        };
        
        this.setDefault = function() {
            var that = this;
            return DevExpress.ui.dialog.confirm("Are you sure you want to reset all changes?", "Theme Builder").done(function(dialogResult) {
                if(dialogResult) {

                    that.updateThemeId(1);
                    that.hue(defaultHue);
                    that.highlightColor(defaultHighlightColor);

                    that.historyChangesManager.clearHistory();

                    historyChangesManagerNavigated.call(that, "back", that.themeId());
                    that.refreshWidgetsVisibility();
                    that.refreshCustomPaletteVisibility();
                    that.isUndoButtonDisabled(true);
                    that.isRedoButtonDisabled(true);
                }
            });
        };

        this.sortToolboxEditors = function(a, b) {
            var aOrd = Number(a.name.split(".")[0]),
                bOrd = Number(b.name.split(".")[0]);

            if(!aOrd || b.Ord)
                return 0;

            return aOrd < bOrd ? -1 : 1;
        };

        exportedMetadata.subscribe($.proxy(makeExportedMetadataString, this));

        this.hidePreviewBody = function() {
            previewIframeNotifier.notify($previewIframe, "hideBody");
        };

        var itemClick = function(item) {
            var currentThemeName = this.currentTheme();

            if(this.currentWidgetGroup() === item.key) {
                return;
            }

            var metadata = metadataRepository.getData({
                name: currentThemeName,
                colorScheme: this.currentColorScheme()
            });
            
            this.currentWidgetGroup(item.key);
            this.hidePreviewBody();

            if(!!ThemeBuilder.groupsAliasesRepository.getIsMobile(item.key))
                this.isMobileTheme(true);
            else {
                this.isMobileTheme(this._isMobileTheme(currentThemeName));
            }
            
            previewIframeNotifier.notify($previewIframe, "update", {
                metadata: metadata,
                currentTheme: currentThemeName,
                currentColorScheme: this.currentColorScheme(),
                group: item.key,
                clearBody: true
            });
        };

        this.treeItemClick = function(item) {
            itemClick.call(this, item);
        };
        
        this.treeRootItemClick = function(item) {
            if(item.children.length)
                this.treeItemClick(item.children[0]);
            else
                itemClick.call(this, item);
        };
        
        this.getMobileBaseThemingColorView = function() {
            return $(".mobile-base-theming-colorview").dxColorView("instance");
        };

        this.applyMobileMainThemeColor = function() {
            this.getMobileBaseThemingColorView().applyColor();
        };

        this.cancelMobileMainThemeColor = function() {
            this.getMobileBaseThemingColorView().cancelColor();
        };
    };

    ThemeBuilder.ViewModel = ViewModel;

})(ThemeBuilder);