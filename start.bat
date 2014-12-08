@echo off
SET /P file_name=Enter filename(extension already in XML): 

:transformDump
	mysqldump -u root -p --xml project_schema sale > %file_name%.xml
	
	if %ERRORLEVEL% NEQ 0 (goto ERROR)

	echo MySQLdump successful
	goto :transformDumpedFile

	:ERROR
		echo Error in mysqldump
		pause > nul
		exit

	:transformDumpedFile
		echo.
		SET /P output_file=Enter filename transformation(extension already in XML): 
		
		xalan -i 2 -o %output_file%.xml %file_name%.xml data_transform.xsl
		
		echo.
		
		echo Transform to xhtml documents (extensions not needed): 
		SET /P by_amount= - Output filename to display data by Amount: 
		SET /P by_salesperson= - Output filename to display data by Sales Person: 
		SET /P by_date= - Output filename to display data by Dates: 

		transform %output_file% transform_to_xhtml_amount %by_amount% xhtml
		transform %output_file% transform_to_xhtml_salesperson %by_salesperson% xhtml
		transform %output_file% transform_to_xhtml_date %by_date% xhtml
		
		echo.
		echo Transform data to pdf, rtf, and png (extension needed)
		SET /P xslfo= - Output filename to display data by Dates: 
		
		call fop -xml %output_file%.xml -xsl transform_to_fo.xsl -pdf %xslfo%.pdf
		call fop -xml %output_file%.xml -xsl transform_to_fo.xsl -rtf %xslfo%.rtf
		call fop -xml %output_file%.xml -xsl transform_to_fo.xsl -png %xslfo%.png
		
		echo.
		echo Database retrieval success!
		pause > nul

