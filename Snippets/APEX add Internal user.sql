SELECT * FROM apex_workspace_apex_users; -- check users


-- Add new user as sysdba
begin

  apex_util.set_workspace('INTERNAL');

  apex_util.create_user(
    p_user_name                     => 'ADMIN_DBA',
    p_email_address                 => 'admin@company.com',
    p_web_password                  => 'password',
    p_developer_privs               => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
    p_change_password_on_first_use  => 'N'
    );
   commit;
end;
/


-- Unlock locked user
begin

  apex_util.set_workspace('INTERNAL');
  apex_util.unlock_account(p_user_name => 'ADMIN_DBA');
  commit;
end;
/