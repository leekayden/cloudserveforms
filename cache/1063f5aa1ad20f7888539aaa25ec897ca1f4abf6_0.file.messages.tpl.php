<?php
/* Smarty version 3.1.31, created on 2022-06-09 10:52:47
  from "C:\wamp64\www\formtools\themes\default\messages.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_62a1d0ff065d65_81553421',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1063f5aa1ad20f7888539aaa25ec897ca1f4abf6' => 
    array (
      0 => 'C:\\wamp64\\www\\formtools\\themes\\default\\messages.tpl',
      1 => 1571535471,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62a1d0ff065d65_81553421 (Smarty_Internal_Template $_smarty_tpl) {
?>


<?php $_smarty_tpl->_assignInScope('class_name', '');
if ($_smarty_tpl->tpl_vars['g_success']->value) {?>
    <?php $_smarty_tpl->_assignInScope('class_name', "notify");
} else { ?>
    <?php $_smarty_tpl->_assignInScope('class_name', "error");
}?>

<?php if ($_smarty_tpl->tpl_vars['g_message']->value) {?>
    <?php if ($_smarty_tpl->tpl_vars['g_success']->value) {?>
        <?php echo '<script'; ?>
>$(function() { $("#ft_message_inner").effect("highlight", {color: "#" + g.notify_colours[1] }, 1200); });<?php echo '</script'; ?>
>
    <?php } else { ?>
        <?php echo '<script'; ?>
>$(function() { $("#ft_message_inner").effect("highlight", {color: "#" + g.error_colours[1] }, 1200); });<?php echo '</script'; ?>
>
    <?php }?>

    <div id="ft_message">
        <div style="height: 8px;"> </div>
        <div class="<?php echo $_smarty_tpl->tpl_vars['class_name']->value;?>
" id="ft_message_inner">
            <div style="padding:8px">
                <span style="float: right; padding-left: 5px;"><a href="#" onclick="return ft.hide_message('ft_message')">X</a></span>
                <?php echo $_smarty_tpl->tpl_vars['g_message']->value;?>

            </div>
        </div>
    </div>

<?php } else { ?>

    <div id="ft_message" style="width: 100%; display:none">
        <div style="height: 8px;"> </div>
        <div class="<?php echo $_smarty_tpl->tpl_vars['class_name']->value;?>
" id="ft_message_inner"></div>
    </div>

<?php }?>

<div style="height: 10px;"> </div>
<?php }
}
