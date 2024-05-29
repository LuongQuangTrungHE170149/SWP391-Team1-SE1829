create database SWP391_SE1829_Team1;
go
Use SWP391_SE1829_Team1;
go


Create table Users(
			id int identity(1,1) not null primary key,
			username nvarchar(255) not null unique,
			password nvarchar(255),
			firstName nvarchar(255),
			lastName nvarchar(255),
			[role] nvarchar(255),
			gender int,
			email nvarchar(255) not null unique,
			phone nvarchar(15) not null unique,
			dob date,
			[address] nvarchar(255),
)
GO

Create table Agencies(
			AgencyId int  identity(1,1) primary key ,
			AgencyName nvarchar(255),
			AgencyAddress nvarchar(255),
			HotLine varchar(20),
			Worktime nvarchar(100),
			[status] nvarchar(30) default 'active'
)



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
			id int identity(1,1) primary key,
			name nvarchar(255) not null,
			email nvarchar(255) not null,
			content nvarchar(255) not null,
			createDate datetime default getdate(),
			staff int foreign key references Users(id),
			status bit default 0
)
GO

create table Promotion(
            id int identity(1,1) primary key,
			title nvarchar(255) not null,
			timeStart date not null,
			timeEnd date not null,
			content nvarchar(max),
			staff int foreign key references Users(id)
)

Create Table News(
			NewsId nvarchar(255) primary key,
			Title nvarchar(255),
			Content nvarchar(4000),
			Author int references Users(id),
			Type nvarchar(255),
			[Date] date
)
GO

insert into Users(username,firstName,lastName,gender,dob,phone,email,role,address)
values('kha21','kha','Nguyen','1','2001/09/21','0327983593','kharrr2001@gmail.com','staff','Hai Duong')

