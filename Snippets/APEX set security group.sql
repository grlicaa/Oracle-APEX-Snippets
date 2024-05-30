begin
  for c1 in (
    select workspace_id
      from apex_applications
       where application_id = 100 )
  loop
    apex_util.set_security_group_id(p_security_group_id => c1.workspace_id);
  end loop;
end;
/