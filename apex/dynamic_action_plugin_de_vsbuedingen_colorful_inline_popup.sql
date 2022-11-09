prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.0'
,p_default_workspace_id=>27635782693646703
,p_default_application_id=>501
,p_default_id_offset=>65309767924897831
,p_default_owner=>'PROD'
);
end;
/
 
prompt APPLICATION 501 - Plugin  - Colorful Inline Popup
--
-- Application Export:
--   Application:     501
--   Name:            Plugin  - Colorful Inline Popup
--   Date and Time:   11:41 Wednesday November 9, 2022
--   Exported By:     JSTARK
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 65418063809743154
--   Manifest End
--   Version:         21.2.0
--   Instance ID:     203728999270495
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/de_vsbuedingen_colorful_inline_popup
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(65418063809743154)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'DE.VSBUEDINGEN.COLORFUL_INLINE_POPUP'
,p_display_name=>'VS - Colorful Inline Popup'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render ',
'  ( p_dynamic_action in apex_plugin.t_dynamic_action',
'  , p_plugin         in apex_plugin.t_plugin ',
'  )',
'return apex_plugin.t_dynamic_action_render_result',
'as',
'',
'    l_result     apex_plugin.t_dynamic_action_render_result;',
'',
'begin',
'    ',
'    --debug',
'    if apex_application.g_debug ',
'    then',
'        apex_plugin_util.debug_dynamic_action',
'          ( p_plugin         => p_plugin',
'          , p_dynamic_action => p_dynamic_action',
'          );',
'    end if;',
'    ',
'    l_result.javascript_function := ''function() {''',
'        ||''const closestHtml = $(this.triggeringElement).closest("html");''',
'        ||''const pageId = closestHtml.closest(''''[class^="page"]'''').attr("class").split(/\s+/)?.filter(x => x.startsWith("page-"))?.[0]?.replace("page-", "");''',
'        ||''const popupId = `#PopupLov_${pageId}_${this.triggeringElement.id}_dlg`;''',
'        ||''const popupElement = $(top.parent.document).find(popupId);''',
'        ||''''',
'        ||''const waitForLoading = function(popupElement, callback) {if (popupElement.find("span.u-Processing").length === 0) {callback();} else {setTimeout(function() {waitForLoading(popupElement, callback);}, 250);}};''',
'        ||''''',
'        ||''function addValueAsClass() {''',
'        ||''    setTimeout(function() {''',
'        ||''        waitForLoading(popupElement, function() {''',
'        ||''            setTimeout(function() {''',
'        ||''                popupElement.find("li.a-IconList-item").each(function () {''',
'        ||''                    const _this = $(this);''',
'        ||''                    _this.addClass(_this.data("id"));''',
'        ||''                });''',
'        ||''            }, 50);''',
'        ||''        });''',
'        ||''    }, 150);''',
'        ||''}''',
'        ||''addValueAsClass();''',
'        ||''''',
'        ||''popupElement.find(".a-GV-loadMoreButton").click(() => addValueAsClass());''',
'    ||''}'';',
'',
'    return l_result;',
'end render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'ITEM'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This Plugin can be used to style a Popup LOVs Inline Popup.',
'It uses the ListOfValues "Return Value" and set it as the list entry class.',
'',
'For Example:',
'A Popup LOV to select a class from Universal Theme (https://apex.oracle.com/pls/apex/r/apex_pm/ut/color-and-status-modifiers).',
'Color 1, 2 and 3 should be selectable.',
'The ListOfValue for the item should be:',
'Color 1 : u-color-1',
'Color 2 : u-color-2',
'Color 3 : u-color-3',
'',
'So each list item gets the corresponding class'))
,p_version_identifier=>'0.3'
,p_about_url=>'https://github.com/aerztliche-verrechnungsstelle-buedingen/apex-colorful-inline-popup'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
