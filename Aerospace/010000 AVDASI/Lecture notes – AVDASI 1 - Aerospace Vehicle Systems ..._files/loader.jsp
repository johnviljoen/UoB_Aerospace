




//sessionkey
var var_key = "1fc281dd-60f8-11eb-9ed0-026158560e10";
var var_dashboard_url = "https://bristolprod.eesysoft.com";
var var_loadfile = "https://bristolprod.eesysoft.com/loadFile";
var var_style_path = "https://bristolprod.eesysoft.com/resources/";
var var_stamp = "20210127233502";
var var_eesy_build = "17888";
var var_eesy_dbUpdateCount = "40369";
var var_eesy_userUpdated = undefined;
var var_eesy_style_checksum = "d41d8cd98f00b204e9800998ecf8427e";
var var_show_tab_initial = true;
var var_show_tab = var_show_tab_initial;
var var_open_dashboard_in_new_window = false;
var var_tab_version = 2;
var var_proactive_version = 3;
var var_proactive_lms = "blackboard";
var var_proactive_dark = true;
var var_open_as_chat = false;
var var_moveable_tab = true;
var var_language = -1;
var var_uefMode = false;
var var_uefModeOriginal = !var_uefMode && (window.name === "classic-learn-iframe");
var var_uefModeOriginalUseUefSupportCenter = false;
var var_loadExpertTool = true;
var var_isExpertToolChromePlugin = false;
var templates;
var waitforload = false;
var supportTabMinimized = undefined;
var scrollbarRightAdjust = '19px';
var supportTabMoveLimit = '50';
var eesy_minimizedTabWidth = '8px';
var eesy_maximizedTabWidth = '';
var attemptUnobscure = false;
var doNotLoadEngineForUserAgentPattern = 'not_in_use_05231;';
var var_eesy_hiddenHelpItems = undefined;
var var_eesy_sac = undefined;
var var_eesy_helpitemsSeen = undefined;
var var_user_map = {"isDebug":false,"userUpdatedStamp":"20210126143713","supportTabPosition":null,"isShowTab":false,"languageId":-1,"isSupportTabMinimized":false,"id":13961};

function eesy_load_js(jsUrl) {
  var fileref = document.createElement("script");
  fileref.setAttribute("type", "text/javascript");
  fileref.setAttribute("src", jsUrl);
  document.getElementsByTagName("head")[0].appendChild(fileref);
}

eesy_load_js(var_dashboard_url + "/loader.js?u=" + var_eesy_build);
