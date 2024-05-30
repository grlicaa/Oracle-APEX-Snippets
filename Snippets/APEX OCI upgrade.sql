select apex_instance_admin.get_parameter('UPGRADE_STATUS') as UPGRADE_STATUS from dual;

/*
UPGRADE_STATUS
--------------
AVAILABLE

If an upgrade is available, you can initiate it during the upgrade window by running:
*/
begin
  apex_instance_admin.set_parameter('UPGRADE_STATUS', 'RUN');
end;
/