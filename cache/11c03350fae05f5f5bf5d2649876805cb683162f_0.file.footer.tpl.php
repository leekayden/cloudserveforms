<?php
/* Smarty version 3.1.31, created on 2022-06-09 10:52:47
  from "C:\wamp64\www\formtools\themes\default\footer.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_62a1d0ff0e6f21_40203386',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '11c03350fae05f5f5bf5d2649876805cb683162f' => 
    array (
      0 => 'C:\\wamp64\\www\\formtools\\themes\\default\\footer.tpl',
      1 => 1571535471,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62a1d0ff0e6f21_40203386 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_function_show_page_load_time')) require_once 'C:\\wamp64\\www\\formtools\\global\\smarty_plugins\\function.show_page_load_time.php';
?>

      </div>
    </td>
  </tr>
  </table>

</div>


<?php if ($_smarty_tpl->tpl_vars['footer_text']->value != '' || $_smarty_tpl->tpl_vars['g_enable_benchmarking']->value) {?>
  <div class="footer">
    <?php echo $_smarty_tpl->tpl_vars['footer_text']->value;?>

    <?php echo smarty_function_show_page_load_time(array(),$_smarty_tpl);?>

  </div>
<?php }?>

</body>
</html>
<?php }
}
