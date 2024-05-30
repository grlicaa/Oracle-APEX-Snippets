variable name varchar2(255)
variable contents clob
declare
   l_files apex_t_export_files;
begin
   l_files := apex_export.get_application(p_application_id => 100);
   :name := l_files(1).name;
   :contents := l_files(1).contents;
end;
/
set feed off echo off head off flush off termout off trimspool on
set long 100000000 longchunksize 32767
col name new_val name
select :name name from sys.dual;
spool &name.
print contents
spool off

/*
FUNCTION GET_APPLICATION (
   p_application_id          IN NUMBER,
   p_split                   IN BOOLEAN             DEFAULT FALSE,
   p_with_date               IN BOOLEAN             DEFAULT FALSE,
   p_with_ir_public_reports  IN BOOLEAN             DEFAULT FALSE,
   p_with_ir_private_reports IN BOOLEAN             DEFAULT FALSE,
   p_with_ir_notifications   IN BOOLEAN             DEFAULT FALSE,
   p_with_translations       IN BOOLEAN             DEFAULT FALSE,
   p_with_pkg_app_mapping    IN BOOLEAN             DEFAULT FALSE,
   p_with_original_ids       IN BOOLEAN             DEFAULT FALSE,
   p_with_no_subscriptions   IN BOOLEAN             DEFAULT FALSE,
   p_with_comments           IN BOOLEAN             DEFAULT FALSE,
   p_with_supporting_objects IN VARCHAR2            DEFAULT NULL,
   p_with_acl_assignments    IN BOOLEAN             DEFAULT FALSE,
   p_components              IN apex_t_varchar2     DEFAULT NULL )
   RETURN apex_t_export_files;
/