CREATE TABLE Appointment (
    App_Date date,
    Total_Cost int,
    Technician_Name nvarchar(100),
    Cow_ID int,
    Diagnosis nvarchar(100), 
    Treatment_ID int,
    
    PRIMARY KEY (App_Date)
    FOREIGN KEY (Technician_Name) REFERENCES App_Date(Technician_Name) 
    FOREIGN KEY (Cow_ID) REFERENCES Cows(Cow_ID)

);

CREATE TABLE Birth (
    Births nvarchar(100), 
    Cow_ID int,
    Comments nvarchar(100), 
    Birth_Date date,
    
    PRIMARY KEY (Births)
    FOREIGN KEY (Cow_ID) REFERENCES Cow(Cow_ID)
);

CREATE TABLE Cows ( 
    Cow_ID int,
    Date_Born date, 
    Breed nvarchar(100), 
    Mother_ID int, 
    Size_ID int, 
    Date_Removed date, 
    Cause nvarchar(100), 
    Herd_ID int, 
    Date_Acquired date,
    
    PRIMARY KEY (Cow_ID)
    FOREIGN KEY (Herd_ID) REFERENCES Herds (Herd_ID) 
);

CREATE TABLE Herds ( 
    Herd_ID int,
    Location nvarchar(100), 
    Date date NOT NULL,
    Feed_Source nvarchar(100), 
    Quantity int,
    Waste nvarchar(100),
    
    PRIMARY KEY (Herd_ID) 
);

CREATE TABLE Lineage ( 
    Cow_ID int, 
    Size_ID int,
    Breed nvarchar(100), 
    Lineage_Comments nvarchar(100),
    
    PRIMARY KEY (Cow_ID) 
);

CREATE TABLE Medical_History ( 
    Cow_ID int,
    Technician_Name nvarchar(100), 
    Birth_Weight int,
    Previous_Weight int, 
    Diseases_Infections nvarchar(256),
    
    PRIMARY KEY (Cow_ID)
    FOREIGN KEY (Technician_Name) REFERENCES Vet (Technician_Name)
);

CREATE TABLE Medications (
    Medication nvarchar(100),
    Cost int,
    Checked_Weight nvarchar(256),
    
    PRIMARY KEY (Medication) 
);

CREATE TABLE Milk_Production ( 
    Milk_Quantity int,
    Cow_ID int,
    Comments nvarchar(100), 
    Date_Produced int,

    PRIMARY KEY (Milk_Quantity)
    FOREIGN KEY (Cow_ID) REFERENCES Cows (Cow_ID)
);

CREATE TABLE Purchase (
    PurchaseDate int, 
    Purchase_ID int, 
    Delivery_Cost int, 
    Supplier_Name nvarchar(100),
    
    PRIMARY KEY (PurchaseDate)
    FOREIGN KEY (Purchase_ID) REFERENCES SaleItems (Purchase_ID) 
    FOREIGN KEY (Supplier_Name) REFERENCES Supplier (Supplier_Name)
);

CREATE TABLE SaleItems ( 
    Purchase_ID int,
    Item_Type nvarchar(100), 
    Quantity int,
    
    PRIMARY KEY (Purchase_ID)
    FOREIGN KEY (Item_Type) REFERENCES Item (Item_Type) 
);

CREATE TABLE Supplier (
    Supplier_Name nvarchar(100), 
    Phone int,
    Address nvarchar(100),
    City nvarchar(100),
    State nvarchar(100),
    Zip int,
    
    PRIMARY KEY (Supplier_Name) 
);

CREATE TABLE Treatments ( 
    Treatment_ID int,
    Cow_ID int,
    Symptoms nvarchar(100), 
    Comments nvarchar(100), 
    Medication nvarchar(100),
    Quantity int,
    Treatment_Date int, 
    Checked_Weight nvarchar(100), 
    Severity nvarchar(100),

    PRIMARY KEY (Treatment_ID)
    FOREIGN KEY (Cow_ID) REFERENCES Appointment (Cow_ID) 
    FOREIGN KEY (Medication) REFERENCES Medications (Medication)
);

CREATE TABLE Vet (
    Technician_Name nvarchar(100), 
    City nvarchar(100),
    State nvarchar(100),
    Zip int,
    Phone int,
    Vet_Add nvarchar(256),
    
    PRIMARY KEY (Technician_Name) 
);

CREATE TABLE Item (
    Item_Type nvarchar(100), 
    Food_Source nvarchar(100), 
    Cost int,
    Item_ID int,

    PRIMARY KEY (Item_Type) 
);