create database SWP391_SE1829_Team1;
go
Use SWP391_SE1829_Team1;


Create table Users(
			id int identity(1,1) not null primary key,
			username nvarchar(255) not null unique,
			password nvarchar (16) not null,
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



Create table Agencies(
			AgencyId int  identity(1,1) primary key ,
			AgencyName nvarchar(255),
			AgencyAddress nvarchar(255),
			HotLine varchar(30),
			Worktime nvarchar(100),
			[status] nvarchar(30) default 'active'
)
GO

Create table Vehicles(
			MotocycleId int identity(1,1) primary key,
			Model nvarchar(255),
			LicensePlates nvarchar(255),
			OwnerId int REFERENCES Users(id),
)
GO


Create table Contracts(
			ContractId int identity(1,1) primary key,
			CustomerId int references Users(id),
			StaffId int references Users(id),
			AgencyId int references Agencies(AgencyId),
			VehicleId int references Vehicles(MotocycleId),
			StartDate date,
			EndDate date,
			ContractType nvarchar(255),
			[Description] nvarchar(1000),
			Payment Bigint,
			IsPay Bit
)
GO


Create table Staff_Workplace(
			swId int identity(1,1) primary key,
			AgencyId int References Agencies(AgencyId),
			StaffId int References Users(id),
			[status] nvarchar(255)
)
GO

Create table Punishments(
			PunishmentId int identity(1,1) primary key,
			ContractId int references Contracts(ContractId),
			[Description] nvarchar(255),
			[Type] nvarchar(255),
			[Action] nvarchar(255),
)
GO

Create table Compensations(
			CompensationId int identity(1,1) primary key,
			ContractId int references Contracts(ContractId),
			[Description] nvarchar(255),
			[Type] nvarchar(255),
			Payment Bigint,
			IsPay bit,
)
GO




Create table Consultations(
		    id  int Identity(1,1) primary key,
			name nvarchar(255),
			email nvarchar(255),
			content nvarchar(max),
			createDate datetime default getdate(),
			reply_message nvarchar(max),
			staff int foreign key references Users(id),
			status bit default 0
)
GO
insert into Consultations(name, email, content)
Values ('Nguyễn Duy Hùng', 'Kharrr2001@gmail.com', 'Tôi cần anh em hỗ trợ tôi')


Create Table News(
			NewsId int identity(1,1) primary key,
			Title nvarchar(255),
			Image nvarchar(255),
			Content nvarchar(max),
			Author int foreign key references Users(id),
			[Type] nvarchar(255),
			[Date] Datetime default getdate()

)
GO


INSERT INTO Users ( username, password, firstName, lastName, [role], email, phoneNumber, dob, [address], gender)
VALUES 
( 'jdoe', '123', 'John', 'Doe', 'Customer', 'jdoe@example.com', '123456789', '1990-01-15', '123 Main St, Hanoi', 1),
( 'asmith','123', 'Anna', 'Smith', 'Staff', 'asmith@example.com', '987654321', '1985-05-23', '456 Elm St, HCMC', 0),
( 'btan', '123', 'Bao', 'Tan', 'Customer', 'btan@example.com', '123123123', '1992-09-10', '789 Oak St, Danang', 2);



-- Thêm dữ liệu mẫu vào bảng Agencies
INSERT INTO Agencies (AgencyName, AgencyAddress, Worktime, HotLine)
VALUES 
('Agency One', '123 Agency St, Hanoi', '8h-17h', '011111111'),
('Agency Two', '456 Agency Ave, HCMC', '8h-17h','0222222222'),
('Agency Three', '789 Agency Blvd, Danang', '8h-17h','033333333');

-- Thêm dữ liệu mẫu vào bảng Vehicles
INSERT INTO Vehicles (Model, LicensePlates, OwnerId)
VALUES 
('Honda SH', '29A-123.45', 1),
('Yamaha Exciter', '30B-678.90', 2),
('Suzuki Raider', '31C-543.21', 3);

-- Thêm dữ liệu mẫu vào bảng Contracts
INSERT INTO Contracts (CustomerId, StaffId, AgencyId, VehicleId, StartDate, EndDate, ContractType, [Description], Payment, IsPay)
VALUES 
(1, 2, 1, 1, '2023-01-01', '2024-01-01', 'Rental', 'One-year rental contract', 5000000, 0),
(3, 2, 2, 2, '2023-06-01', '2024-06-01', 'Rental', 'One-year rental contract', 6000000, 1);


-- Thêm dữ liệu mẫu vào bảng Staff_Workplace
INSERT INTO Staff_Workplace ( AgencyId, StaffId, [status])
VALUES ( 1, 2, 'Active'),
( 2, 3, 'Active');

-- Thêm dữ liệu mẫu vào bảng Punishments
INSERT INTO Punishments ( ContractId, [Description], [Type], [Action])
VALUES 
( 1, 'Late payment', 'Fine', 'Pay additional fee'),
( 2, 'Vehicle damage', 'Compensation', 'Pay repair cost');

-- Thêm dữ liệu mẫu vào bảng Compensations
INSERT INTO Compensations ( ContractId, [Description], [Type], Payment, IsPay)
VALUES 
( 2, 'Damage to the vehicle', 'Repair Cost', 200000, 0);

insert into Conversation(email, message)
values('kharrr2001@gmail.com','chao anh em'),
('kharrr2001@gmail.com','helo 123');

-- Thêm dữ liệu mẫu vào bảng Consultations
INSERT INTO Consultations ( name, Phone, email, dob, [Address],conversationId, status)
VALUES 
( 'Nguyen Van A', 123456789, 'nguyenvana@example.com', '1993-02-17', '234 Consultation St, Hanoi',1, 'Pending'),
( 'Tran Thi B', 987654321, 'tranthib@example.com', '1988-11-30', '567 Consultation Ave, HCMC',2, 'Completed');

-- Thêm dữ liệu mẫu vào bảng News
INSERT INTO News ( Title,Image, Content, Author, [Date], Type)
VALUES 
( 'New Service Launch','null', 'We are excited to announce the launch of our new service...', 2, '2024-05-15', 'Announcement'),
( 'Holiday Discounts','null', 'Enjoy our special discounts this holiday season...', 2, '2024-05-10', 'Promotion');