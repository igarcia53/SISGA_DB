/**
  Estás tablas comienzan con una tabla llamada Tenants o Clientes, esta tabla será el inicio de todo, ahí podemos agregar más información, plan, cantidad, etc...
  Pero, esta tabla se va a enlazar prácticamente a todo, hay una tabla Clases e Inscripciones, pero Clase se relaciona de forma directa a Tenants

  Analizar mejor y agregar campos
  */

-- Clientes
CREATE TABLE Tenants
(
    TenantID    SERIAL PRIMARY KEY,
    TenantName  VARCHAR(255) NOT NULL,
    TenantEmail VARCHAR(255) NOT NULL,
    CreatedAt   TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Usuarios
CREATE TABLE Users
(
    UserID       SERIAL PRIMARY KEY,
    TenantID     INT          NOT NULL,
    UserName     VARCHAR(255) NOT NULL,
    UserEmail    VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt    TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantID) REFERENCES Tenants (TenantID) ON DELETE CASCADE
);

-- Roles
CREATE TABLE Roles
(
    RoleID   SERIAL PRIMARY KEY,
    RoleName VARCHAR(255) NOT NULL
);

-- Usuarios y Roles
CREATE TABLE UserRoles
(
    UserRoleID SERIAL PRIMARY KEY,
    UserID     INT NOT NULL,
    RoleID     INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID) ON DELETE CASCADE,
    FOREIGN KEY (RoleID) REFERENCES Roles (RoleID) ON DELETE CASCADE
);

-- Permisos
CREATE TABLE Permissions
(
    PermissionID   SERIAL PRIMARY KEY,
    PermissionName VARCHAR(255) NOT NULL
);

-- Roles y Permisos
CREATE TABLE RolePermissions
(
    RolePermissionID SERIAL PRIMARY KEY,
    RoleID           INT NOT NULL,
    PermissionID     INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Roles (RoleID) ON DELETE CASCADE,
    FOREIGN KEY (PermissionID) REFERENCES Permissions (PermissionID) ON DELETE CASCADE
);

-- Productos
CREATE TABLE Products
(
    ProductID          SERIAL PRIMARY KEY,
    TenantID           INT            NOT NULL,
    ProductName        VARCHAR(255)   NOT NULL,
    ProductDescription TEXT,
    Price              DECIMAL(10, 2) NOT NULL,
    CreatedAt          TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantID) REFERENCES Tenants (TenantID) ON DELETE CASCADE
);

-- Órdenes
CREATE TABLE Orders
(
    OrderID     SERIAL PRIMARY KEY,
    TenantID    INT            NOT NULL,
    UserID      INT            NOT NULL,
    OrderDate   TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (TenantID) REFERENCES Tenants (TenantID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users (UserID) ON DELETE CASCADE
);

-- Detalles de Órdenes
CREATE TABLE OrderDetails
(
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID       INT            NOT NULL,
    ProductID     INT            NOT NULL,
    Quantity      INT            NOT NULL,
    UnitPrice     DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID) ON DELETE CASCADE
);

-- Clases
CREATE TABLE Classes
(
    ClassID          SERIAL PRIMARY KEY,
    TenantID         INT          NOT NULL,
    ClassName        VARCHAR(255) NOT NULL,
    ClassDescription TEXT,
    CreatedAt        TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantID) REFERENCES Tenants (TenantID) ON DELETE CASCADE
);

-- Inscripciones a Clases
CREATE TABLE ClassEnrollments
(
    ClassEnrollmentID SERIAL PRIMARY KEY,
    ClassID           INT NOT NULL,
    UserID            INT NOT NULL,
    EnrollmentDate    TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ClassID) REFERENCES Classes (ClassID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users (UserID) ON DELETE CASCADE
);

-- Categorías de Productos
CREATE TABLE ProductCategories
(
    CategoryID   SERIAL PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);
