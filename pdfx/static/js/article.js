YAHOO.namespace("cc");
YAHOO.namespace("cc.plus");
YAHOO.namespace("cc.network");
YAHOO.namespace("cc.attribution");
YAHOO.cc.network.show_info = function(a) {
	var b = new YAHOO.widget.Module("network", {
		visible : true
	});
	b.setBody(a);
	b.render(YAHOO.util.Dom.getAncestorBy(YAHOO.util.Dom
			.get("work-attribution-container"), function(c) {
		return true
	}));
	YAHOO.util.Dom.addClass(b.body, "network");
	b.show()
};
YAHOO.cc.plus.show_info = function(a) {
	document.getElementById("more-container").innerHTML = a;
	document.getElementById("more-container").setAttribute("class",
			"license more")
};
YAHOO.cc.attribution.show_info = function(a) {
	document.getElementById("work-attribution").value = a.marking;
	document.getElementById("work-attribution-container").style.display = "block";
	if (a.details != "") {
		document.getElementById("attribution-container").innerHTML = a.details
	}
	return
};
YAHOO.cc.success = function(a) {
	if (a.attribution.details != "") {
		YAHOO.cc.attribution.show_info(a.attribution)
	}
	if (a.registration != "") {
		YAHOO.cc.network.show_info(a.registration)
	}
	if (a.more_permissions != "") {
		YAHOO.cc.plus.show_info(a.more_permissions)
	}
	return
};
YAHOO.cc.load = function() {
	var a = document.location.pathname;
	if (!a.match("/$")) {
		a += "/"
	}
	YAHOO.util.Event.addListener("work-attribution", "click", function() {
		var b = _gaq._getAsyncTracker("UA-2010376-1");
		b._trackPageview(a + "article-attribution-click");
		return true
	});
	if (typeof document.getElementById("work-attribution").oncopy) {
		document.getElementById("work-attribution").oncopy = function() {
			var b = _gaq._getAsyncTracker("UA-2010376-1");
			b._trackPageview(a + "article-attribution-copied");
			return true
		}
	}
};
YAHOO.util.Event.onDOMReady(YAHOO.cc.load);