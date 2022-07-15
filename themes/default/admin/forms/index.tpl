{ft_include file='header.tpl'}

<table cellpadding="0" cellspacing="0">
    <tr>
        <td width="45"><img src="{$images_url}/icon_forms.gif" width="34" height="34"/></td>
        <td class="title">{$LANG.word_forms}</td>
    </tr>
</table>

{if $hasInvalidCacheFolder}
    <div class="error">
        <div style="padding: 10px">
            {$LANG.text_cache_folder_problem}
        </div>
    </div>
{/if}

{ft_include file="messages.tpl"}

{if $num_forms == 0}
    <div>{$LANG.text_no_forms}</div>
{else}
    <div id="search_form" class="margin_bottom_large">

        <form action="{$same_page}" method="post">

            <table cellspacing="2" cellpadding="0" id="search_form_table">
                <tr>
                    <td class="blue" width="70">{$LANG.word_search}</td>
                    {if $clients|@count > 0}
                        <td>
                            <select name="client_id">
                                <option value=""
                                        {if $search_criteria.account_id == ""}selected{/if}>{$LANG.phrase_forms_assigned_to_any_account}</option>
                                <optgroup label="{$LANG.word_clients}">
                                    {foreach from=$clients item=client name=row}
                                        <option value="{$client.account_id}"
                                                {if $search_criteria.account_id == $client.account_id}selected{/if}>{$client.first_name} {$client.last_name}</option>
                                    {/foreach}
                                </optgroup>
                            </select>
                        </td>
                    {/if}
                    <td>
                        <select name="status">
                            <option value=""
                                    {if $search_criteria.status == ""}selected{/if}>{$LANG.phrase_all_statuses}</option>
                            <option value="online"
                                    {if $search_criteria.status == "online"}selected{/if}>{$LANG.word_online}</option>
                            <option value="offline"
                                    {if $search_criteria.status == "offline"}selected{/if}>{$LANG.word_offline}</option>
                            <option value="incomplete"
                                    {if $search_criteria.status == "incomplete"}selected{/if}>{$LANG.word_incomplete}</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" size="20" name="keyword" value="{$search_criteria.keyword|escape}"/>
                        <input type="submit" name="search_forms" value="{$LANG.word_search}"/>
                        <input type="button" name="reset" onclick="window.location='{$same_page}?reset=1'"
                                {if $forms|@count < $num_forms}
                                    value="{$LANG.phrase_show_all} ({$num_forms})" class="bold"
                                {else}
                                    value="{$LANG.phrase_show_all}" class="light_grey" disabled="disabled"
                                {/if} />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    {if $forms|@count == 0}
        <div class="notify yellow_bg">
            <div style="padding: 8px">
                {$LANG.text_no_forms_found}
            </div>
        </div>
    {else}

        {if $max_forms_reached}
            <div class="notify margin_bottom_large">
                <div style="padding:6px">
                    {$notify_max_forms_reached}
                </div>
            </div>
        {/if}

        {$pagination}

        {template_hook location="admin_forms_list_top"}

        <form action="{$same_page}" method="post">

        {assign var="table_group_id" value="1"}

        {* this displays ALL forms on the page, but groups them in separate tables - only one shown
           at a time. The page nav above hides/shows the appropriate page with JS. *}
        {foreach from=$forms item=form_info name=row}
            {assign var='index' value=$smarty.foreach.row.index}
            {assign var='count' value=$smarty.foreach.row.iteration}
            {assign var='form_id' value=$form_info.form_id}
            {assign var='clients' value=$form_info.client_info}

            {* if it's the first row or the start of a new table, open the table & display the headings *}
            {if $count == 1 || $count != 1 && (($count-1) % $settings.num_forms_per_page == 0)}

                {if $table_group_id == "1"}
                    {assign var="style" value="display: block"}
                {else}
                    {assign var="style" value="display: none"}
                {/if}
                <div id="page_{$table_group_id}" style="{$style}">

                <table class="list_table" width="100%" cellpadding="0" cellspacing="1">
                <tr>
                    {assign var="up_down" value=""}
                    {if     $order == "form_id-DESC"}
                        {assign var=sort_order value="order=form_id-ASC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_down.gif\" />"}
                    {elseif $order == "form_id-ASC"}
                        {assign var=sort_order value="order=form_id-DESC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_up.gif\" />"}
                    {else}
                        {assign var=sort_order value="order=form_id-DESC"}
                    {/if}
                    <th width="30" class="sortable_col{if $up_down} over{/if}">
                        <a href="{$same_page}?{$sort_order}">{$LANG.word_id|upper} {$up_down}</a>
                    </th>

                    {assign var="up_down" value=""}
                    {if     $order == "form_name-DESC"}
                        {assign var=sort_order value="order=form_name-ASC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_down.gif\" />"}
                    {elseif $order == "form_name-ASC"}
                        {assign var=sort_order value="order=form_name-DESC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_up.gif\" />"}
                    {else}
                        {assign var=sort_order value="order=form_name-DESC"}
                    {/if}
                    <th class="sortable_col{if $up_down} over{/if}">
                        <a href="{$same_page}?{$sort_order}">{$LANG.word_form} {$up_down}</a>
                    </th>

                    {assign var="up_down" value=""}
                    {if     $order == "form_type-DESC"}
                        {assign var=sort_order value="order=form_type-ASC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_down.gif\" />"}
                    {elseif $order == "form_type-ASC"}
                        {assign var=sort_order value="order=form_type-DESC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_up.gif\" />"}
                    {else}
                        {assign var=sort_order value="order=form_type-DESC"}
                    {/if}
                    <th nowrap class="sortable_col{if $up_down} over{/if}">
                        <a href="{$same_page}?{$sort_order}">{$LANG.phrase_form_type} {$up_down}</a>
                    </th>
                    <th>{$LANG.phrase_who_can_access}</th>

                    {assign var="up_down" value=""}
                    {if     $order == "status-DESC"}
                        {assign var=sort_order value="order=status-ASC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_down.gif\" />"}
                    {elseif $order == "status-ASC"}
                        {assign var=sort_order value="order=status-DESC"}
                        {assign var=up_down value="<img src=\"`$theme_url`/images/sort_up.gif\" />"}
                    {else}
                        {assign var=sort_order value="order=status-DESC"}
                    {/if}
                    <th width="90" class="sortable_col{if $up_down} over{/if}">
                        <a href="{$same_page}?{$sort_order}">{$LANG.word_status} {$up_down}</a>
                    </th>
                    <th width="90">{$LANG.word_submissions}</th>
                    <th class="edit"></th>
                    <th class="del"></th>
                </tr>
            {/if}
            <tr>
                <td align="center" class="medium_grey">{$form_id}</td>
                <td class="pad_left_small">
                    {if $form_info.form_type == "external"}
                        {$form_info.form_name}
                        <a href="{$form_info.form_url}" class="show_form" target="_blank"
                           title="{$LANG.phrase_open_form_in_dialog}"></a>
                    {else}
                        {$form_info.form_name}
                    {/if}
                </td>
                <td align="center">
                    {if $form_info.form_type == "external"}
                        <span class="brown">{$LANG.word_external}</span>
                    {elseif $form_info.form_type == "internal"}
                        <span class="orange">{$LANG.word_internal}</span>
                    {/if}
                    {template_hook location="admin_forms_form_type_label"}
                </td>
                <td>

                    {* display the list of client associated with this form. If it's a public form, keep it simple
                       and just display "All clients. *}
                    {if $form_info.is_complete == 'no'}

                    {elseif $form_info.access_type == 'admin'}
                        <span class="medium_grey pad_left_small">{$LANG.phrase_admin_only}</span>
                    {elseif $form_info.access_type == 'public'}

                        {if $form_info.client_omit_list|@count == 0}
                            <span class="pad_left_small blue">{$LANG.phrase_all_clients}</span>
                        {else}
                            {clients_dropdown only_show_clients=$form_info.client_omit_list display_single_client_as_text=true
                            include_blank_option=true blank_option="All clients, except:" force_show_blank_option=true}
                        {/if}

                    {else}

                        {if $clients|@count == 0}
                            <span class="pad_left_small light_grey">{$LANG.phrase_no_clients}</span>
                        {elseif $clients|@count == 1}
                            <span class="pad_left_small">{$clients[0].first_name} {$clients[0].last_name}</span>
                        {else}
                            <select class="clients_dropdown">
                                {foreach from=$clients item=client name=row2}
                                    <option>{$client.first_name} {$client.last_name}</option>
                                {/foreach}
                            </select>
                        {/if}
                    {/if}

                </td>
                <td align="center">
                    {if $form_info.is_active == "no"}
                        {assign var='status' value="<span style=\"color: orange\">`$LANG.word_offline`</span>"}
                    {else}
                        {assign var='status' value="<span class=\"light_green\">`$LANG.word_online`</span>"}
                    {/if}

                    {if $form_info.is_complete == "no"}
                        {assign var='status' value="<span style=\"color: red\">`$LANG.word_incomplete`</span>"}
                        {assign var='file' value='add/step2.php'}
                    {else}
                        {assign var='file' value='edit/'}
                    {/if}

                    {$status}

                </td>
                <td {if $form_info.is_complete == "no"}align="center"{/if}>
                    {if $form_info.is_complete == "yes"}
                        <div class="form_info_link">
                            <a href="submissions.php?form_id={$form_id}">
                                {$LANG.word_view|upper}
                                <span class="num_submissions_box">{display_num_form_submissions form_id=$form_id}</span>
                            </a>
                        </div>
                    {/if}

                    {if $form_info.is_complete != "yes"}
                        <a href="{$file}?form_id={$form_id}">{$LANG.word_complete|upper}</a>
                    {/if}
                </td>
                <td {if $form_info.is_complete == "yes"}class="edit"{/if}>
                    {if $form_info.is_complete == "yes"}
                        <a href="{$file}?form_id={$form_id}"></a>
                    {/if}
                </td>
                <td class="del"><a href="delete_form.php?form_id={$form_id}"></a></td>
            </tr>
            {if $count != 1 && ($count % $settings.num_forms_per_page) == 0}
                </table></div>
                {assign var='table_group_id' value=$table_group_id+1}
            {/if}

        {/foreach}

        {* if the table wasn't closed, close it! *}
        {if ($forms|@count % $settings.num_forms_per_page) != 0}
            </table></div>
        {/if}

    {/if}

    </form>

{/if}

<style>
/* BASICS */

.CodeMirror {
  /* Set height, width, borders, and global font properties here */
  font-family: monospace;
  height: 300px;
  color: black;
  direction: ltr;
}

/* PADDING */

.CodeMirror-lines {
  padding: 4px 0; /* Vertical padding around content */
}
.CodeMirror pre.CodeMirror-line,
.CodeMirror pre.CodeMirror-line-like {
  padding: 0 4px; /* Horizontal padding of content */
}

.CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler {
  background-color: white; /* The little square between H and V scrollbars */
}

/* GUTTER */

.CodeMirror-gutters {
  border-right: 1px solid #ddd;
  background-color: #f7f7f7;
  white-space: nowrap;
}
.CodeMirror-linenumbers {}
.CodeMirror-linenumber {
  padding: 0 3px 0 5px;
  min-width: 20px;
  text-align: right;
  color: #999;
  white-space: nowrap;
}

.CodeMirror-guttermarker { color: black; }
.CodeMirror-guttermarker-subtle { color: #999; }

/* CURSOR */

.CodeMirror-cursor {
  border-left: 1px solid black;
  border-right: none;
  width: 0;
}
/* Shown when moving in bi-directional text */
.CodeMirror div.CodeMirror-secondarycursor {
  border-left: 1px solid silver;
}
.cm-fat-cursor .CodeMirror-cursor {
  width: auto;
  border: 0 !important;
  background: #7e7;
}
.cm-fat-cursor div.CodeMirror-cursors {
  z-index: 1;
}
.cm-fat-cursor-mark {
  background-color: rgba(20, 255, 20, 0.5);
  -webkit-animation: blink 1.06s steps(1) infinite;
  -moz-animation: blink 1.06s steps(1) infinite;
  animation: blink 1.06s steps(1) infinite;
}
.cm-animate-fat-cursor {
  width: auto;
  border: 0;
  -webkit-animation: blink 1.06s steps(1) infinite;
  -moz-animation: blink 1.06s steps(1) infinite;
  animation: blink 1.06s steps(1) infinite;
  background-color: #7e7;
}
@-moz-keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}
@-webkit-keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}
@keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}

/* Can style cursor different in overwrite (non-insert) mode */
.CodeMirror-overwrite .CodeMirror-cursor {}

.cm-tab { display: inline-block; text-decoration: inherit; }

.CodeMirror-rulers {
  position: absolute;
  left: 0; right: 0; top: -50px; bottom: 0;
  overflow: hidden;
}
.CodeMirror-ruler {
  border-left: 1px solid #ccc;
  top: 0; bottom: 0;
  position: absolute;
}

/* DEFAULT THEME */

.cm-s-default .cm-header {color: blue;}
.cm-s-default .cm-quote {color: #090;}
.cm-negative {color: #d44;}
.cm-positive {color: #292;}
.cm-header, .cm-strong {font-weight: bold;}
.cm-em {font-style: italic;}
.cm-link {text-decoration: underline;}
.cm-strikethrough {text-decoration: line-through;}

.cm-s-default .cm-keyword {color: #708;}
.cm-s-default .cm-atom {color: #219;}
.cm-s-default .cm-number {color: #164;}
.cm-s-default .cm-def {color: #00f;}
.cm-s-default .cm-variable,
.cm-s-default .cm-punctuation,
.cm-s-default .cm-property,
.cm-s-default .cm-operator {}
.cm-s-default .cm-variable-2 {color: #05a;}
.cm-s-default .cm-variable-3, .cm-s-default .cm-type {color: #085;}
.cm-s-default .cm-comment {color: #a50;}
.cm-s-default .cm-string {color: #a11;}
.cm-s-default .cm-string-2 {color: #f50;}
.cm-s-default .cm-meta {color: #555;}
.cm-s-default .cm-qualifier {color: #555;}
.cm-s-default .cm-builtin {color: #30a;}
.cm-s-default .cm-bracket {color: #997;}
.cm-s-default .cm-tag {color: #170;}
.cm-s-default .cm-attribute {color: #00c;}
.cm-s-default .cm-hr {color: #999;}
.cm-s-default .cm-link {color: #00c;}

.cm-s-default .cm-error {color: #f00;}
.cm-invalidchar {color: #f00;}

.CodeMirror-composing { border-bottom: 2px solid; }

/* Default styles for common addons */

div.CodeMirror span.CodeMirror-matchingbracket {color: #0b0;}
div.CodeMirror span.CodeMirror-nonmatchingbracket {color: #a22;}
.CodeMirror-matchingtag { background: rgba(255, 150, 0, .3); }
.CodeMirror-activeline-background {background: #e8f2ff;}

/* STOP */

/* The rest of this file contains styles related to the mechanics of
   the editor. You probably shouldn't touch them. */

.CodeMirror {
  position: relative;
  overflow: hidden;
  background: white;
}

.CodeMirror-scroll {
  overflow: scroll !important; /* Things will break if this is overridden */
  /* 30px is the magic margin used to hide the element's real scrollbars */
  /* See overflow: hidden in .CodeMirror */
  margin-bottom: -30px; margin-right: -30px;
  padding-bottom: 30px;
  height: 100%;
  outline: none; /* Prevent dragging from highlighting the element */
  position: relative;
}
.CodeMirror-sizer {
  position: relative;
  border-right: 30px solid transparent;
}

/* The fake, visible scrollbars. Used to force redraw during scrolling
   before actual scrolling happens, thus preventing shaking and
   flickering artifacts. */
.CodeMirror-vscrollbar, .CodeMirror-hscrollbar, .CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler {
  position: absolute;
  z-index: 6;
  display: none;
}
.CodeMirror-vscrollbar {
  right: 0; top: 0;
  overflow-x: hidden;
  overflow-y: scroll;
}
.CodeMirror-hscrollbar {
  bottom: 0; left: 0;
  overflow-y: hidden;
  overflow-x: scroll;
}
.CodeMirror-scrollbar-filler {
  right: 0; bottom: 0;
}
.CodeMirror-gutter-filler {
  left: 0; bottom: 0;
}

.CodeMirror-gutters {
  position: absolute; left: 0; top: 0;
  min-height: 100%;
  z-index: 3;
}
.CodeMirror-gutter {
  white-space: normal;
  height: 100%;
  display: inline-block;
  vertical-align: top;
  margin-bottom: -30px;
}
.CodeMirror-gutter-wrapper {
  position: absolute;
  z-index: 4;
  background: none !important;
  border: none !important;
}
.CodeMirror-gutter-background {
  position: absolute;
  top: 0; bottom: 0;
  z-index: 4;
}
.CodeMirror-gutter-elt {
  position: absolute;
  cursor: default;
  z-index: 4;
}
.CodeMirror-gutter-wrapper ::selection { background-color: transparent }
.CodeMirror-gutter-wrapper ::-moz-selection { background-color: transparent }

.CodeMirror-lines {
  cursor: text;
  min-height: 1px; /* prevents collapsing before first draw */
}
.CodeMirror pre.CodeMirror-line,
.CodeMirror pre.CodeMirror-line-like {
  /* Reset some styles that the rest of the page might have set */
  -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0;
  border-width: 0;
  background: transparent;
  font-family: inherit;
  font-size: inherit;
  margin: 0;
  white-space: pre;
  word-wrap: normal;
  line-height: inherit;
  color: inherit;
  z-index: 2;
  position: relative;
  overflow: visible;
  -webkit-tap-highlight-color: transparent;
  -webkit-font-variant-ligatures: contextual;
  font-variant-ligatures: contextual;
}
.CodeMirror-wrap pre.CodeMirror-line,
.CodeMirror-wrap pre.CodeMirror-line-like {
  word-wrap: break-word;
  white-space: pre-wrap;
  word-break: normal;
}

.CodeMirror-linebackground {
  position: absolute;
  left: 0; right: 0; top: 0; bottom: 0;
  z-index: 0;
}

.CodeMirror-linewidget {
  position: relative;
  z-index: 2;
  padding: 0.1px; /* Force widget margins to stay inside of the container */
}

.CodeMirror-widget {}

.CodeMirror-rtl pre { direction: rtl; }

.CodeMirror-code {
  outline: none;
}

/* Force content-box sizing for the elements where we expect it */
.CodeMirror-scroll,
.CodeMirror-sizer,
.CodeMirror-gutter,
.CodeMirror-gutters,
.CodeMirror-linenumber {
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}

.CodeMirror-measure {
  position: absolute;
  width: 100%;
  height: 0;
  overflow: hidden;
  visibility: hidden;
}

.CodeMirror-cursor {
  position: absolute;
  pointer-events: none;
}
.CodeMirror-measure pre { position: static; }

div.CodeMirror-cursors {
  visibility: hidden;
  position: relative;
  z-index: 3;
}
div.CodeMirror-dragcursors {
  visibility: visible;
}

.CodeMirror-focused div.CodeMirror-cursors {
  visibility: visible;
}

.CodeMirror-selected { background: #d9d9d9; }
.CodeMirror-focused .CodeMirror-selected { background: #d7d4f0; }
.CodeMirror-crosshair { cursor: crosshair; }
.CodeMirror-line::selection, .CodeMirror-line > span::selection, .CodeMirror-line > span > span::selection { background: #d7d4f0; }
.CodeMirror-line::-moz-selection, .CodeMirror-line > span::-moz-selection, .CodeMirror-line > span > span::-moz-selection { background: #d7d4f0; }

.cm-searching {
  background-color: #ffa;
  background-color: rgba(255, 255, 0, .4);
}

/* Used to force a border model for a node */
.cm-force-border { padding-right: .1px; }

@media print {
  /* Hide the cursor when printing */
  .CodeMirror div.CodeMirror-cursors {
    visibility: hidden;
  }
}

/* See issue #2901 */
.cm-tab-wrap-hack:after { content: ''; }

/* Help users use markselection to safely style text background */
span.CodeMirror-selectedtext { background: none; }



@media print {
  .MuiDialog-root {
    position: absolute !important;
  }
}
.MuiDialog-scrollPaper {
  display: flex;
  align-items: center;
  justify-content: center;
}
.MuiDialog-scrollBody {
  overflow-x: hidden;
  overflow-y: auto;
  text-align: center;
}
.MuiDialog-scrollBody:after {
  width: 0;
  height: 100%;
  content: "";
  display: inline-block;
  vertical-align: middle;
}
.MuiDialog-container {
  height: 100%;
  outline: 0;
}
@media print {
  .MuiDialog-container {
    height: auto;
  }
}
.MuiDialog-paper {
  margin: 48px;
  position: relative;
  overflow-y: auto;
}
@media print {
  .MuiDialog-paper {
    box-shadow: none;
    overflow-y: visible;
  }
}
.MuiDialog-paperScrollPaper {
  display: flex;
  max-height: calc(100% - 96px);
  flex-direction: column;
}
.MuiDialog-paperScrollBody {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
.MuiDialog-paperWidthFalse {
  max-width: calc(100% - 96px);
}
.MuiDialog-paperWidthXs {
  max-width: 444px;
}
@media (max-width:539.95px) {
  .MuiDialog-paperWidthXs.MuiDialog-paperScrollBody {
    max-width: calc(100% - 96px);
  }
}
.MuiDialog-paperWidthSm {
  max-width: 600px;
}
@media (max-width:695.95px) {
  .MuiDialog-paperWidthSm.MuiDialog-paperScrollBody {
    max-width: calc(100% - 96px);
  }
}
.MuiDialog-paperWidthMd {
  max-width: 960px;
}
@media (max-width:1055.95px) {
  .MuiDialog-paperWidthMd.MuiDialog-paperScrollBody {
    max-width: calc(100% - 96px);
  }
}
.MuiDialog-paperWidthLg {
  max-width: 1280px;
}
@media (max-width:1375.95px) {
  .MuiDialog-paperWidthLg.MuiDialog-paperScrollBody {
    max-width: calc(100% - 96px);
  }
}
.MuiDialog-paperWidthXl {
  max-width: 1920px;
}
@media (max-width:2015.95px) {
  .MuiDialog-paperWidthXl.MuiDialog-paperScrollBody {
    max-width: calc(100% - 96px);
  }
}
.MuiDialog-paperFullWidth {
  width: calc(100% - 96px);
}
.MuiDialog-paperFullScreen {
  width: 100%;
  height: 100%;
  margin: 0;
  max-width: 100%;
  max-height: none;
  border-radius: 0;
}
.MuiDialog-paperFullScreen.MuiDialog-paperScrollBody {
  margin: 0;
  max-width: 100%;
}

.MuiTouchRipple-root {
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  overflow: hidden;
  position: absolute;
  border-radius: inherit;
  pointer-events: none;
}
.MuiTouchRipple-ripple {
  opacity: 0;
  position: absolute;
}
.MuiTouchRipple-rippleVisible {
  opacity: 0.3;
  animation: MuiTouchRipple-keyframes-mui-ripple-enter 550ms cubic-bezier(0.4, 0, 0.2, 1);
  transform: scale(1);
}
.MuiTouchRipple-ripplePulsate {
  animation-duration: 200ms;
}
.MuiTouchRipple-child {
  width: 100%;
  height: 100%;
  display: block;
  opacity: 1;
  border-radius: 50%;
  background-color: currentColor;
}
.MuiTouchRipple-childLeaving {
  opacity: 0;
  animation: MuiTouchRipple-keyframes-mui-ripple-exit 550ms cubic-bezier(0.4, 0, 0.2, 1);
}
.MuiTouchRipple-childPulsate {
  top: 0;
  left: 0;
  position: absolute;
  animation: MuiTouchRipple-keyframes-mui-ripple-pulsate 2500ms cubic-bezier(0.4, 0, 0.2, 1) 200ms infinite;
}
@-moz-keyframes MuiTouchRipple-keyframes-mui-ripple-enter {
  0% {
    opacity: 0.1;
    transform: scale(0);
  }
  100% {
    opacity: 0.3;
    transform: scale(1);
  }
}
@-moz-keyframes MuiTouchRipple-keyframes-mui-ripple-exit {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
@-moz-keyframes MuiTouchRipple-keyframes-mui-ripple-pulsate {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(0.92);
  }
  100% {
    transform: scale(1);
  }
}

.MuiButtonBase-root {
  color: inherit;
  border: 0;
  cursor: pointer;
  margin: 0;
  display: inline-flex;
  outline: 0;
  padding: 0;
  position: relative;
  align-items: center;
  user-select: none;
  border-radius: 0;
  vertical-align: middle;
  -moz-appearance: none;
  justify-content: center;
  text-decoration: none;
  background-color: transparent;
  -webkit-appearance: none;
  -webkit-tap-highlight-color: transparent;
}
.MuiButtonBase-root::-moz-focus-inner {
  border-style: none;
}
.MuiButtonBase-root.Mui-disabled {
  cursor: default;
  pointer-events: none;
}

.MuiButton-root {
  color: rgba(0, 0, 0, 0.87);
  padding: 6px 16px;
  font-size: 0.875rem;
  min-width: 64px;
  box-sizing: border-box;
  transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,border 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
  font-family: "Roboto", "Helvetica", "Arial", sans-serif;
  font-weight: 500;
  line-height: 1.75;
  border-radius: 4px;
  letter-spacing: 0.02857em;
  text-transform: uppercase;
}
.MuiButton-root:hover {
  text-decoration: none;
  background-color: rgba(0, 0, 0, 0.08);
}
.MuiButton-root.Mui-disabled {
  color: rgba(0, 0, 0, 0.26);
}
@media (hover: none) {
  .MuiButton-root:hover {
    background-color: transparent;
  }
}
.MuiButton-root:hover.Mui-disabled {
  background-color: transparent;
}
.MuiButton-label {
  width: 100%;
  display: inherit;
  align-items: inherit;
  justify-content: inherit;
}
.MuiButton-text {
  padding: 6px 8px;
}
.MuiButton-textPrimary {
  color: #3f51b5;
}
.MuiButton-textPrimary:hover {
  background-color: rgba(63, 81, 181, 0.08);
}
@media (hover: none) {
  .MuiButton-textPrimary:hover {
    background-color: transparent;
  }
}
.MuiButton-textSecondary {
  color: #f50057;
}
.MuiButton-textSecondary:hover {
  background-color: rgba(245, 0, 87, 0.08);
}
@media (hover: none) {
  .MuiButton-textSecondary:hover {
    background-color: transparent;
  }
}
.MuiButton-outlined {
  border: 1px solid rgba(0, 0, 0, 0.23);
  padding: 5px 16px;
}
.MuiButton-outlined.Mui-disabled {
  border: 1px solid rgba(0, 0, 0, 0.26);
}
.MuiButton-outlinedPrimary {
  color: #3f51b5;
  border: 1px solid rgba(63, 81, 181, 0.5);
}
.MuiButton-outlinedPrimary:hover {
  border: 1px solid #3f51b5;
  background-color: rgba(63, 81, 181, 0.08);
}
@media (hover: none) {
  .MuiButton-outlinedPrimary:hover {
    background-color: transparent;
  }
}
.MuiButton-outlinedSecondary {
  color: #f50057;
  border: 1px solid rgba(245, 0, 87, 0.5);
}
.MuiButton-outlinedSecondary:hover {
  border: 1px solid #f50057;
  background-color: rgba(245, 0, 87, 0.08);
}
.MuiButton-outlinedSecondary.Mui-disabled {
  border: 1px solid rgba(0, 0, 0, 0.26);
}
@media (hover: none) {
  .MuiButton-outlinedSecondary:hover {
    background-color: transparent;
  }
}
.MuiButton-contained {
  color: rgba(0, 0, 0, 0.87);
  box-shadow: 0px 1px 5px 0px rgba(0,0,0,0.2),0px 2px 2px 0px rgba(0,0,0,0.14),0px 3px 1px -2px rgba(0,0,0,0.12);
  background-color: #e0e0e0;
}
.MuiButton-contained.Mui-focusVisible {
  box-shadow: 0px 3px 5px -1px rgba(0,0,0,0.2),0px 6px 10px 0px rgba(0,0,0,0.14),0px 1px 18px 0px rgba(0,0,0,0.12);
}
.MuiButton-contained:active {
  box-shadow: 0px 5px 5px -3px rgba(0,0,0,0.2),0px 8px 10px 1px rgba(0,0,0,0.14),0px 3px 14px 2px rgba(0,0,0,0.12);
}
.MuiButton-contained.Mui-disabled {
  color: rgba(0, 0, 0, 0.26);
  box-shadow: none;
  background-color: rgba(0, 0, 0, 0.12);
}
.MuiButton-contained:hover {
  background-color: #d5d5d5;
}
@media (hover: none) {
  .MuiButton-contained:hover {
    background-color: #e0e0e0;
  }
}
.MuiButton-contained:hover.Mui-disabled {
  background-color: rgba(0, 0, 0, 0.12);
}
.MuiButton-containedPrimary {
  color: #fff;
  background-color: #3f51b5;
}
.MuiButton-containedPrimary:hover {
  background-color: #303f9f;
}
@media (hover: none) {
  .MuiButton-containedPrimary:hover {
    background-color: #3f51b5;
  }
}
.MuiButton-containedSecondary {
  color: #fff;
  background-color: #f50057;
}
.MuiButton-containedSecondary:hover {
  background-color: #c51162;
}
@media (hover: none) {
  .MuiButton-containedSecondary:hover {
    background-color: #f50057;
  }
}
.MuiButton-colorInherit {
  color: inherit;
  border-color: currentColor;
}
.MuiButton-sizeSmall {
  padding: 4px 8px;
  font-size: 0.8125rem;
}
.MuiButton-sizeLarge {
  padding: 8px 24px;
  font-size: 0.9375rem;
}
.MuiButton-fullWidth {
  width: 100%;
}

.jss1 {
  margin: 8px 4px 8px 0;
  padding: 4px 12px;
  background: linear-gradient(80deg, #5FB66F 30%, #54a863 90%);
  box-shadow: none;
  letter-spacing: normal;
  text-transform: none;
}
.jss1:hover {
  background: linear-gradient(80deg, #54a863 30%, #459353 90%);
}
.jss2 {
  margin: 8px 4px 8px 0;
  padding: 4px 12px;
  background: linear-gradient(80deg, #ce0e0e 30%, #b70707 90%);
  box-shadow: none;
  letter-spacing: normal;
  text-transform: none;
}
.jss2:hover {
  background: linear-gradient(80deg, #b70707 30%, #ad0606 90%);
}
.jss3 {
  margin: 8px 4px 8px 0;
  padding: 4px 12px;
  background: linear-gradient(80deg, #d5eaef 30%, #ccdee2 90%);
  box-shadow: none;
  letter-spacing: normal;
  text-transform: none;
}
.jss3:hover {
  background: linear-gradient(80deg, #ccdee2 30%, #c3d4d8 90%);
}
.jss4 {
  color: white;
}
.jss5 {
  color: #3d4344;
}

.jss41 {
  color: #ffffff;
  opacity: 0.5;
}
</style>

{if !$max_forms_reached}
    <form method="post" action="add/">
        <p>
            <input type="submit" name="new_form" value="{$LANG.phrase_add_form}"/>
            <button class="MuiButtonBase-root MuiButton-root jss1 MuiButton-contained" tabindex="0" type="submit" name="new_form">
                <span class="MuiButton-label jss4">{$LANG.phrase_add_form} »</span>
                <span class="MuiTouchRipple-root"></span>
            </button>
        </p>
    </form>
{/if}

{template_hook location="admin_forms_list_bottom"}

{ft_include file="footer.tpl"}
