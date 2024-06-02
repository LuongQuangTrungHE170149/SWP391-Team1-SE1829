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
			[description] nvarchar(255),
			timeStart date not null,
			timeEnd date not null,
			content nvarchar(max) not null,
			image varchar(max),
			isHeader bit default 0,
			staff int foreign key references Users(id) not null
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

