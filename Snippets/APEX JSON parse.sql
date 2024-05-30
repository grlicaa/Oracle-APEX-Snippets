declare
  s varchar2(32767) := '{ "a": 1, "b": ["hello", "world"]}';
begin
  apex_json.parse(s);
  sys.dbms_output.put_line('a is '||apex_json.get_varchar2(p_path => 'a'));
end;
/