/*
CSS Browser Selector v0.3.5 (Feb 05, 2010)
Rafael Lima (http://rafael.adm.br)
http://rafael.adm.br/css_browser_selector
License: http://creativecommons.org/licenses/by/2.5/
Contributors: http://rafael.adm.br/css_browser_selector#contributors
*/
(function(w, u) {
	w["_BrowserCss"] = function(u) {
		
		u = u.toLowerCase();
		
		function is(t) {
			return u.indexOf(t) > -1;
		}
		
		var b = [];
		function p(a) {
			b = b.concat(a);
		}
		
		// browser type
		switch (true) {
			case (!(/opera|webtv/i.test(u)) && /msie\s(\d)/.test(u)):
				p(["ie", "ie" + RegExp.$1]);
				break;
			case is("firefox/2"):
				p(["gecko", "ff2"]);
				break;
			case is("firefox/3.5"):
				p(["gecko", "ff3", "ff3_5"]);
				break;
			case is("firefox/3.6"):
				p(["gecko", "ff3", "ff3_6"]);
				break;
			case is("firefox/3"):
				p(["gecko", "ff3"]);
				break;
			case is("gecko/"):
				p(["gecko"]);
				break;
			case is("opera") && /version\/(\d+)/.test(u):
				p(["opera", "opera" + RegExp.$1]);
				break;
			case is("opera") && /opera(\s|\/)(\d+)/.test(u):
				p(["opera", "opera" + RegExp.$2]);
				break;
			case is("opera"):
				p(["opera"]);
				break;
			case is("konqueror"):
				p(["konqueror"]);
				break;
			case is("chrome"):
				p(["webkit", "chrome"]);
				break;
			case is("iron"):
				p(["webkit", "iron"]);
				break;
			case is("applewebkit/") && /version\/(\d+)/.test(u):
				p(["webkit", "safari", "safari" + RegExp.$1]);
				break;
			case is("applewebkit/"):
				p(["webkit", "safari"]);
				break;
			case is("mozilla/"):
				p(["gecko"]);
				break;
		}
		
		// platform
		switch (true) {
			case is("j2me"):
				p(["mobile"]);
				break;
			case is("blackberry"):
				p(["blackberry"]);
				break;
			case is("iphone"):
				p(["iphone"]);
				break;
			case is("ipod"):
				p(["ipod"]);
				break;
			case is("ipad"):
				p(["ipad"]);
				break;
			case is("android"):
				p(["android"]);
				break;
			case is("mac"):
				p(["mac"]);
				break;
			case is("darwin"):
				p(["mac"]);
				break;
			case is("webtv"):
				p(["webtv"]);
				break;
			case is("win"):
				p(["win"]);
				break;
			case is("freebsd"):
				p(["freebsd"]);
				break;
			case is("x11") || is("linux"):
				p(["linux"]);
				break;
		}
		
		// js
		p(["js"]);
		
		b.sort();
		return b;
	}
	
	document.documentElement.className += " " + _BrowserCss(u).join(" ");
})(window, navigator.userAgent);