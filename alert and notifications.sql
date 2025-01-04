//Notifications
CREATE TABLE Notifications (
    NotificationID INT AUTO_INCREMENT PRIMARY KEY,
    NotificationType VARCHAR(50),
    Message TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Unread', 'Read') DEFAULT 'Unread'
);
//alert
SELECT 
    OrderID, 
    ProductID, 
    OrderDate, 
    OrderStatus, 
    DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder 
FROM 
    Orders 
WHERE 
    OrderStatus = 'Pending' AND DATEDIFF(CURDATE(), OrderDate) > 0;
