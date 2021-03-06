<?php
/* Smarty version 3.1.31, created on 2022-06-09 10:52:53
  from "C:\wamp64\www\formtools\themes\default\js_pagination.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_62a1d105b33667_16693839',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '856f00dd3223abe2a9f819553e4ef6288cbbe246' => 
    array (
      0 => 'C:\\wamp64\\www\\formtools\\themes\\default\\js_pagination.tpl',
      1 => 1571535471,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62a1d105b33667_16693839 (Smarty_Internal_Template $_smarty_tpl) {
?>


<div class="margin_bottom_large">
  <?php echo $_smarty_tpl->tpl_vars['LANG']->value['phrase_total_results_c'];?>
 <b><?php echo $_smarty_tpl->tpl_vars['num_results']->value;?>
</b>&nbsp;

  
  <?php echo $_smarty_tpl->tpl_vars['viewing_range']->value;?>


  <?php if ($_smarty_tpl->tpl_vars['total_pages']->value > 1) {?>
    <div id="list_nav"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_page_c'];?>


    
    <span id="nav_previous_page">
      <?php if ($_smarty_tpl->tpl_vars['current_page']->value != 1) {?>
        <?php $_smarty_tpl->_assignInScope('previous_page', $_smarty_tpl->tpl_vars['current_page']->value-1);
?>
        <a href="javascript:ft.display_dhtml_page_nav(<?php echo $_smarty_tpl->tpl_vars['num_results']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['num_per_page']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['previous_page']->value;?>
)">&laquo;</a>
      <?php } else { ?>
        &laquo;
      <?php }?>
    </span>

    <?php
$__section_counter_0_saved = isset($_smarty_tpl->tpl_vars['__smarty_section_counter']) ? $_smarty_tpl->tpl_vars['__smarty_section_counter'] : false;
$__section_counter_0_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['total_pages']->value+1) ? count($_loop) : max(0, (int) $_loop));
$__section_counter_0_start = min(1, $__section_counter_0_loop);
$__section_counter_0_total = min(($__section_counter_0_loop - $__section_counter_0_start), $__section_counter_0_loop);
$_smarty_tpl->tpl_vars['__smarty_section_counter'] = new Smarty_Variable(array());
if ($__section_counter_0_total != 0) {
for ($__section_counter_0_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_counter']->value['index'] = $__section_counter_0_start; $__section_counter_0_iteration <= $__section_counter_0_total; $__section_counter_0_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_counter']->value['index']++){
?>
      <?php $_smarty_tpl->_assignInScope('page', (isset($_smarty_tpl->tpl_vars['__smarty_section_counter']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_counter']->value['index'] : null));
?>

      <span id="nav_page_<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
">
        <?php if ($_smarty_tpl->tpl_vars['page']->value == $_smarty_tpl->tpl_vars['current_page']->value) {?>
          <span id="list_current_page"><b><?php echo $_smarty_tpl->tpl_vars['page']->value;?>
</b></span>
        <?php } else { ?>
          <span class="pad_right_small"><a href="javascript:ft.display_dhtml_page_nav(<?php echo $_smarty_tpl->tpl_vars['num_results']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['num_per_page']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['page']->value;?>
)"><?php echo $_smarty_tpl->tpl_vars['page']->value;?>
</a></span>
        <?php }?>
      </span>
    <?php
}
}
if ($__section_counter_0_saved) {
$_smarty_tpl->tpl_vars['__smarty_section_counter'] = $__section_counter_0_saved;
}
?>

    
    <span id="nav_next_page">

      <?php if ($_smarty_tpl->tpl_vars['current_page']->value != $_smarty_tpl->tpl_vars['total_pages']->value) {?>
        <?php $_smarty_tpl->_assignInScope('next_page', $_smarty_tpl->tpl_vars['current_page']->value+1);
?>
        <a href="javascript:ft.display_dhtml_page_nav(<?php echo $_smarty_tpl->tpl_vars['num_results']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['num_per_page']->value;?>
, <?php echo $_smarty_tpl->tpl_vars['next_page']->value;?>
)">&raquo;</a>
      <?php } else { ?>
        <span id="nav_next_page">&raquo;</span>
      <?php }?>

    </span>

    </div>

  <?php }?>

</div>
<?php }
}
