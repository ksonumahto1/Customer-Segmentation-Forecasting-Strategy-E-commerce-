
CREATE TABLE `clicks` (
  `sku_ID` varchar(32) DEFAULT NULL,
  `user_ID` varchar(32) DEFAULT NULL,
  `request_time` datetime DEFAULT NULL,
  `channel` varchar(20) DEFAULT NULL,
  KEY `fk_clicks_users_user_id` (`user_ID`),
  KEY `fk_clicks_skus_sku_id` (`sku_ID`),
  CONSTRAINT `fk_clicks_skus_sku_id` FOREIGN KEY (`sku_ID`) REFERENCES `skus` (`sku_ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_clicks_users_user_id` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `delivery` (
  `package_ID` varchar(32) DEFAULT NULL,
  `order_ID` varchar(32) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `ship_out_time` datetime DEFAULT NULL,
  `arr_station_time` datetime DEFAULT NULL,
  `arr_time` datetime DEFAULT NULL,
  KEY `fk_delivery_order_order_id` (`order_ID`),
  CONSTRAINT `fk_delivery_order_order_id` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`order_ID`) ON 
  DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `inventory` (
  `dc_ID` int DEFAULT NULL,
  `sku_ID` varchar(32) DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `fk_inventory_network_dc_id` (`dc_ID`),
  KEY `fk_inventory_skus_sku_id` (`sku_ID`),
  CONSTRAINT `fk_inventory_network_dc_id` FOREIGN KEY (`dc_ID`) REFERENCES `network` (`dc_ID`) ON DELETE SET NULL ON UPDATE 
  SET NULL,
  CONSTRAINT `fk_inventory_skus_sku_id` FOREIGN KEY (`sku_ID`) REFERENCES `skus` (`sku_ID`) ON DELETE SET NULL ON UPDATE 
  SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `network` (
  `region_ID` int DEFAULT NULL,
  `dc_ID` int NOT NULL,
  PRIMARY KEY (`dc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_ID` varchar(32) NOT NULL,
  `user_ID` varchar(32) DEFAULT NULL,
  `sku_ID` varchar(32) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `promise` varchar(10) DEFAULT NULL,
  `original_unit_price` decimal(10,2) DEFAULT NULL,
  `final_unit_price` decimal(10,2) DEFAULT NULL,
  `direct_discount_per_unit` decimal(10,2) DEFAULT NULL,
  `quantity_discount_per_unit` decimal(10,2) DEFAULT NULL,
  `bundle_discount_per_unit` decimal(10,2) DEFAULT NULL,
  `coupon_discount_per_unit` decimal(10,2) DEFAULT NULL,
  `gift_item` tinyint DEFAULT NULL,
  `dc_ori` int DEFAULT NULL,
  `dc_des` int DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `fk_orders_users_user_id` (`user_ID`),
  CONSTRAINT `fk_orders_userid_users` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `skus` (
  `sku_ID` varchar(32) NOT NULL,
  `type` int DEFAULT NULL,
  `brand_ID` varchar(64) DEFAULT NULL,
  `attribute1` varchar(32) DEFAULT NULL,
  `attribute2` varchar(32) DEFAULT NULL,
  `activate_date` date DEFAULT NULL,
  `deactivate_date` date DEFAULT NULL,
  PRIMARY KEY (`sku_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_ID` varchar(32) NOT NULL,
  `user_level` int DEFAULT NULL,
  `first_order_month` varchar(7) DEFAULT NULL,
  `plus` tinyint DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `age` varchar(8) DEFAULT NULL,
  `marital_status` varchar(1) DEFAULT NULL,
  `education` int DEFAULT NULL,
  `city_level` int DEFAULT NULL,
  `purchase_power` int DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
