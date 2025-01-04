CREATE TABLE Notifications (
    NotificationID INT AUTO_INCREMENT PRIMARY KEY,
    NotificationType ENUM('Low Stock', 'Order Delay', 'Reorder Reminder') NOT NULL,
    Message TEXT NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    StockLevel INT NOT NULL,
    NotificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReadStatus ENUM('Unread', 'Read') DEFAULT 'Unread',
    UserID INT,  -- Optional: If you want to associate notifications with users
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE SET NULL
);
DELIMITER $$

CREATE TRIGGER LowStockNotification
AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    -- If the stock level is below or equal to the reorder point, create a low-stock notification
    IF NEW.StockLevel <= NEW.ReorderPoint THEN
        INSERT INTO Notifications (NotificationType, Message, ProductName, StockLevel)
        VALUES ('Low Stock', 
                CONCAT('The stock level for ', NEW.ProductName, ' is low. Current stock: ', NEW.StockLevel), 
                NEW.ProductName, NEW.StockLevel);
    END IF;
END $$

DELIMITER ;
