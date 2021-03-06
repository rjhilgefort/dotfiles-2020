/**
 * Default config
 * https://github.com/brookhong/Surfingkeys/blob/d96246d3a37abead7899d2b197b7f0dbe050cc95/pages/default.js#L258
 */

const modes = {};

function addMode(mode, mapFn, mapkeyFn, unmapFn) {
  if (typeof mode === "string") mode = { name: mode };
  mode.mapFn = mapFn;
  mode.mapkeyFn = mapkeyFn;
  mode.unmapFn = unmapFn;
  modes[mode.name] = mode;
}

function addProvider(key, name, url, ...args) {
  addSearchAliasX(key, name, url, ...args);
  mapkey(`o${key}`, `#8Open Search with alias ${key}`, () =>
    Front.openOmnibar({ type: "SearchEngine", extra: key })
  );
}

function mapp(mode, ...args) {
  if (typeof mode === "string") {
    args.unshift(mode);
    mode = modes.Normal;
  }
  if (args.length < 3) args.splice(1, 0, "");
  mode.mapkeyFn(...args);
}

function alias(mode, key, target, replace) {
  if (typeof mode === "string") {
    replace = target;
    target = key;
    key = mode;
    mode = modes.Normal;
  }
  mode.mapFn(key, target);
  if (replace) unmapp(mode, target);
}

function unmapp(mode, keys) {
  if (arguments.length === 1) {
    keys = mode;
    mode = modes.Normal;
  }
  if (typeof keys === "string") keys = [keys];
  for (const key of keys) mode.unmapFn(key);
}

function init() {
  addMode(Normal, map, mapkey, unmap);
  addMode(Insert, imap, imapkey, iunmap);
  addMode(Visual, vmap, vmapkey, vunmap);
}

function doSettings() {
  Hints.characters = "asdfghjkl;";
  chrome.storage.local.set({ noPdfViewer: 1 });
  settings.caseSensitive = true;
  // settings.smartCase = true;
}

function mappings() {
  // Disable surfing keys for page
  map("<Ctrl-i>", "<Alt-s>");

  // TABS
  ////////////////////////////////////////////////////////
  alias("dd", "x", true);
  alias("gM", "<Alt-m>", true);
  alias("gp", "<Alt-p>", true);
  mapp(",r", "#4 Reload the page uncached", () =>
    RUNTIME("reloadTab", { nocache: true })
  );
  alias("u", "X", true);
  alias("<A-Tab>", "gt");
  // TODO: move tabs more easily with "<Ctrl+{>"
  // alias("<Ctrl-{>", "E", true);
  // mapp("<Ctrl-Shift-[>", "#7 test 1", () => alert("<Ctrl-Shift-[>"));
  // mapp("{", "#7 test 1", () => {
  //   alert("<Ctrl-{>");
  // });
  // mapp("{", "#7 test 1", () => {
  //   alert("<Ctrl-{>");
  // });
  // mapp("<Shift+[>", "#7 test 1", () => {
  //   alert("<Ctrl-{>");
  // });

  mapp("p", "#7 Paste URL in current tab", () => {
    Clipboard.read(({ data }) => (window.location.href = data));
  });
  mapp("P", "#7 Paste URL in new tab", () => {
    Clipboard.read(({ data }) => tabOpenLink(data));
  });
  mapp("<Ctrl-p>", "#2 Unpin tab", () => {
    RUNTIME("togglePinTab");
  });

  // SCROLLING
  ////////////////////////////////////////////////////////
  // mapp("<Ctrl-y>", "#2 pageUp", () => Normal.scroll("pageUp"), {
  //   repeatIgnore: true,
  // });
  // mapp("<Ctrl-e>", "#2 pageDown", () => Normal.scroll("pageDown"), {
  //   repeatIgnore: true,
  // });
  mapp("<Ctrl-u>", "#2 pageUp", () => Normal.scroll("pageUp"), {
    repeatIgnore: true,
  });
  mapp("<Ctrl-d>", "#2 pageDown", () => Normal.scroll("pageDown"), {
    repeatIgnore: true,
  });
  // mapp("<Ctrl-b>", "#2 pageUp", () => Normal.scroll("pageUp"), {
  //   repeatIgnore: true,
  // });
  // mapp("<Ctrl-f>", "#2 pageDown", () => Normal.scroll("pageDown"), {
  //   repeatIgnore: true,
  // });

  // HISTORY
  ////////////////////////////////////////////////////////
  alias("H", "S", true);
  alias("L", "D", true);

  // LINKS
  alias("F", "af", true);

  // NAV
  alias("st", "su", true);
  mapkey("su", "#4 Edit current URL with vim editor (same tab)", () => {
    Front.showEditor(
      window.location.href,
      (url) => (window.location = url),
      "url"
    );
  });
  mapkey(
    "g#",
    "#4Reload current page without hash string (all parts after #)",
    function () {
      window.location.href = window.location.href.replace(/#[^\#]*$/, "");
    }
  );

  // INPUT
  ////////////////////////////////////////////////////////
  mapp("a", "#1 Append to edit box", () => {
    Hints.create(
      "input:visible, textarea:visible, *[contenteditable=true], select:visible",
      Hints.dispatchMouseClick
    );
    const element = document.activeElement;
    // contenteditable
    if (element.setSelectionRange === undefined) {
      const selection = document.getSelection();
      selection.setPosition(
        selection.focusNode,
        selection.focusNode.data.length - 1
      );
      Visual.showCursor();
      Visual.hideCursor();
      return;
    }
    element.setSelectionRange(element.value.length, element.value.length);
  });
  alias("A", "I");
  mapkey("ga", "#1 Go to last input", () =>
    Hints.create("input[type=text]:visible:last", Hints.dispatchMouseClick)
  );
  alias(modes.Insert, "<Ctrl-o>", "<Ctrl-i>", true);
  alias(modes.Insert, "<Ctrl-i>", "<Ctrl-f>", true);
  alias(modes.Insert, "<Ctrl-h>", "<Alt-b>");
  alias(modes.Insert, "<Ctrl-l>", "<Alt-f>");
}

function unmappings() {
  // unmapp(["<Ctrl-i>", "B", "ab"]);
  // disable emojis
  // unmapp(modes.Insert, ":");
}

function providers() {
  addProvider("T", "twitch", "https://twitch.tv");
  addProvider("r", "reddit", "https://www.reddit.com/r/");
  addProvider("w", "wikipedia", "https://en.wikipedia.org/w/index.php?search=");
}

init();
doSettings();
mappings();
// unmappings();
providers();

unmapAllExcept([], /\/mail.google.com\//);
