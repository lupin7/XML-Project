Database Password: password

* You only need to provide the names of the output files, no need to provide an extension for the files

CODES BEING EXECUTED:
* mysqldump database to sale.xml
mysqldump -u root -p --xml project_schema sale > Documents\project\sale.xml

* transform xml dump to sale.xml accdg to schema
(-i 2 = line spaces; -o sales.xml = output file)
xalan -i 2 -o sales.xml sale.xml data_transform.xsl

* transform to xhtml 1 by descending amount
transform sales transform_to_xhtml_amount sales_by_amount xhtml
* transform to xhtml 1 by ascending salesperson
transform sales transform_to_xhtml_salesperson sales_by_salesperson xhtml
* transform to xhtml 1 by recent to old date
transform sales transform_to_xhtml_date sales_by_date xhtml

* transform xsl-fo to pdf, rtf, png
call fop -xml sales.xml -xsl transform_to_fo.xsl -pdf sales.pdf
call fop -xml sales.xml -xsl transform_to_fo.xsl -rtf sales.rtf
call fop -xml sales.xml -xsl transform_to_fo.xsl -png sales.png