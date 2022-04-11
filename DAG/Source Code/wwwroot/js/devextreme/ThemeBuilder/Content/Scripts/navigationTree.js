(function(ThemeBuilder) {

    var NavigationTree = function(options) {

        options = $.extend(true, {
            rootItemClick: $.noop,
            childItemClick: $.noop
        }, options);

        var hasItem = function(data, key) {
            for(var i = 0, len = data.length; i < len; i++) {
                if(data[i].title === key)
                    return true;
            }
            return false;
        };

        var getTreeItemByName = function(name, tree) {
            var result = null;
            $.each(tree, function(_, item) {
                if(item.title === name) {
                    result = item;
                    return false;
                }
            });

            return result;
        };

        var createRootItem = function(name, data, tree) {
            var root = {
                key: name,
                title: name,
                data: data,
                children: [],
                opened: ko.observable(false),
                hasActiveChild: ko.observable(false),
                click: $.proxy(rootItemClick, this)
            };
            tree.push(root);
            return root;
        };

        var createChildItem = function(name, key, data, parent) {
            var child = {
                key: key,
                title: name,
                parentTitle: parent.title,
                data: data,
                active: ko.observable(false)
            };

            child.click = $.proxy(childItemClick, this, child, parent),
            parent.children.push(child);
        };

        var rootItemClick = function(item) {
            $.each(this._tree, function(_, node) {
                node.opened(item.title === node.title);
                if(node.children.length) {
                    $.each(node.children, function(_, child) {
                        child.active(false);
                    });
                }
            });
            item.hasActiveChild(false);
            options.rootItemClick(item);
        };

        var childItemClick = function(item, parent) {
            item.active(true);
            parent.hasActiveChild(true);
            $.each(parent.children, function(_, child) {
                if(item.title !== child.title)
                    child.active(false);
            });
            options.childItemClick(item);
        };

        this._tree = [];

        this._makeTree = function(metadata, mapFn) {
            var tree = [], that = this;
            $.each(metadata, function(name, item) {
                var parts = name.split("."),
                    rootName = parts[0],
                    childName = parts[1],
                    root = {};

                if(!childName) {
                    root = createRootItem.call(that, rootName, item, tree);
                } else {
                    root = hasItem(tree, rootName) ? 
                        getTreeItemByName(rootName, tree) :
                        createRootItem.call(that, rootName, null, tree);

                    createChildItem.call(that, childName, name, item, root);
                }
            });

            if($.isFunction(mapFn))
                tree = mapFn(tree);

            this._tree = tree;
            return tree;
        };

        this.create = function(data, mapFn) {
            return this._makeTree(data, mapFn);
        };

    };

    ThemeBuilder.NavigationTree = NavigationTree;

})(ThemeBuilder);