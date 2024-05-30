declare
  l_workspace varchar2(30 char) := 'workspace';
  l_app_id    number            := app_id;
  l_session_id number           := 0;
begin
    apex_util.set_workspace (
      p_workspace => l_workspace );

    apex_session.attach (
      p_app_id  => l_app_id,
      p_page_id => 1,
      p_session_id => l_session_id);

  /* -- Full debug -- */
    apex_debug.enable(p_level=>apex_debug.c_log_level_engine_trace);

  /* -- Classic --
    apex_debug.enable(p_level=>apex_debug.c_log_level_info);
  */

    apex_debug.enable_dbms_output(p_prefix=>'APEX Debug-');

end;
/


/* Add parameter to debugg script
  begin
    apex_util.set_session_state(p_name => 'P0_ID', p_value => 'TEST');
  end;
  /
*/


/* Debug messages
  select * from apex_debug_messages;
*/

/* Disable debug
  begin
    apex_debug.disable;
    apex_session.detach;
  end;
  /
*/