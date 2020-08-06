

DROP DATABASE IF EXISTS Sensyne_Health_db;
CREATE DATABASE Sensyne_Health_db;

SHOW DATABASES;


USE Sensyne_Health_db;

DROP TABLE IF EXISTS cap_shape;
CREATE TABLE cap_shape (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO cap_shape (description, id) values
('bell', 'b') ,
('conical', 'c') ,
('convex', 'x') ,
('flat', 'f') , 
('knobbed', 'k') ,
('sunken', 's' ) 
 ;



DROP TABLE IF EXISTS cap_color;
CREATE TABLE cap_color (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO cap_color (description, id) values
('brown', 'n') ,
('buff', 'b') ,
('cinnamon', 'c') ,
('gray', 'g') ,
('green', 'r') ,
('pink', 'p') ,
('purple', 'u') ,
('red', 'e') ,
('white', 'w') ,
('yellow', 'y' ) 
 ;



DROP TABLE IF EXISTS odor;
CREATE TABLE odor (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO odor (description, id) values
('almond', 'a') ,
('anise', 'l') ,
('creosote', 'c') ,
('fishy', 'y') ,
('foul', 'f') ,
('musty', 'm') ,
('none', 'n') ,
('pungent', 'p') ,
('spicy', 's' ) 
;



DROP TABLE IF EXISTS gill_size;
CREATE TABLE gill_size (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO gill_size (description, id) values
('broad', 'b') ,
('narrow', 'n') 
;



DROP TABLE IF EXISTS gill_color;
CREATE TABLE gill_color (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO gill_color (description, id) values
('black', 'k') ,
('brown', 'n') ,
('buff', 'b') ,
('chocolate', 'h') ,
('gray', 'g') ,
('green', 'r') ,
('orange', 'o') ,
('pink', 'p') ,
('purple', 'u') ,
('red', 'e') ,
('white', 'w') ,
('yellow', 'y' ) 
;



DROP TABLE IF EXISTS stalk_color_above_ring;
CREATE TABLE stalk_color_above_ring (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO stalk_color_above_ring (description, id) values
('brown', 'n') ,
('buff', 'b') ,
('cinnamon', 'c') ,
('gray', 'g') ,
('orange', 'o') ,
('pink', 'p') ,
('red', 'e') ,
('white', 'w') ,
('yellow', 'y' )  
 ;



DROP TABLE IF EXISTS veil_color;
CREATE TABLE veil_color (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO veil_color (description, id) values
('brown', 'n') ,
('orange', 'o') ,
('white', 'w') ,
('yellow', 'y' )  
 ;



DROP TABLE IF EXISTS ring_type;
CREATE TABLE ring_type (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO ring_type (description, id) values
('cobwebby', 'c') ,
('evanescent', 'e') ,
('flaring', 'f') ,
('large', 'l') ,
('none', 'n') ,
('pendant', 'p') ,
('sheathing', 's') ,
('zone', 'z' )  
 ;



DROP TABLE IF EXISTS spore_print_color;
CREATE TABLE spore_print_color (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO spore_print_color (description, id) values
('black', 'k') ,
('brown', 'n') ,
('buff', 'b') ,
('chocolate', 'h') ,
('green', 'r') ,
('orange', 'o') ,
('purple', 'u') ,
('white', 'w') ,
('yellow', 'y' )   
 ;



DROP TABLE IF EXISTS population;
CREATE TABLE population (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO population (description, id) values
('abundant', 'a') ,
('clustered', 'c') ,
('numerous', 'n') ,
('scattered', 's') ,
('several', 'v') ,
('solitary', 'y')   
 ;



DROP TABLE IF EXISTS habitat;
CREATE TABLE habitat (id VARCHAR(2) NOT NULL PRIMARY KEY,
						description VARCHAR(30) NOT NULL
						);

INSERT INTO habitat (description, id) values
('grasses', 'g') ,
('leaves', 'l') ,
('meadows', 'm') ,
('paths', 'p') , 
('urban', 'u') ,
('waste', 'w') ,
('woods', 'd' )
 ;








DROP TABLE IF EXISTS field_data;
CREATE TABLE field_data (id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
						 cap_shape VARCHAR(2), 
						 cap_color VARCHAR(2),  
						 odor VARCHAR(2), 
						 gill_size VARCHAR(2),  
                         gill_color VARCHAR(2), 
                         stalk_color_above_ring VARCHAR(2), 
                         veil_color VARCHAR(2),
                         ring_type VARCHAR(2), 
                         spore_print_color VARCHAR(2),  
                         population VARCHAR(2),  
                         habitat VARCHAR(2),
                         lat FLOAT,
                         lon FLOAT,
                         Time TIME
						);
                        
                        
                        
                        
show tables;