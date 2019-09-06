-- CREATE DATABASE
CREATE DATABASE AnseremTest
GO

USE AnseremTest;

CREATE TABLE dbo.City (
	CityID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CityName varchar(25) NOT NULL
);
GO

CREATE TABLE dbo.Contact  (
	ContactID int IDENTITY(1,1) NOT NULL PRIMARY KEY,  
	FullName varchar(50) NOT NULL,
	Telephone varchar(25) NULL
);
GO

CREATE TABLE dbo.Partner (
	PartnerID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	PartnerName varchar(25) NOT NULL,
	ContactID int FOREIGN KEY (ContactID) REFERENCES Contact(ContactID), --���������� ����
	CityID int FOREIGN KEY (CityID) REFERENCES City(CityID)
);
GO

CREATE TABLE dbo.Sale  (
	SaleID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SaleName varchar(25) NOT NULL, 
	PartnerID int FOREIGN KEY (PartnerID) REFERENCES Partner(PartnerID),
	ContactID int FOREIGN KEY (ContactID) REFERENCES Contact(ContactID) --������������� �� �������
);
GO

-- INSERT TEST DATA
INSERT dbo.City (CityName)  VALUES 
	('������'),
	('���');
GO

INSERT dbo.Contact (FullName, Telephone)  VALUES 
	('���� ����������', '+79001234567'),
	('����� ���������', '+79007654321');
GO

INSERT dbo.Partner (PartnerName, CityID)  VALUES 
	('��� ������', 1),
	('��� �������', 1),
	('��� ������������', 2);
GO

INSERT dbo.Sale (SaleName, PartnerID, ContactID)  VALUES 
	('������� 1', 1, 1),
	('������� 2', 2, 2),
	('������ �������', NULL, NULL),
	('������� 5', 3, NULL),
	('������� 6', 2, 2);
GO