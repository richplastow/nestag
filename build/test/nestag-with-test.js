// Generated by CoffeeScript 1.9.2
/*! Nestag 0.0.4 //// MIT Licence //// http://nestag.richplastow.com/ */
(function(global) {

/* Define the Oopish container. 
Rather than just a generic object, the Oopish container can also be used as 
a handy shortcut for console.log(). Note bind() (http://goo.gl/66ffgl), and 
unusual IE8-9 behaviour (http://goo.gl/ZmG9Xs). */
var oo = (function (c) { return (
(!c || !c.log) // IE8-9 without F12 dev-tools, IE6-7, FF1-3.6
? function () {}
: ("object" === typeof c.log) // IE8-9 with F12 dev-tools
? function () { c.log([].slice.call(arguments).join(" ")) }
: (! Function.prototype.bind) // OP10.6-11.5, SF4-5.0, iOS3-5.1, ADRD2.1-3.0?
? function () { c.log.apply(c, arguments) }
: c.log.bind(c)
)}(global.console));

/* Define constants generated by oopish-build and injected into app-scope. */
oo.G = global // global scope, passed into the closure as an argument
oo.T = "Nestag" // project title, from package.json
oo.V = "0.0.4" // project version, from package.json


/*! Nestag 0.0.4 */
var Location, Nestag, Tudor, global_tags, tudor,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

oo.A = 'array';

oo.B = 'boolean';

oo.D = 'document';

oo.E = 'error';

oo.F = 'function';

oo.I = 'integer';

oo.N = 'number';

oo.O = 'object';

oo.R = 'regexp';

oo.S = 'string';

oo.U = 'undefined';

oo.X = 'null';

oo._ = (Math.random().toString(36) + '00000000').substr(2, 8);

oo.ROBUSTABLE = (function() {
  if (!Object.preventExtensions) {
    return false;
  } else if (Object.defineProperty) {
    try {
      Object.defineProperty({}, 'x', {});
      return true;
    } catch (_error) {
      return false;
    }
  } else {
    return true;
  }
})();

oo.is = function(c, t, f) {
  if (t == null) {
    t = true;
  }
  if (f == null) {
    f = false;
  }
  if (c) {
    return t;
  } else {
    return f;
  }
};

oo.isU = function(x) {
  return oo.U === typeof x;
};

oo.isX = function(x) {
  return null === x;
};

oo.type = function(a) {
  var ta;
  if (oo.isX(a)) {
    return oo.X;
  }
  ta = typeof a;
  if ({
    undefined: 1,
    string: 1,
    number: 1,
    boolean: 1
  }[ta]) {
    return ta;
  }
  if (!a.nodeName && a.constructor !== Array && /function/i.test('' + a)) {
    return oo.F;
  }
  return {}.toString.call(a).match(/\s([a-z0-9]+)/i)[1].toLowerCase();
};

oo.ex = function(x, a, b) {
  var pos;
  if (-1 === (pos = a.indexOf(x))) {
    return x;
  } else {
    return b.charAt(pos);
  }
};

oo.has = function(h, n, t, f) {
  if (t == null) {
    t = true;
  }
  if (f == null) {
    f = false;
  }
  if (-1 !== h.indexOf(n)) {
    return t;
  } else {
    return f;
  }
};

oo.uid = function(p) {
  if (p == null) {
    p = 'id';
  }
  return p + '_' + (Math.random().toString(36) + '00000000').substr(2, 8);
};

oo.uid62 = function(p, l) {
  var c;
  if (p == null) {
    p = 'id';
  }
  if (l == null) {
    l = 8;
  }
  c = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  return p + '_' + ((function() {
    var results;
    results = [];
    while (l--) {
      results.push(c.charAt(Math.floor(Math.random() * 62)));
    }
    return results;
  })()).join('');
};

oo.pad = function(s, l, c) {
  if (c == null) {
    c = ' ';
  }
  return s + Array(l - s.length + 1).join(c);
};

oo.insert = function(basis, overlay, offset) {
  return basis.slice(0, offset) + overlay + basis.slice(offset + overlay.length);
};

if (oo.ROBUSTABLE) {
  oo.define = function(obj, name, value, kind) {
    switch (kind) {
      case 'constant':
        return Object.defineProperty(obj, name, {
          value: value,
          enumerable: true
        });
      case 'private':
        return Object.defineProperty(obj, name, {
          value: value,
          enumerable: false
        });
    }
  };
} else {
  oo.define = function(obj, name, value, kind) {
    return obj[name] = value;
  };
}

if (oo.ROBUSTABLE) {
  oo.lock = function(obj) {
    var j, key, len, ref;
    ref = Object.keys(obj);
    for (j = 0, len = ref.length; j < len; j++) {
      key = ref[j];
      Object.defineProperty(obj, key, {
        writable: false,
        configurable: false
      });
    }
    Object.preventExtensions(obj);
    if (obj.prototype && obj !== obj.prototype) {
      return oo.lock(obj.prototype);
    }
  };
} else {
  oo.lock = function() {};
}

oo.vArray = function(M, arr, signature, fallback) {
  var i, j, k, len, len1, limit, matches, max, min, pass, ref, ref1, ref2, rule, tv, type, types, value;
  matches = signature.match(/^<\[([|a-z]+)\s*(.*)\](\d+-\d+)?>$/i);
  if (!matches) {
    throw RangeError("/nestag/oopish/oo-helpers.litcoffee oo.vArray()\n  signature " + signature + " is invalid");
  }
  signature = matches[0], types = matches[1], rule = matches[2], limit = matches[3];
  if (!arr) {
    return fallback;
  }
  if (limit) {
    ref = limit.split('-'), min = ref[0], max = ref[1];
    if (arr.length < min || arr.length > max) {
      throw RangeError(M + (".length is " + arr.length + " (must be " + limit + ")"));
    }
  }
  if (oo.A !== oo.type(arr)) {
    throw RangeError(M + (" is type " + (oo.type(arr)) + " not array"));
  }
  for (i = j = 0, len = arr.length; j < len; i = ++j) {
    value = arr[i];
    tv = oo.type(value);
    pass = false;
    ref1 = types.split('|');
    for (k = 0, len1 = ref1.length; k < len1; k++) {
      type = ref1[k];
      if ((oo.N === type || oo.I === type) && oo.N === tv) {
        if (oo.I === type && value % 1) {
          throw RangeError(M + ("[" + i + "] is a number but not an integer"));
        }
        if (rule) {
          ref2 = rule.split('-'), min = ref2[0], max = ref2[1];
          if (value < min || value > max) {
            throw RangeError(M + ("[" + i + "] is " + value + " (must be " + rule + ")"));
          }
        }
        pass = true;
        break;
      }
      if (type === tv) {
        if (oo.S === tv && rule) {
          if (!RegExp(rule).test(value)) {
            throw RangeError(M + ("[" + i + "] fails " + rule));
          }
        }
        pass = true;
        break;
      }
      if (/^[A-Z]/.test(type)) {
        if (oo.O === tv) {
          if (eval("value instanceof " + type)) {
            pass = true;
            break;
          }
        }
      }
    }
    if (pass) {
      continue;
    }
    throw TypeError(M + ("[" + i + "] is type " + tv + " not " + types));
  }
  return arr;
};

oo.vArg = function(M, value, signature, fallback) {
  var j, key, len, matches, max, min, pfx, ref, ref1, rule, tv, type, types;
  matches = signature.match(/^([_a-z][_a-z0-9]*)\s+<([|a-z]+)\s*(.*)>$/i);
  if (!matches) {
    throw RangeError("/nestag/oopish/oo-helpers.litcoffee oo.vArg()\n  signature " + signature + " is invalid");
  }
  signature = matches[0], key = matches[1], types = matches[2], rule = matches[3];
  pfx = M + ("argument " + key + " ");
  tv = oo.type(value);
  if (oo.U === tv) {
    if (4 === arguments.length) {
      return fallback;
    }
    throw TypeError(pfx + "is undefined and has no fallback");
  }
  ref = types.split('|');
  for (j = 0, len = ref.length; j < len; j++) {
    type = ref[j];
    if ((oo.N === type || oo.I === type) && oo.N === tv) {
      if (oo.I === type && value % 1) {
        throw RangeError(pfx + "is a number but not an integer");
      }
      if (rule) {
        ref1 = rule.split('-'), min = ref1[0], max = ref1[1];
        if (value < min || value > max) {
          throw RangeError(pfx + ("is " + value + " (must be " + rule + ")"));
        }
      }
      return value;
    }
    if (type === tv) {
      if (oo.S === tv && rule) {
        if (!RegExp(rule).test(value)) {
          throw RangeError(pfx + ("fails " + rule));
        }
      }
      return value;
    }
    if (/^[A-Z]/.test(type)) {
      if (oo.O === tv) {
        if (eval("value instanceof " + type)) {
          return value;
        }
      }
    }
  }
  throw TypeError(pfx + ("is type " + tv + " not " + types));
};

oo.vObject = function(M, objName, obj) {
  if (oo.O !== oo.type(obj)) {
    throw TypeError(M + objName + (" is type " + (oo.type(obj)) + " not object"));
  }
  return function(signature, fallback) {
    var j, key, len, matches, max, min, ref, ref1, rule, tv, type, types, value;
    matches = signature.match(/^([_a-z][_a-z0-9]*)\s+<([|a-z]+)\s*(.*)>$/i);
    if (!matches) {
      throw RangeError("/nestag/oopish/oo-helpers.litcoffee oo.vObject()\n  signature " + signature + " is invalid");
    }
    signature = matches[0], key = matches[1], types = matches[2], rule = matches[3];
    value = obj[key];
    tv = oo.type(value);
    if (oo.U === tv) {
      if (2 === arguments.length) {
        return fallback;
      }
      throw TypeError(M + objName + '.' + key + " is undefined and has no fallback");
    }
    ref = types.split('|');
    for (j = 0, len = ref.length; j < len; j++) {
      type = ref[j];
      if ((oo.N === type || oo.I === type) && oo.N === tv) {
        if (oo.I === type && value % 1) {
          throw RangeError(M + objName + '.' + key + " is a number but not an integer");
        }
        if (rule) {
          ref1 = rule.split('-'), min = ref1[0], max = ref1[1];
          if (value < min || value > max) {
            throw RangeError(M + objName + '.' + key + (" is " + value + " (must be " + rule + ")"));
          }
        }
        return value;
      }
      if (type === tv) {
        if (oo.S === tv && rule) {
          if (!RegExp(rule).test(value)) {
            throw RangeError(M + objName + '.' + key + (" fails " + rule));
          }
        }
        return value;
      }
      if (/^[A-Z]/.test(type)) {
        if (oo.O === tv) {
          if (eval("value instanceof " + type)) {
            return value;
          }
        }
      }
    }
    throw TypeError(M + objName + '.' + key + (" is type " + tv + " not " + types));
  };
};

Location = (function() {
  Location.prototype.C = 'Location';

  Location.prototype.toString = function() {
    return '[object Location]';
  };

  function Location(config) {
    var M, v;
    if (config == null) {
      config = {};
    }
    M = '/nestag/src/Location.litcoffee Location()\n  ';
    v = oo.vObject(M, 'config', config);
    this.coord = v('coord <string>');
    this.tags = oo.vArray(M + 'config.tags', config.tags, '<[integer 0-999999]>', []);
    this.tags = 123;
    this.ancestors = [];
    this.neighbors = [];
    this.corners = [];
    if ('Location' === this.C) {
      oo.lock(this);
    }
  }

  return Location;

})();

oo.lock(Location);

Nestag = (function() {
  Nestag.prototype.C = 'Nestag';

  Nestag.prototype.toString = function() {
    return '[object Nestag]';
  };

  function Nestag(config) {
    var M, v;
    if (config == null) {
      config = {};
    }
    M = '/nestag/src/Nestag.litcoffee Nestag()\n  ';
    v = oo.vObject(M, 'config', config);
    this.grid = oo.vArray(M + 'config.grid', config.grid, '<[integer 0-999999]1-24>', [2, 2]);
    this.nest = v('nest <integer 0-999999>', 9999);
    oo.define(this, oo._, {}, 'private');
    this[oo._]._locations = {};
    if ('Nestag' === this.C) {
      oo.lock(this);
    }
  }

  return Nestag;

})();

global_tags = ['strict', 'skip'];

global_tags.strict = 0;

global_tags.skip = 1;

Tudor = (function() {
  Tudor.prototype.I = 'Tudor';

  Tudor.prototype.toString = function() {
    return "[object " + I + "]";
  };

  Tudor.prototype.articles = [];

  function Tudor(opt) {
    this.opt = opt != null ? opt : {};
    this["do"] = bind(this["do"], this);
    switch (this.opt.format) {
      case 'html':
        this.pageHead = function(summary) {
          return "<style>\n  body     { font-family: sans-serif; }\n  a        { outline: 0; }\n  b        { display: inline-block; width: .7em }\n\n  b.pass              { color: #393 }\n  b.fail              { color: #bbb }\n  article.fail b.pass { color: #bbb }\n  section.fail b.pass { color: #bbb }\n\n  pre      { padding: .5em; margin: .2em 0; border-radius: 4px; }\n  pre.fn   { background-color: #fde }\n  pre.pass { background-color: #cfc }\n  pre.fail { background-color: #d8e0e8 }\n\n  article  { margin-bottom: .5rem }\n  article h2 { padding-left:.5rem; margin:0; font-weight:normal }\n  article.pass { border-left: 5px solid #9c9 }\n  article.fail { border-left: 5px solid #9bf }\n  article.fail h2 { margin-bottom: .5rem }\n  article.pass >div { display: none }\n\n  section  { margin-bottom: .5rem }\n  section h3   { padding-left: .5rem; margin: 0; }\n  section.pass { border-left: 3px solid #9c9 }\n  section.fail { border-left: 3px solid #9bf }\n  section.fail h3 { margin-bottom: .5rem }\n  section.pass >div { display: none }\n\n  article.fail section.pass { border-left-color: #ccc }\n\n  div      { padding-left: .5em; }\n  div.fail { border-left: 3px solid #9bf; font-size: .8rem }\n  div h4   { margin: 0 }\n  div h4 { font: normal .8rem/1.2rem monaco, monospace }\n  div.fail, div.fail h4 { margin: .5rem 0 }\n\n</style>\n<h4><a href=\"#end\" id=\"top\">\u2b07</a>  " + summary + "</h4>";
        };
        this.pageFoot = function(summary) {
          return "<h4><a href=\"#top\" id=\"end\">\u2b06</a>  " + summary + "</h4>\n<script>\n  document.title='" + (summary.replace(/<\/?[^>]+>/g, '')) + "';\n</script>";
        };
        this.articleHead = function(heading, fail) {
          return ("<article class=\"" + (fail ? 'fail' : 'pass') + "\">") + ("<h2>" + (fail ? this.cross : this.tick) + heading + "</h2><div>");
        };
        this.articleFoot = '</div></article>';
        this.sectionHead = function(heading, fail) {
          return ("<section class=\"" + (fail ? 'fail' : 'pass') + "\">") + ("<h3>" + (fail ? this.cross : this.tick) + heading + "</h3><div>");
        };
        this.sectionFoot = '</div></section>';
        this.jobFormat = function(heading, result) {
          return ("<div class=\"" + (result ? 'fail' : 'pass') + "\">") + ("<h4>" + (result ? this.cross : this.tick) + heading + "</h4>") + ("" + (result ? this.formatError(result) : '')) + "</div>";
        };
        this.tick = '<b class="pass">\u2713</b> ';
        this.cross = '<b class="fail">\u2718</b> ';
        break;
      default:
        this.pageHead = function(summary) {
          return "" + summary;
        };
        this.pageFoot = function(summary) {
          return "\n" + summary;
        };
        this.articleHead = function(heading, fail) {
          return "\n" + (fail ? this.cross : this.tick) + " " + heading + "\n===" + (new Array(heading.length).join('=')) + "\n";
        };
        this.articleFoot = '';
        this.sectionHead = function(heading, fail) {
          return "\n" + (fail ? this.cross : this.tick) + " " + heading + "\n---" + (new Array(heading.length).join('-')) + "\n";
        };
        this.sectionFoot = '';
        this.jobFormat = function(heading, result) {
          return ((result ? this.cross : this.tick) + " " + heading) + ("" + (result ? '\n' + this.formatError(result) : ''));
        };
        this.jobFoot = '';
        this.tick = '\u2713';
        this.cross = '\u2718';
    }
  }

  Tudor.prototype.add = function(lines) {
    var article, i, line, runner, section;
    article = {
      sections: []
    };
    runner = null;
    section = null;
    if (oo.A !== oo.type(lines)) {
      throw Error("`lines` isn’t an array");
    }
    if (0 === lines.length) {
      throw Error("`lines` has no elements");
    }
    if (oo.S !== oo.type(lines[0])) {
      throw Error("`lines[0]` isn’t a string");
    }
    article.heading = lines.shift();
    i = 0;
    while (i < lines.length) {
      line = lines[i];
      switch (oo.type(line)) {
        case oo.O:
          if (!line.runner) {
            throw new Error("Errant object");
          }
          runner = line.runner;
          break;
        case oo.F:
          section.jobs.push(line);
          break;
        case oo.S:
          if (this.isAssertion(lines[i + 1], lines[i + 2])) {
            if (!section) {
              throw new Error("Cannot add an assertion here");
            }
            section.jobs.push([runner, line, lines[++i], lines[++i]]);
          } else {
            section = {
              heading: line,
              jobs: []
            };
            article.sections.push(section);
          }
      }
      i++;
    }
    return this.articles.push(article);
  };

  Tudor.prototype["do"] = function() {
    var actual, art, artFail, artPass, article, e, error, expect, heading, j, job, k, len, len1, len2, m, mock, mockFail, pge, pgeFail, pgePass, ref, ref1, ref2, result, runner, sec, secFail, secPass, section, summary;
    pge = [];
    mock = [];
    pgePass = pgeFail = mockFail = 0;
    ref = this.articles;
    for (j = 0, len = ref.length; j < len; j++) {
      article = ref[j];
      art = [];
      artPass = artFail = 0;
      ref1 = article.sections;
      for (k = 0, len1 = ref1.length; k < len1; k++) {
        section = ref1[k];
        sec = [];
        secPass = secFail = 0;
        ref2 = section.jobs;
        for (m = 0, len2 = ref2.length; m < len2; m++) {
          job = ref2[m];
          switch (oo.type(job)) {
            case oo.F:
              try {
                mock = job.apply(this, mock);
              } catch (_error) {
                e = _error;
                error = e.message;
              }
              if (error) {
                mockFail++;
                secFail++;
                sec.push(this.formatMockModifierError(job, error));
              }
              break;
            case oo.A:
              runner = job[0], heading = job[1], expect = job[2], actual = job[3];
              result = runner(expect, actual, mock);
              if (!result) {
                sec.push(this.jobFormat("" + (this.sanitize(heading))));
                pgePass++;
                artPass++;
                secPass++;
              } else {
                sec.push(this.jobFormat("" + (this.sanitize(heading)), result));
                pgeFail++;
                artFail++;
                secFail++;
              }
          }
        }
        sec.unshift(this.sectionHead("" + (this.sanitize(section.heading)), secFail));
        sec.push(this.sectionFoot);
        art = art.concat(sec);
      }
      art.unshift(this.articleHead("" + (this.sanitize(article.heading)), artFail));
      art.push(this.articleFoot);
      pge = pge.concat(art);
      summary = pgeFail ? this.cross + " FAILED " + pgeFail + "/" + (pgePass + pgeFail) : this.tick + " Passed " + pgePass + "/" + (pgePass + pgeFail);
      if (mockFail) {
        summary = "\n" + this.cross + " (MOCK FAILS)";
      }
    }
    pge.unshift(this.pageHead(summary));
    pge.push(this.pageFoot(summary));
    return pge.join('\n');
  };

  Tudor.prototype.formatError = function(result) {
    switch (result.length + "-" + this.opt.format) {
      case '2-html':
        return result[0] + "\n<pre class=\"fail\">" + (this.sanitize(result[1].message)) + "</pre>";
      case '2-plain':
        return result[0] + "\n" + (this.sanitize(result[1].message));
      case '3-html':
        return "<pre class=\"fail\">" + (this.sanitize(this.reveal(result[0]))) + "</pre>\n..." + result[1] + "...\n<pre class=\"pass\">" + (this.sanitize(this.reveal(result[2]))) + "</pre>";
      case '3-plain':
        return (this.sanitize(this.reveal(result[0]))) + "\n..." + result[1] + "...\n" + (this.sanitize(this.reveal(result[2])));
      case '4-html':
        return "<pre class=\"fail\">" + (this.sanitize(this.reveal(result[0]))) + " (" + (oo.type(result[0])) + ")</pre>\n..." + result[1] + "...\n<pre class=\"pass\">" + (this.sanitize(this.reveal(result[2]))) + " (" + (oo.type(result[2])) + ")</pre>";
      case '4-plain':
        return (this.sanitize(this.reveal(result[0]))) + " (" + (oo.type(result[0])) + ")\n..." + result[1] + "...\n" + (this.sanitize(this.reveal(result[2]))) + " (" + (oo.type(result[2])) + ")";
      default:
        throw new Error("Cannot process '" + result.length + "-" + this.opt.format + "'");
    }
  };

  Tudor.prototype.formatMockModifierError = function(fn, error) {
    switch (this.opt.format) {
      case 'html':
        return "<pre class=\"fn\">" + (this.sanitize(fn + '')) + "</pre>\n...encountered an exception:\n<pre class=\"fail\">" + (this.sanitize(error)) + "</pre>";
      default:
        return (this.sanitize(fn + '')) + "\n...encountered an exception:\n" + (this.sanitize(error));
    }
  };

  Tudor.prototype.reveal = function(value) {
    return value != null ? value.toString().replace(/^\s+|\s+$/g, function(match) {
      return '\u00b7' + (new Array(match.length)).join('\u00b7');
    }) : void 0;
  };

  Tudor.prototype.sanitize = function(value) {
    switch (this.opt.format) {
      case 'html':
        return value != null ? value.toString().replace(/</g, '&lt;') : void 0;
      default:
        return value;
    }
  };

  Tudor.prototype["throw"] = {
    runner: function(expect, actual, mock) {
      var e, error;
      if (mock == null) {
        mock = [];
      }
      error = false;
      try {
        actual.apply(this, mock);
      } catch (_error) {
        e = _error;
        error = e;
      }
      if (!error) {
        return [
          'No exception thrown, expected', {
            message: expect
          }
        ];
      } else if (expect !== error.message) {
        return [error.message, 'was thrown, but expected', expect];
      }
    }
  };

  Tudor.prototype.equal = {
    runner: function(expect, actual, mock) {
      var e, error, result;
      if (mock == null) {
        mock = [];
      }
      error = false;
      try {
        result = actual.apply(this, mock);
      } catch (_error) {
        e = _error;
        error = e;
      }
      if (error) {
        return ['Unexpected exception', error];
      } else if (expect !== result) {
        if (result + '' === expect + '') {
          return [result, 'was returned, but expected', expect, true];
        } else {
          return [result, 'was returned, but expected', expect];
        }
      }
    }
  };

  Tudor.prototype.is = {
    runner: function(expect, actual, mock) {
      var e, error, result;
      if (mock == null) {
        mock = [];
      }
      error = false;
      try {
        result = actual.apply(this, mock);
      } catch (_error) {
        e = _error;
        error = e;
      }
      if (error) {
        return ['Unexpected exception', error];
      } else if (expect !== oo.type(result)) {
        return ["type " + (oo.type(result)), 'was returned, but expected', "type " + expect];
      }
    }
  };

  Tudor.prototype.match = {
    runner: function(expect, actual, mock) {
      var e, error, result;
      if (mock == null) {
        mock = [];
      }
      error = false;
      try {
        result = actual.apply(this, mock);
      } catch (_error) {
        e = _error;
        error = e;
      }
      if (error) {
        return ['Unexpected exception', error];
      } else if (oo.F !== typeof expect.test) {
        return [
          '`test()` is not a function', {
            message: expect
          }
        ];
      } else if (!expect.test('' + result)) {
        return ['' + result, 'failed test', expect];
      }
    }
  };

  Tudor.prototype.isAssertion = function(line1, line2) {
    if (oo.F !== oo.type(line2)) {
      return false;
    }
    if ((oo.O === oo.type(line1)) && oo.F === oo.type(line1.runner)) {
      return false;
    }
    return true;
  };

  return Tudor;

})();

tudor = new Tudor({
  format: oo.O === typeof window ? 'html' : 'plain'
});

Nestag.runTest = tudor["do"];

tudor.add([
  "01 Nestag Constructor", tudor.is, "The class and instance are expected types", function() {
    return [new Nestag];
  }, "The Nestag class is a function", oo.F, function() {
    return Nestag;
  }, "`new` returns an object", oo.O, function(nestag) {
    return nestag;
  }, tudor.equal, "`Nestag::C` is 'Nestag'", 'Nestag', function(nestag) {
    return nestag.C;
  }, "`Nestag::toString()` is '[object Nestag]'", '[object Nestag]', function(nestag) {
    return nestag + '';
  }, "Instance properties as expected", tudor.equal, "`Nestag::nest` is the number `9999`", 9999, function(nestag) {
    return nestag.nest;
  }, "`Nestag::_locations` is private, and is an empty object", 0, function(nestag) {
    return Object.keys(nestag[oo._]._locations).length;
  }, "`config` usage", "`config.grid` takes an array of integers", '3,3,3', function() {
    var n;
    n = new Nestag({
      grid: [3, 3, 3]
    });
    return n.grid.join(',');
  }, "`config.nest` takes an integer", 123, function() {
    var n;
    n = new Nestag({
      nest: 123
    });
    return n.nest;
  }, "`config.nest` can be 0", 0, function() {
    var n;
    n = new Nestag({
      nest: 0
    });
    return n.nest;
  }, "`config.grid` exceptions", tudor["throw"], "`config.grid` is a string", "/nestag/src/Nestag.litcoffee Nestag()\n  config.grid is type string not array", function() {
    return new Nestag({
      grid: 'nope'
    });
  }, "`config.grid` is not a whole number", "/nestag/src/Nestag.litcoffee Nestag()\n  config.grid[0] is a number but not an integer", function() {
    return new Nestag({
      grid: [1.5]
    });
  }, "`config.grid` is a negative integer", "/nestag/src/Nestag.litcoffee Nestag()\n  config.grid[1] is -1 (must be 0-999999)", function() {
    return new Nestag({
      grid: [1, -1]
    });
  }, "`config.grid` is too big", "/nestag/src/Nestag.litcoffee Nestag()\n  config.grid[2] is 1000000 (must be 0-999999)", function() {
    return new Nestag({
      grid: [2, 3, 1000000]
    });
  }, "`config.grid` is empty", "/nestag/src/Nestag.litcoffee Nestag()\n  config.grid.length is 0 (must be 1-24)", function() {
    return new Nestag({
      grid: []
    });
  }, "`config.grid` has too many elements", "/nestag/src/Nestag.litcoffee Nestag()\n  config.grid.length is 25 (must be 1-24)", function() {
    return new Nestag({
      grid: [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
    });
  }, "`config.nest` exceptions", tudor["throw"], "`config.nest` is boolean `true`", "/nestag/src/Nestag.litcoffee Nestag()\n  config.nest is type boolean not integer", function() {
    return new Nestag({
      nest: true
    });
  }, "`config.nest` is not a whole number", "/nestag/src/Nestag.litcoffee Nestag()\n  config.nest is a number but not an integer", function() {
    return new Nestag({
      nest: 1.5
    });
  }, "`config.nest` is a negative integer", "/nestag/src/Nestag.litcoffee Nestag()\n  config.nest is -1 (must be 0-999999)", function() {
    return new Nestag({
      nest: -1
    });
  }, "`config.nest` is too big", "/nestag/src/Nestag.litcoffee Nestag()\n  config.nest is 1000000 (must be 0-999999)", function() {
    return new Nestag({
      nest: 1000000
    });
  }
]);

tudor.add([
  "02 Location Constructor", tudor.is, "The class and instance are expected types", function() {
    return [
      new Location({
        coord: 'a'
      })
    ];
  }, "The Location class is a function", oo.F, function() {
    return Location;
  }, "`new` returns an object", oo.O, function(location) {
    return location;
  }, tudor.equal, "`Location::C` is 'Location'", 'Location', function(location) {
    return location.C;
  }, "`Location::toString()` is '[object Location]'", '[object Location]', function(location) {
    return location + '';
  }, "Instance properties as expected", tudor.equal, "`Location::coord` has been set to 'a'", 'a', function(location) {
    return location.coord;
  }, "`config` usage", "`config.coord` takes @todo", 'a', function() {
    var l;
    l = new Location({
      coord: 'a'
    });
    return l.coord;
  }, "`config.tags` exceptions", tudor["throw"], "`config.tags` is a string", "/nestag/src/Location.litcoffee Location()\n  config.tags is type string not array", function() {
    return new Location({
      coord: 'b',
      tags: 'nope'
    });
  }
]);

if (oo.ROBUSTABLE) {
  tudor.add([
    "91 Robust Nestag Constructor (for modern UAs)", tudor.is, "Class members are immutable in modern UAs", function() {
      return [new Nestag];
    }, "Cannot add a property to the Nestag class", oo.U, function() {
      Nestag.nope = 123;
      return Nestag.nope;
    }, "Cannot add a property to the Nestag class’s prototype object", oo.U, function(nestag) {
      Nestag.prototype.nope = 456;
      return nestag.nope;
    }, tudor.equal, "`Nestag::C` is a constant", 'Nestag', function(nestag) {
      nestag.C = 'changed!';
      return nestag.C;
    }
  ]);
}

if (oo.ROBUSTABLE) {
  tudor.add([
    "92 Robust Location Constructor (for modern UAs)", tudor.is, "Class members are immutable in modern UAs", function() {
      return [
        new Location({
          coord: 'a'
        })
      ];
    }, "Cannot add a property to the Location class", oo.U, function() {
      Location.nope = 123;
      return Location.nope;
    }, "Cannot add a property to the Location class’s prototype object", oo.U, function(location) {
      Location.prototype.nope = 456;
      return location.nope;
    }, tudor.equal, "`Location::C` is a constant", 'Location', function(location) {
      location.C = 'changed!';
      return location.C;
    }
  ]);
}

oo.lock(Nestag);

if (oo.F === typeof define && define.amd) {
  define(function() {
    return Nestag;
  });
} else if (oo.O === typeof module && module && module.exports) {
  module.exports = Nestag;
} else {
  oo.G.Nestag = Nestag;
}
}).call(this,this);
