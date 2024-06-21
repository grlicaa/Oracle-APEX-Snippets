-- This is the query for the Homepage view in the schema. The is used in the dashboard page for the classic report query


CREATE OR REPLACE FORCE EDITIONABLE VIEW "HOMEPAGE_V" ("CARD_INITIALS", "CARD_TITLE", "CARD_ICON", "CARD_TEXT", "CARD_SUBTEXT") AS 
select '1' "CARD_INITIALS", count(*) "CARD_TITLE",'fa-user' "CARD_ICON",
'Customers' "CARD_TEXT",
'' "CARD_SUBTEXT"
from customer 
union
select '2' "CARD_INITIALS",count(*) "CARD_TITLE", 'fa-car' "CARD_ICON",
 'Vehicles' "CARD_TEXT",
 '' "CARD_SUBTEXT"
from car_registration
union
select '3' "CARD_INITIALS",count(*) "CARD_TITLE", 'fa-battery-3' "CARD_ICON",
 'Vehicle Suppliers' "CARD_TEXT",
 '' "CARD_SUBTEXT"
from car_supplier 
union
select '4' "CARD_INITIALS",count(*) "CARD_TITLE", 'fa-car' "CARD_ICON",
 'Available Vehicles' "CARD_TEXT",
 '' "CARD_SUBTEXT"
from car_registration where rental_status = 2  group by 2,3
union
select '5' "CARD_INITIALS",count(*) "CARD_TITLE", 'fa-car' "CARD_ICON",
 'Rented Vehicles' "CARD_TEXT",
 '' "CARD_SUBTEXT"
from car_registration where rental_status = 1  group by 2,3;