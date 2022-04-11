(function(ThemeBuilder) {

    var NavigationTreeManager = function(tree, viewModel, metadataRepository) {

        var createObservableValue = function(value, valueChangedAction) {
            var observableValue = ko.observable(value);
            observableValue.subscribe(valueChangedAction);

            return observableValue;
        };

        this._mapItemData = function(data) {
            $.each(data, function(index, item) {
                data[index] = {
                    key: item.Key,
                    name: item.Name,
                    type: item.Type,
                    value: createObservableValue(item.Value, $.proxy(viewModel.toolboxValueSubscribe, viewModel, item)),
                    paletteColorOpacity: item.PaletteColorOpacity
                };
            });
            return data;
        };

        this._map = function(data) {
            var that = this;
            $.each(data, function(index, item) {
                var groupTitle = item.title;

                if(item.parentTitle)
                    groupTitle = item.parentTitle + "." + groupTitle;

                if(item.data)
                    data[index].data = that._mapItemData(item.data);

                data[index].title = ThemeBuilder.groupsAliasesRepository.getAlias(groupTitle);
                data[index].ord = ThemeBuilder.groupsAliasesRepository.getOrd(groupTitle);
            });

            return data;
        };

        this._sort = function(data) {
            data.sort(function(a, b) {
                if(a.ord < b.ord)
                    return -1;
                if(a.ord > b.ord)
                    return 1;
            });

            return data;
        };

        this._mapFn = function(data) {
            data = this._map(data);
            return this._sort(data);
        };

        this._updateMetadata = function(predefinedMetadata, metadata) {
            $.each(predefinedMetadata, function(_, item) {
                var key = item.key, value = item.value;
                $.each(metadata, function(name, items) {
                    $.each(items, function(i, currentItem) {
                        if(currentItem.Key === key) {
                            metadata[name][i].Value = value;
                        }
                    });
                });
            });

            return metadata;
        };

        this.initTree = function(predefinedMetadata, predefinedGroup, predefinedTheme) {
            var currentTheme = predefinedTheme || {
                name: viewModel.currentTheme(),
                colorScheme: viewModel.currentColorScheme()
            };

            var metadata = metadataRepository.getData(currentTheme);
            if(predefinedMetadata) {
                metadata = this._updateMetadata(predefinedMetadata, metadata);
            }
            var that = this;
            var data = $.extend(true, {}, metadata);
            viewModel.tree = tree.create(data, function(data) {
                data = that._mapFn(data);
                $.each(data, function(index, item) {
                    if(item.children.length) {
                        data[index].children = that._mapFn(data[index].children);
                    }
                });
                
                return data;
            });
        };
    };

    ThemeBuilder.NavigationTreeManager = NavigationTreeManager;

})(ThemeBuilder);