create database SWP391_SE1829_Team1;
Use SWP391_SE1829_Team1;


Create table userID(
			id int identity(1,1) not null primary key,
			username nvarchar(255) not null unique,
			password nvarchar(255) not null,
			firstName nvarchar(255),
			lastName nvarchar(255),
			[role] nvarchar(255),
		    gender int,
			email nvarchar(255) not null unique,
			phoneNumber nvarchar(15) not null unique,
			dob date,
			[address] nvarchar(255),
)
GO

Create table AgenciesID(
			AgencyId int  identity primary key ,
			AgencyName nvarchar(255),
			AgencyAddress nvarchar(255),
			HotLine varchar(20),
			Worktime nvarchar(100),
			[status] nvarchar(30) default 'active'
)

GO

Create table Vehicles(
			MotocycleId nvarchar(255) primary key,
			Model nvarchar(255),
			LicensePlates nvarchar(255),
			OwnerId int REFERENCES Users(id),
)
GO

Create table Contracts(
			ContractId nvarchar(255) primary key,
			CustomerId int references Users(id),
			StaffId int references Users(id),
			AgencyId int references Agencies(AgencyId),
			VehicleId nvarchar(255) references Vehicles(MotocycleId),
			StartDate date,
			EndDate date,
			ContractType nvarchar(255),
			[Description] nvarchar(1000),
			Payment Bigint,
			[status] nvarchar(255)
)
GO

Create table Staff_Workplace(
			swId nvarchar(255) primary key,
			AgencyId int References Agencies(AgencyId),
			StaffId int References Users(id),
			[status] nvarchar(255)
)
GO

Create table Punishments(
			PunishmentId nvarchar(255) primary key,
			ContractId nvarchar(255) references Contracts(ContractId),
			[Description] nvarchar(255),
			[Type] nvarchar(255),
			[Action] nvarchar(255),
)
GO

Create table Compensations(
			CompensationId nvarchar(255) primary key,
			ContractId nvarchar(255) references Contracts(ContractId),
			[Description] nvarchar(255),
			[Type] nvarchar(255),
			Payment Bigint,
			IsPay bit,
)
GO

Create table Consultations(
			ConId nvarchar(255) primary key,
			name nvarchar(255),
			Phone int,
			email nvarchar(255),
			dob date,
			[Address] nvarchar(255),
			status nvarchar(255)
)
GO

Create Table News(
			NewsId nvarchar(255) primary key,
			Title nvarchar(255),
			Content nvarchar(4000),
			Author int references Users(id),
			[Date] date,
			Type nvarchar(255),
)
GO

INSERT INTO Users ( username, firstName, lastName, [role], email, phoneNumber, dob, [address], gender)
VALUES 
( 'jdoe', 'John', 'Doe', 'Customer', 'jdoe@example.com', '123456789', '1990-01-15', '123 Main St, Hanoi', 1),
( 'asmith', 'Anna', 'Smith', 'Staff', 'asmith@example.com', '987654321', '1985-05-23', '456 Elm St, HCMC', 0),
( 'btan', 'Bao', 'Tan', 'Customer', 'btan@example.com', '123123123', '1992-09-10', '789 Oak St, Danang', 2);

-- Thêm dữ liệu mẫu vào bảng Agencies
INSERT INTO Agencies (AgencyName, AgencyAddress, Worktime, HotLine)
VALUES 
('Agency One', '123 Agency St, Hanoi', '8h-17h', '0111111111'),
('Agency Two', '456 Agency Ave, HCMC', '8h-17h','02222222'),
('Agency Three', '789 Agency Blvd, Danang', '8h-17h','03333333');

-- Thêm dữ liệu mẫu vào bảng Vehicles
INSERT INTO Vehicles (MotocycleId, Model, LicensePlates, OwnerId)
VALUES 
('V001', 'Honda SH', '29A-123.45', 1),
('V002', 'Yamaha Exciter', '30B-678.90', 3),
('V003', 'Suzuki Raider', '31C-543.21', 1);

-- Thêm dữ liệu mẫu vào bảng Contracts
INSERT INTO Contracts (ContractId, CustomerId, StaffId, AgencyId, VehicleId, StartDate, EndDate, ContractType, [Description], Payment, [status])
VALUES 
('C001', 1, 2, '1', 'V001', '2023-01-01', '2024-01-01', 'Rental', 'One-year rental contract', 5000000, 'đã thanh toán'),
('C002', 3, 2, '2', 'V002', '2023-06-01', '2024-06-01', 'Rental', 'One-year rental contract', 6000000, 'đang chờ duyệt');

-- Thêm dữ liệu mẫu vào bảng Staff_Workplace
INSERT INTO Staff_Workplace (swId, AgencyId, StaffId, [status])
VALUES 
('SW001', 1, 2, 'Active'),
('SW002', 1, 2, 'Active');

-- Thêm dữ liệu mẫu vào bảng Punishments
INSERT INTO Punishments (PunishmentId, ContractId, [Description], [Type], [Action])
VALUES 
('P001', 'C001', 'Late payment', 'Fine', 'Pay additional fee'),
('P002', 'C002', 'Vehicle damage', 'Compensation', 'Pay repair cost');

-- Thêm dữ liệu mẫu vào bảng Compensations
INSERT INTO Compensations (CompensationId, ContractId, [Description], [Type], Payment, IsPay)
VALUES 
('CP001', 'C002', 'Damage to the vehicle', 'Repair Cost', 200000, 0);

-- Thêm dữ liệu mẫu vào bảng Consultations
INSERT INTO Consultations (ConId, name, Phone, email, dob, [Address], status)
VALUES 
('CON001', 'Nguyen Van A', 123456789, 'nguyenvana@example.com', '1993-02-17', '234 Consultation St, Hanoi', 'Pending'),
('CON002', 'Tran Thi B', 987654321, 'tranthib@example.com', '1988-11-30', '567 Consultation Ave, HCMC', 'Completed');

-- Thêm dữ liệu mẫu vào bảng News
INSERT INTO News (NewsId, Title, Content, Author, [Date], Type)
VALUES 
('N001', 'New Service Launch', 'We are excited to announce the launch of our new service...', 2, '2024-05-15', 'Announcement'),
('N002', 'Holiday Discounts', 'Enjoy our special discounts this holiday season...', 2, '2024-05-10', 'Promotion');
