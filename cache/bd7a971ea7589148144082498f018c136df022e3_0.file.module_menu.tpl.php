<?php
/* Smarty version 3.1.31, created on 2022-06-09 11:00:07
  from "C:\wamp64\www\formtools\themes\default\module_menu.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_62a1d2b728be55_97748504',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bd7a971ea7589148144082498f018c136df022e3' => 
    array (
      0 => 'C:\\wamp64\\www\\formtools\\themes\\default\\module_menu.tpl',
      1 => 1571535471,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62a1d2b728be55_97748504 (Smarty_Internal_Template $_smarty_tpl) {
?>


  <div class="menu_items">
  <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['module_nav']->value, 'i', false, 'k');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k']->value => $_smarty_tpl->tpl_vars['i']->value) {
?>
    <?php if ($_smarty_tpl->tpl_vars['i']->value['is_submenu'] == "no") {?>
      <div class="nav_link"><a href="<?php echo $_smarty_tpl->tpl_vars['i']->value['url'];?>
"<?php echo (($tmp = @$_smarty_tpl->tpl_vars['link_id']->value)===null||$tmp==='' ? '' : $tmp);?>
><?php echo $_smarty_tpl->tpl_vars['i']->value['display_text'];?>
</a></div>
    <?php } else { ?>
      <div class="nav_link_submenu"><a href="<?php echo $_smarty_tpl->tpl_vars['i']->value['url'];?>
">&#8212; <?php echo $_smarty_tpl->tpl_vars['i']->value['display_text'];?>
</a></div>
    <?php }?>
  <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);
?>

  </div>
<?php }
}
