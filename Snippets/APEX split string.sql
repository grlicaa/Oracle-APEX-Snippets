declare
  l_string          varchar2(4000) := 'P1_X:P1_Y';
  l_page_items_arr  apex_t_varchar2;
begin
  l_page_items_arr := apex_string.split(p_str => l_string, p_sep => ':');
  for i in 1..l_page_items_arr.count
  loop
    sys.dbms_output.put_line(l_page_items_arr(i)||':'||apex_util.get_session_state(l_page_items_arr(i)));
  end loop;
end;
/