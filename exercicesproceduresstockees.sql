-- Exercice 1 : création d'une procédure stockée sans paramètre
-- Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des fournisseurs pour lesquels une commande a été passée.

DELIMITER |

CREATE PROCEDURE Lst_Suppliers()
BEGIN
    SELECT DISTINCT sup_name, sup_city, sup_countries_id, sup_zipcode, sup_contact, sup_phone, sup_mail
    FROM suppliers, products, orders_details
    WHERE suppliers.sup_id = products.pro_sup_id
    AND pro_id IN
    (SELECT ode_pro_id FROM orders_details, products WHERE products.pro_id = orders_details.ode_pro_id);
END |

DELIMITER ;

-- Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :

SHOW CREATE PROCEDURE Lst_Suppliers;


-- Exercice 2 : création d'une procédure stockée avec un paramètre en entrée

-- Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente".

