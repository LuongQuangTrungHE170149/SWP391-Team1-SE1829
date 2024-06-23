create database SWP391_SE1829_Team1;
use SWP391_SE1829_Team1
go


Create table Users(
			id int identity(1,1) not null primary key,
			username nvarchar(255) not null unique,
			password nvarchar (16),
			firstName nvarchar(255),
			lastName nvarchar(255),
			[role] nvarchar(255),
		    gender bit,
			email nvarchar(255) not null unique,
			phoneNumber nvarchar(15) not null unique,
			dob date,
			[address] nvarchar(255),
			dateCreated datetime default getDate(),
			status nvarchar(255) default 'active',
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
			MotocycleType nvarchar(255),
			LicensePlates nvarchar(255),
			Chassis nvarchar(255),
			Engine nvarchar(255),
			OwnerId int REFERENCES Users(id),
)
GO

Create table Contracts(
			ContractId int identity(1,1) primary key,
			CustomerId int references Users(id),
			StaffId int references Users(id),
			VehicleId int references Vehicles(MotocycleId),
			StartDate date,
			EndDate date,
			ContractType nvarchar(255),
			[Description] nvarchar(1000),
			Payment Bigint,
				 nvarchar(255)
)
GO

create table Staff_Workplace(
			swId int identity(1,1) primary key,
			AgencyId int References Agencies(AgencyId),
			StaffId int References Users(id),
			[status] nvarchar(255) default 'active'
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


INSERT INTO Users (username, password, firstName, lastName, [role], gender, email, phoneNumber, dob, [address])
VALUES 
('john_doe', 'password123', 'John', 'Doe', 'customer', 1, 'john.doe@example.com', '1234567890', '1985-06-15', '123 Main St'),
('jane_smith', 'password123', 'Jane', 'Smith', 'staff', 0, 'jane.smith@example.com', '0987654321', '1990-07-20', '456 Elm St');

INSERT INTO Agencies (AgencyName, AgencyAddress, HotLine, Worktime)
VALUES 
('Central Agency', '789 Oak St', '1800123456', '9 AM - 6 PM'),
('West Agency', '101 Pine St', '1800654321', '10 AM - 7 PM');

INSERT INTO Vehicles (MotocycleType, LicensePlates, Chassis, Engine, OwnerId)
VALUES 
(N'Xe moto 2 bánh dung tích nhỏ hơn 50cc', '29A-12345', 'CH123456', 'EN123456', 1),
(N'Xe moto 2 bánh dung tích lớn hơn 50cc', '30B-67890', 'CH654321', 'EN654321', 2),
(N'Xe điện', '31C-54321', 'CH789012', 'EN789012', 2),
(N'Moto 3 bánh', '32D-09876', 'CH345678', 'EN345678', 1),
(N'Các loại xe còn lại', '33E-13579', 'CH246810', 'EN246810', 2);
GO

INSERT INTO Contracts (CustomerId, StaffId, VehicleId, StartDate, EndDate, ContractType, [Description], Payment, status)
VALUES 
(1, 2, 1, '2023-01-01', '2024-01-01', 'Rental', 'One-year rental contract', 5000000, 'Đang hiệu lực'),
(2, 2, 2, '2023-06-01', '2024-06-01', 'Rental', 'One-year rental contract', 6000000, 'Đang hiệu lực');

-- Thêm dữ liệu mẫu vào bảng Staff_Workplace


INSERT INTO Staff_Workplace (AgencyId, StaffId, [status])
VALUES 
(1, 2, 'active'),
(2, 2, 'active');

INSERT INTO Punishments (ContractId, [Description], [Type], [Action])
VALUES 
(1, 'Late payment', 'financial', 'fine'),
(2, 'Vehicle damage', 'operational', 'repair');

INSERT INTO Compensations (ContractId, [Description], [Type], Payment, IsPay)
VALUES 
(3, 'Accident compensation', 'damage', 2000, 0),
(4, 'Late return compensation', 'delay', 500, 1);

INSERT INTO Consultations (name, email, content)
VALUES 
('Nguyễn Duy Hùng', 'Kharrr2001@gmail.com', 'Tôi cần anh em hỗ trợ tôi'),
('John Doe', 'john.doe@example.com', 'I need help with my vehicle contract');

INSERT INTO News (Title, Image, Content, Author, [Type])
VALUES 
('New Vehicle Models', 'image1.jpg', 'Details about new vehicle models available.', 2, 'announcement'),
('Agency Opening', 'image2.jpg', 'New agency opening details.', 2, 'news');

INSERT INTO Users (username, password, firstName, lastName, [role], gender, email, phoneNumber, dob, [address])
VALUES 
('trunglq8', 'quangtrung93', N'Lương', 'Quang Trung', 'staff', 1, 'trunglq8@gmail.com', '0985187536', '1993-05-09', N'Tân Xã - Thạch Thất - Hà Nội')
GO


SELECT * FROM Users
SELECT * FROM Vehicles
SELECT * FROM Contracts