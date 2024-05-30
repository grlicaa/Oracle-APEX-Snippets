declare
  l_workspace varchar2(30 char) := 'workspace';
  l_app_id    number            := 100;

  l_workspace_id   number;
begin
  l_workspace_id := apex_util.find_security_group_id (l_workspace);
  apex_application_install.set_workspace_id (l_workspace_id);
  apex_application_install.set_application_id(l_app_id);
  apex_application_install.set_schema(l_workspace);
end;
/

-- Run app install
-- e.g @f100.sql