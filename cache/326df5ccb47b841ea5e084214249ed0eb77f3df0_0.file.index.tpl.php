<?php
/* Smarty version 3.1.31, created on 2022-06-09 11:00:06
  from "C:\wamp64\www\formtools\modules\export_manager\templates\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_62a1d2b6f3d8a7_74047656',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '326df5ccb47b841ea5e084214249ed0eb77f3df0' => 
    array (
      0 => 'C:\\wamp64\\www\\formtools\\modules\\export_manager\\templates\\index.tpl',
      1 => 1573328713,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62a1d2b6f3d8a7_74047656 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_ft_include')) require_once 'C:\\wamp64\\www\\formtools\\global\\smarty_plugins\\function.ft_include.php';
echo smarty_function_ft_include(array('file'=>'modules_header.tpl'),$_smarty_tpl);?>


<table cellpadding="0" cellspacing="0">
    <tr>
        <td width="45"><a href="index.php"><img src="images/icon_export.gif" border="0" width="34" height="34"/></a>
        </td>
        <td class="title">
            <a href="../../admin/modules"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_modules'];?>
</a>
            <span class="joiner">&raquo;</span>
            <?php echo $_smarty_tpl->tpl_vars['L']->value['module_name'];?>

        </td>
    </tr>
</table>

<?php echo smarty_function_ft_include(array('file'=>'messages.tpl'),$_smarty_tpl);?>


<div class="margin_bottom_large">
    <?php echo $_smarty_tpl->tpl_vars['L']->value['text_export_manager_intro'];?>

</div>

<form action="<?php echo $_smarty_tpl->tpl_vars['same_page']->value;?>
" method="post">
    <?php if (count($_smarty_tpl->tpl_vars['export_groups']->value) == 0) {?>
        <div class="notify yellow_bg" class="margin_bottom_large">
            <div style="padding:8px">
                <?php echo $_smarty_tpl->tpl_vars['L']->value['notify_no_export_groups'];?>

            </div>
        </div>
    <?php } else { ?>
        <div class="sortable export_group_list" id="<?php echo $_smarty_tpl->tpl_vars['sortable_id']->value;?>
">
            <input type="hidden" class="sortable__custom_delete_handler" value="page_ns.delete_export_group"/>
            <ul class="header_row">
                <li class="col1"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_order'];?>
</li>
                <li class="col2"><?php echo $_smarty_tpl->tpl_vars['L']->value['phrase_export_group'];?>
</li>
                <li class="col3"><?php echo $_smarty_tpl->tpl_vars['L']->value['word_icon'];?>
</li>
                <li class="col4"><?php echo $_smarty_tpl->tpl_vars['L']->value['word_visibility'];?>
</li>
                <li class="col5"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['phrase_access_type'];?>
</li>
                <li class="col6"><?php echo $_smarty_tpl->tpl_vars['L']->value['phrase_num_export_types'];?>
</li>
                <li class="col7 edit"></li>
                <li class="col8 colN del"></li>
            </ul>
            <div class="clear"></div>
            <ul class="rows" id="rows">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['export_groups']->value, 'group', false, NULL, 'row', array (
  'index' => true,
  'iteration' => true,
  'last' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['group']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['index']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['iteration'] == $_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['total'];
?>
                    <?php $_smarty_tpl->_assignInScope('index', (isset($_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['index'] : null));
?>
                    <?php $_smarty_tpl->_assignInScope('count', (isset($_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['iteration'] : null));
?>
                    <?php $_smarty_tpl->_assignInScope('export_group_id', $_smarty_tpl->tpl_vars['group']->value['export_group_id']);
?>
                    <li class="sortable_row">
                        <div class="row_content">
                            <div class="row_group<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_row']->value['last'] : null)) {?> rowN<?php }?>">
                                <input type="hidden" class="sr_order" value="<?php echo $_smarty_tpl->tpl_vars['export_group_id']->value;?>
"/>
                                <ul>
                                    <li class="col1 sort_col"><?php echo $_smarty_tpl->tpl_vars['count']->value;?>
</li>
                                    <li class="col2"><?php $_template = new Smarty_Internal_Template('eval:'.$_smarty_tpl->tpl_vars['group']->value['group_name'], $_smarty_tpl->smarty, $_smarty_tpl);echo $_template->fetch(); ?></li>
                                    <li class="col3"><?php if ($_smarty_tpl->tpl_vars['group']->value['icon']) {?><img src="images/icons/<?php echo $_smarty_tpl->tpl_vars['group']->value['icon'];?>
" /><?php }?></li>
                                    <li class="col4">
                                        <?php if ($_smarty_tpl->tpl_vars['group']->value['visibility'] == "show") {?>
                                            <span class="green"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_show'];?>
</span>
                                        <?php } else { ?>
                                            <span class="red"><?php echo $_smarty_tpl->tpl_vars['L']->value['word_hide'];?>
</span>
                                        <?php }?>
                                    </li>
                                    <li class="col5">
                                        <?php if ($_smarty_tpl->tpl_vars['group']->value['access_type'] == 'admin') {?>
                                            <?php echo $_smarty_tpl->tpl_vars['LANG']->value['phrase_admin_only'];?>

                                        <?php } elseif ($_smarty_tpl->tpl_vars['group']->value['access_type'] == 'public') {?>
                                            <?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_public'];?>

                                        <?php } elseif ($_smarty_tpl->tpl_vars['group']->value['access_type'] == 'private') {?>
                                            <?php echo $_smarty_tpl->tpl_vars['LANG']->value['word_private'];?>

                                        <?php }?>
                                    </li>
                                    <li class="col6 check_area"><a
                                                href="export_groups/edit.php?page=export_types&export_group_id=<?php echo $_smarty_tpl->tpl_vars['export_group_id']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['group']->value['num_export_types'];?>
</a>
                                    </li>
                                    <li class="col7 edit"><a
                                                href="export_groups/edit.php?page=main&export_group_id=<?php echo $_smarty_tpl->tpl_vars['export_group_id']->value;?>
"></a>
                                    </li>
                                    <li class="col8 colN del"></li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </li>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);
?>

            </ul>
        </div>
    <?php }?>

    <p>
        <?php if (count($_smarty_tpl->tpl_vars['export_groups']->value) > 0) {?>
            <input type="submit" name="update" value="<?php echo $_smarty_tpl->tpl_vars['LANG']->value['phrase_update_order'];?>
"/>
        <?php }?>
        <input type="button" value="<?php echo $_smarty_tpl->tpl_vars['L']->value['phrase_add_export_group'];?>
" onclick="window.location='export_groups/add.php'"/>
    </p>

</form>

<?php echo smarty_function_ft_include(array('file'=>'modules_footer.tpl'),$_smarty_tpl);?>

<?php }
}
