-- Run in APEX SQL Workshop or app
begin
  FOR i IN 1..owa.num_cgi_vars LOOP
    htp.p(owa.cgi_var_name(i)||' : '||owa.cgi_var_val(i));
  END LOOP;
end;
/