declare
  l_id NUMBER;

  l_to    varchar2(100 char) := 'mail_to';
  l_from  varchar2(100 char) := 'mail_from';
begin
  l_id := apex_mail.send(
    p_to        => l_to,
    p_from      => l_from,
    p_subj      => 'TEST',
    p_body      => 'Send from app',
    p_body_html => 'Send from app');
/*
  for c1 in (select filename, blob_content, mime_type
         from apex_application_files
        where id in (123,456))
  loop

    apex_mail.add_attachment(
      p_mail_id    => l_id,
      p_attachment => c1.blob_content,
      p_filename   => c1.filename,
      p_mime_type  => c1.mime_type);
  end loop;

*/
  commit;
  apex_mail.push_queue;
end;
/