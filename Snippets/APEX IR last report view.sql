-- Get all last displayed IDs "OBJECT_ID" in IR into clob with : as separator
declare
	l_static_region varchar2(30 char) := 'StaticID';
	l_report_id     number;
	l_region_id     apex_application_page_regions.region_id%type;
	l_context       apex_exec.t_context;
	l_idx_object_id pls_integer;
	l_object_id number;
	tmp_CLOB CLOB;
begin
	dbms_lob.createtemporary(tmp_CLOB, true);
	dbms_lob.open(tmp_CLOB, DBMS_LOB.LOB_READWRITE);
	
	-- First get region ID
	begin
		select region_id
		  into l_region_id
		  from apex_application_page_regions
		 where application_id = :APP_ID
		   and page_id        = :APP_PAGE_ID
		   and static_id      = l_static_region;
		apex_debug.message('AC RETURN REGION_ID =  :%s',l_region_id);    
	exception when no_data_found then 
		l_region_id := null;       
	end;
	
	if l_region_id is not null then 
		-- If region exists get last runned report ID
		begin 
		    l_report_id := apex_ig.get_last_viewed_report_id (
						   p_page_id   => :APP_PAGE_ID,
						   p_region_id => l_region_id );
			apex_debug.message('AC RETURN REPORT_ID =  :%s',l_report_id);    
		exception when no_data_found then 
			l_report_id := null;
		end;
	end if;
	  
	if l_report_id is not null then 
		-- If last runned report exists get Suery of last runned report
		begin
			  l_context := apex_region.open_query_context (
							 p_page_id      => :APP_PAGE_ID,
							 p_region_id    => l_region_id,
							 p_component_id => l_report_id );
		exception when no_data_found then 
			l_context := null;
		end;         
	end if;
	
	if l_context is not null then
		-- Get location in SQL query of column OBJECT_ID
		l_idx_object_id := apex_exec.get_column_position( l_context, 'OBJECT_ID' );
	end if;
	if l_idx_object_id is not null then
		-- Loop and extract data from it	
		while apex_exec.next_row( l_context )
		loop   
			l_object_id := apex_exec.get_number (
									 p_context     => l_context,
									 p_column_idx  => l_idx_object_id );  
			 DBMS_LOB.append (tmp_CLOB, ':'||TO_CHAR (l_object_id) );                                      
		end loop;     
		gARR := trim (LEADING':' from tmp_CLOB); 
		apex_exec.close( l_context );
		dbms_lob.close(tmp_CLOB);
   
	end if;
	
	-- Do somthing with data in tmp_CLOB

exception
		when others then
			apex_exec.close( l_context );
			dbms_lob.close(tmp_CLOB);
			raise;        
end;
/