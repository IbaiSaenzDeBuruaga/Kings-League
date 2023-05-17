/*Kings League equipo 2*/
/*PL/SQL para crear el xml de ultima jornada*/

DECLARE
  qryCtx DBMS_XMLGEN.ctxHandle;
  result CLOB;
BEGIN
  qryCtx := DBMS_XMLGEN.newContext(
              'SELECT * FROM vista_ultima_jornada');
			  
  -- Set the name of the document root element. The default name is ROWSET			  
  DBMS_XMLGEN.setRowSetTag(qryCtx, 'UltimaJornada');
  
  -- Set the row header to be EMPLOYEE
  DBMS_XMLGEN.setRowTag(qryCtx, 'Partido');
  
  --Poner nulos
  DBMS_XMLGEN.SETNULLHANDLING(qryCtx, 2);
  
  -- Get the result
  result := DBMS_XMLGEN.getXML(qryCtx);
  INSERT INTO CAL_XML_RESULTADO VALUES(DEFAULT, result, 'UltimaJornada');
  
  --Close context
  DBMS_XMLGEN.closeContext(qryCtx);
END;