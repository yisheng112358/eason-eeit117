-- (1) 專案專用資料庫
CREATE database wematch
GO

-- (2)
use wematch
GO

-- (3)
create table Member(
memberId int not null primary key identity(1,1),
memberAccount varchar(50) not null unique,
memberPwd varchar(50) not null,
memberStatus int default 1,
memberName nvarchar(20),
memberEmail varchar(50),
birthdayDate date,
gender varchar(20),
nickname nvarchar(20),
starSign nvarchar(20),
city nvarchar(20),
bloodType nvarchar(20),
hobbies nvarchar(MAX),
picture_1 varbinary(MAX),
picture_2 varbinary(MAX),
selfIntro nvarchar(MAX)
)
GO

-- (4)商品
CREATE table Product(
productId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
category nvarchar(50),
productName nvarchar(50)  NOT NULL,
price money DEFAULT 0,
stock int NOT NULL DEFAULT 0,
productDescription nvarchar(MAX),
thumbnail varbinary(max),
detailImg varbinary(max),
addDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
updateDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
)
GO

-- (5)影片教學 Fitness Videoflix
CREATE table Video(
videoId int primary key not null identity(1,1),
videoName nvarchar(50) not null,
videoCategory nvarchar(50) not null,       --背部.胸部.腿部
videoLink varchar(max) not null,           --Youtube wibsite
videoDesc nvarchar(max),                   --Description
)
GO

-- (6)
create  Table Booking(
bookingId int not null identity,
bookingDate nvarchar(max) not null,
bookingTime nvarchar(max) not null,
ept1 nvarchar(max),
ept2 nvarchar(max),
ept3 nvarchar(max),
ept4 nvarchar(max),
ept5 nvarchar(max),
ept6 nvarchar(max),
ept7 nvarchar(max),
ept8 nvarchar(max),
ept9 nvarchar(max),
ept10 nvarchar(max),
ept11 nvarchar(max),
ept12 nvarchar(max),
bookingName nvarchar(max),
)
GO

-- (7) 教練
create Table Coach(
coachId int primary key not null identity(1,1),
coachPic varbinary(max),
coachName nvarchar(50) not null,
coachNickname nvarchar(50) not null,
coachAge int not null,
courseName nvarchar(50) not null,
courseType nvarchar(50) not null,
license nvarchar(50) not null,
)
GO

--(8.1) 課程
Create Table Courses(
 coursesId int not null primary key  identity(1000,1),--代碼
 coursesName nvarchar(50),--課程名稱
 coursesWeek nvarchar(50),--星期
 sectionNumber nvarchar(50), --課程節數(第幾堂)
 classRoom nvarchar(50),--教室
 numberPeople int, --人數
 regNumber int,--已報名人數
 coursesBalance int,--餘額(剩餘報名人數)
)
GO

--(8.2) 課表
 Create Table Curriculum(
 curriculumId int not null primary Key identity(2000,1),--課表
 memberId int,--會員
 coursesId int,--課程
 coursesName nvarchar(50),--課程名稱
 coursesWeek nvarchar(50),--星期
 sectionNumber nvarchar(50), --課程節數(第幾堂)
 classRoom nvarchar(50),--教室
)
GO

--(9)飲食
Create Table Food(
Id int not null primary key identity(1,1),--ID
addDate nvarchar(50) not null , --日期
listType nvarchar(50) not null, --食物類別
listName nvarchar(50) not null, --食物名稱
calories nvarchar(50) not null, --熱量
)
GO

--(9)訂單
create table Receiver(
receiverId int  Identity(1, 1) Primary Key NOT NULL,
receiverName nvarchar(50),
receiverPhone nvarchar(50),
receiverAddress nvarchar(50),
receiverEmail nvarchar(50),
receiverNote nvarchar(50),
totalAmount money DEFAULT 0,
)
GO
