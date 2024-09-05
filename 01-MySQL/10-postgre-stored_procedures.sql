-- FUNCTIONS

CREATE OR REPLACE FUNCTION fn_mid(word varchar, startPos integer, cnt integer)
RETURNS varchar
AS
$$
BEGIN
	RETURN substring(word FROM startPos FOR cnt);
END;
$$
LANGUAGE plpgsql;

SELECT fn_mid('software', 2, 2); 
-- OUTPUT:  "of"

-------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION fnMakeFull(firstName varchar, lastName varchar)
returns varchar 
AS
$$
begin
	if firstName IS NULL AND lastName IS NULL THEN
		return NULL;
	elsif firstName is NULL AND lastName IS NOT NULL THEN
		return initCap(lastName);
	elsif firstNAME IS NOT NULL AND lastName is NULL THEN
		return initCap(firstName);
	else
		return concat(initCap(firstname), ' ', initCap(lastName) );
	end if;
end;
$$
language plpgsql;

SELECT * FROM fnMakeFull('prathibha', 'prasad');
-- OUTPUT:  "fnmakefull"
--			"Prathibha Prasad"
SELECT * FROM fnMakeFull('suhas', '' );
-- OUTPUT:  "fnmakefull"
--			"Suhas "
SELECT * FROM fnMakeFull('', 'prasad');
-- OUTPUT: "fnmakefull"
--         " Prasad"

-------------------------------------------------------------------------------------
