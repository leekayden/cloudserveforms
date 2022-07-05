<?php
/* Smarty version 3.1.31, created on 2022-06-09 11:00:19
  from "C:\wamp64\www\formtools\modules\export_manager\templates\export_groups\add.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_62a1d2c3042343_69374417',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8bb2518c5e2d37c0807358c7e151bf7656b14ca4' => 
    array (
      0 => 'C:\\wamp64\\www\\formtools\\modules\\export_manager\\templates\\export_groups\\add.tpl',
      1 => 1573328713,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62a1d2c3042343_69374417 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_ft_include')) require_once 'C:\\wamp64\\www\\formtools\\global\\smarty_plugins\\function.ft_include.php';
echo smarty_function_ft_include(array('file'=>'modules_header.tpl'),$_smarty_tpl);?>


<table cellpadding="0" cellspacing="0" class="margin_bottom_large">
    <tr>
        <td width="45"><a href="../"><img src="../images/icon_export.gif" border="0" width="34" height="34"/></a></td>
        <td class="title">
            <a href="../../../admin/modules"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_modules'];?>
</a>
            <span class="joiner">&raquo;</span>
            <a href="../"><?php echo $_smarty_tpl->tpl_vars['L']->value['module_name'];?>
</a>
            <span class="joiner">&raquo;</span>
            <?php echo $_smarty_tpl->tpl_vars['L']->value['phrase_add_export_group'];?>

        </td>
    </tr>
</table>

<div class="margin_bottom_large">
    <?php echo $_smarty_tpl->tpl_vars['L']->value['text_export_group_summary'];?>

</div>

<?php echo smarty_function_ft_include(array('file'=>'messages.tpl'),$_smarty_tpl);?>


<form action="../" method="post" onsubmit="return rsv.validate(this, rules)">

    <table border="0" width="500" class="add_export_group_table">
        <tr>
            <td width="130" class="medium_grey"><?php echo $_smarty_tpl->tpl_vars['L']->value['phrase_export_group_name'];?>
</td>
            <td>
                <input type="text" name="group_name" value="" style="width:200px" maxlength="50"/>
            </td>
        </tr>
        <tr>
            <td class="medium_grey"><?php echo $_smarty_tpl->tpl_vars['L']->value['word_visibility'];?>
</td>
            <td>
                <input type="radio" name="visibility" value="show" id="st1" checked/>
                <label for="st1" class="green"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_show'];?>
</label>
                <input type="radio" name="visibility" value="hide" id="st2"/>
                <label for="st2" class="red"><?php echo $_smarty_tpl->tpl_vars['L']->value['word_hide'];?>
</label>
            </td>
        </tr>
        <tr>
            <td valign="top" class="medium_grey"><?php echo $_smarty_tpl->tpl_vars['L']->value['word_icon'];?>
</td>
            <td>
                <input type="hidden" name="icon" id="icon" value=""/>
                <ul class="icon_list">
                    <li class="no_icon selected"></li>
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['icons']->value, 'icon', false, NULL, 'i', array (
  'iteration' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['icon']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_i']->value['iteration']++;
?>
                        <?php $_smarty_tpl->_assignInScope('index', (isset($_smarty_tpl->tpl_vars['__smarty_foreach_i']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_i']->value['iteration'] : null));
?>
                        <li><img src="<?php echo $_smarty_tpl->tpl_vars['g_root_url']->value;?>
/modules/export_manager/images/icons/<?php echo $_smarty_tpl->tpl_vars['icon']->value;?>
"/></li>
                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);
?>

                </ul>
            </td>
        </tr>
    </table>

    <p>
        <input type="submit" name="add_export_group" value="<?php echo $_smarty_tpl->tpl_vars['L']->value['phrase_add_export_group'];?>
"/>
    </p>

</form>

<?php echo smarty_function_ft_include(array('file'=>'modules_footer.tpl'),$_smarty_tpl);?>

<?php }
}
