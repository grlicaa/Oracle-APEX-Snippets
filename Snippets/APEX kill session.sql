DEFINE df_p_app_workspace = 'workspace';


/* Query sessions */
  select * from apex_workspace_sessions where workspace_name = '&&df_p_app_workspace';

/* Kill all sessions on workspace
  declare
    l_workspace varchar2(30 char) := '&&df_p_app_workspace';
  begin
    apex_util.set_workspace (
      p_workspace => l_workspace );

    for i in (select * from apex_workspace_sessions where workspace_name = l_workspace)
    loop
      apex_session.delete_session (p_session_id => i.apex_session_id );
    end loop;
    commit;
  end;
  /
*/


/* Kill single session
  declare
    l_workspace varchar2(30 char) := '&&df_p_app_workspace';
      l_session   number := 0;
  begin
    apex_util.set_workspace (
          p_workspace => :l_workspace );

      apex_session.delete_session (p_session_id => l_session );
  commit;
  end;
  /
*/