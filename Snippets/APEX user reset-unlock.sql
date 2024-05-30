declare
  l_workspace varchar2(30 char) := 'workspace';
  l_username  varchar2(30 char) := 'username';
begin
  apex_util.set_workspace ( p_workspace => l_workspace );
  apex_util.reset_password (
        p_user_name     => l_username,
        p_old_password  => null,
        p_new_password  => 'password',
        p_change_password_on_first_use => false);
  apex_util.unlock_account ( p_user_name  => l_username);
end;
/