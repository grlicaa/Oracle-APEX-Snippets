begin
  apex_instance_admin.set_parameter('SMTP_HOST_PORT', 587);
  apex_instance_admin.set_parameter('SMTP_HOST_ADDRESS', 'smtp.email.uk-london-1.oci.oraclecloud.com');


  apex_instance_admin.set_parameter('SMTP_USERNAME', '');
  apex_instance_admin.set_parameter('SMTP_PASSWORD', '');
  commit;
end;
/


begin
  apex_instance_admin.validate_email_config;
end;
/