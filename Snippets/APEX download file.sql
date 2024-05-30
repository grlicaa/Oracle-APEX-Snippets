declare
  l_blob blob;
  l_filename varchar2(100 char);
  l_mimetype varchar2(100 char);
begin
  select blob_content, mimetype, filename
     into l_blob, l_mimetype, l_filename
    from my_image_table
    where id = :FILE_ID;
  --
  sys.htp.init;
  sys.owa_util.mime_header( l_mimetype, FALSE );
  sys.htp.p('Content-length: ' || sys.dbms_lob.getlength( l_blob));
  sys.htp.p('Content-Disposition: attachment; filename="' || l_filename || '"' );
  sys.owa_util.http_header_close;
  sys.wpg_docload.download_file( l_blob );

  apex_application.stop_apex_engine;

end;
/