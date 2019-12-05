#Updating the SQL from version 2 to version 3.
#Adding new column to fix the lack of char_size value.
ALTER TABLE `ss13_characters`
	ADD `char_size` mediumtext AFTER `gear`;