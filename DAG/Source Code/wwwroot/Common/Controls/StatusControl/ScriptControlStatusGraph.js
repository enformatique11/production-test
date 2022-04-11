function StatusControlStatusGraph() {

    var _selectedNodeData = null;
    var _defaultNodeWidth = 150;
	var _nodes = new Array();
	var _labelAnchors = new Array();
	var _links = new Array();
	var _labelAnchorsLinks = new Array();
	var _statusPositions =
	[
		 {
			 "status": "Assurance activities determined financial",
			 "x": 270,
			 "y": 240,
			 "height": 40
		 },
		 {
			 "status": "Assurance activities determined workload",
			 "x": 60,
			 "y": 240,
			 "height": 40
		 },
		 {
			 "status": "FINAL STAGE",
			 "x": 350,
			 "y": 990,
			 "height": 25
		 },
		 {
			 "status": "Methodology statement uploaded financial",
			 "x": 800,
			 "y": 240,
			 "height": 40
		 },
		 {
			 "status": "Methodology statement uploaded workload",
			 "x": 630,
			 "y": 240,
			 "height": 40
		 },
		 {
			 "status": "Not started",
			 "x": 350,
			 "y": 20,
			 "height": 25
		 },
		 {
			 "status": "Populated with submission and owners",
			 "x": 350,
			 "y": 160,
			 "height": 40
		 },
		 {
			 "status": "Ready for DAG Data Champion review",
			 "x": 350,
			 "y": 350,
			 "height": 40
		 },
		 {
			 "status": "Ready for Exec Owner Sign-Off",
			 "x": 350,
			 "y": 670,
			 "height": 40
		 },
		 {
			 "status": "Ready for Internal Audit Sign-Off",
			 "x": 150,
			 "y": 520,
			 "height": 40
		 },
		 {
			 "status": "Reviewed by DAG Compliance Officer",
			 "x": 550,
			 "y": 520,
			 "height": 40
		 },
		 {
			 "status": "Reviewed by DAG Data Champion",
			 "x": 350,
			 "y": 450,
			 "height": 40
		 },
		 {
			 "status": "Risk assessment completed",
			 "x": 450,
			 "y": 240,
			 "height": 40
		 },
		 {
			 "status": "Saved as draft",
			 "x": 500,
			 "y": 100,
			 "height": 25
		 },
		 {
			 "status": "Signed Off by DAG Steering Group",
			 "x": 350,
			 "y": 810,
			 "height": 40
		 },
		 {
			 "status": "Signed Off by Exec Owner",
			 "x": 350,
			 "y": 740,
			 "height": 40
		 },
		 {
			 "status": "Signed Off by Group Exec",
			 "x": 350,
			 "y": 930,
			 "height": 40
		 },
		 {
			 "status": "Signed Off by Head of Internal Audit",
			 "x": 350,
			 "y": 870,
			 "height": 40
		 },
		 {
			 "status": "Signed Off by Internal Audit",
			 "x": 350,
			 "y": 600,
			 "height": 40
		 }
	]

		
	function GraphNode(label, x, y, height) {
	    this.status = label;
	    this.x = x;
	    this.y = y;
	    this.height = height;	    
	}

	function GraphLink(source, target, condition) {

		this.source = source;
		this.target = target;
		this.Condition = condition;
		this.weight = 1;
	}

	this.LoadData = function LoadData(NodeData, LinkData, selectedNode) {

	    LoadNodes(NodeData);
	    LoadLinks(LinkData);
	    _selectedNodeData = selectedNode;
	}

	function LoadNodes(NodeData) {
		NodeData.forEach(function (arg) {
			NewNode(arg.Status);
		}
		);
}

	function GetPositionFromLabel(label) {
		for (var i = 0; i < _statusPositions.length; ++i) {
			if (_statusPositions[i].status == label) {
				return _statusPositions[i];
			}
		}

		return null;
	}

	function LoadLinks(LinkData) {

		LinkData.forEach(function (arg) {
			var src = FindNodeWithName(arg.StatusFrom);
			var tgt = FindNodeWithName(arg.StatusTo);

			NewLink(src, tgt, arg.Condition);
		}
		);

	}

	function FindNodeWithName(name) {

		for (var i = 0; i < _nodes.length; ++i) {
			if (_nodes[i].status == name) {
				return _nodes[i];
			}
		}

		return null;
	}


	function NewNode(label) {

	    var positionData = GetPositionFromLabel(label);

	    var node = new GraphNode(label, positionData.x, positionData.y, positionData.height);

		_nodes.push(node);
	}

	function NewLink(srcNode, tgtNode, condition) {

		_links.push(new GraphLink(srcNode, tgtNode, condition));		
}


this.DrawGraph = function (surface) {

    var w = 800, h = 600;

    var vis = surface.append("svg:svg").attr("width", w).attr("height", h);

    var svg = d3.select("svg").append("defs").append("marker")
        .attr("id", "arrowhead")
        .attr("refX", 6 + 3) /*must be smarter way to calculate shift*/
        .attr("refY", 2)
        .attr("markerWidth", 6)
        .attr("markerHeight", 4)
        .attr("orient", "auto")
        .append("path")
        .attr("d", "M 0,0 V 4 L6,2 Z"); //this is actual shape for arrowhead

    var node = vis.selectAll("g.node").data(_nodes).enter().append("svg:g").attr("class", "node");
    node.append("svg:rect").style("stroke", "#000").style("stroke-width", 1)
		.attr("x", function (d) { return d.x - (_defaultNodeWidth / 2) })
        .attr("y", function (d) { return d.y - (d.height / 2) })
        .attr("width", _defaultNodeWidth)
        .attr("height",function (d) { return d.height;} )
        .attr("class", function (d) {

            for (var i = 0; i < _selectedNodeData.length; ++i) {
                if (_selectedNodeData[i].Status == d.status) {
                    return "node-not-selected";
                }
            }

            return "";
        });

    node.append("svg:text").text(function (d, i) {
        return d.status
    }).style("fill", "#555").style("font-family", "Arial").style("font-size", "12px").style("text-anchor", "middle")
        .attr("x", function (d) {

            var position = GetPositionFromLabel(d.status);

            if (position === null) {
                return 0;
            }
            else {
                return position.x;
            }
        })
		.attr("y", function (d) {

		    var position = GetPositionFromLabel(d.status);

		    if (position === null) {
		        return 0;
		    }
		    else {
		        return position.y + 17 - (d.height / 2);
		    }
		});


    var link = vis.selectAll("line.link").data(_links).enter().append("svg:line").attr("class", "link").style("stroke", "#CCC")
     .attr("x1", function (d) {

         return d.source.x;
     }).attr("y1", function (d) {
         if (d.source.y > d.target.y) {
             modifier = -1;
         }
         else {
             modifier = 1;
         }

         return d.source.y + ((d.source.height / 2) * modifier);
     }).attr("x2", function (d) {
         return d.target.x;
     }).attr("y2", function (d) {
         var modifier;

         if (d.source.y > d.target.y) {
             modifier = -1;
         }
         else {
             modifier = 1;
         }

         return d.target.y - ((d.target.height / 2) * modifier);
     })
     .attr("marker-end", "url(#arrowhead)");

    d3.selectAll("text").call(wrap);

}

 function wrap(text) {
     text.each(function () {
         var text = d3.select(this),
        words = text.text().split(/\s+/).reverse(),
        word,
        line = [],
        lineNumber = 0,
        lineHeight = 1.1, // ems
        x = text.attr("x")
        y = text.attr("y"),
        dy = 0,
        tspan = text.text(null).append("tspan").attr("x", x).attr("y", y).attr("dy", dy + "em");
         while (word = words.pop()) {
             line.push(word);
             tspan.text(line.join(" "));
             if (tspan.node().getComputedTextLength() > 150) {
                 line.pop();
                 tspan.text(line.join(" "));
                 line = [word];
                 tspan = text.append("tspan").attr("x", x).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
             }
         }
     });
 }

}