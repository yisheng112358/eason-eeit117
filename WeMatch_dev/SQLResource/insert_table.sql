-- (1) 專案專用資料庫
use wematch
GO

-- (2) table Video
INSERT INTO Video(videoName, videoCategory, videoLink, videoDesc)
VALUES('背部肌群練習1', 'bodyback', 'https://www.youtube.com/watch?v=9pdk5SryJcM', '背部肌群人體三大肌群之一，背闊肌可以讓我們背部更加的寬闊和厚實，斜方肌可以減輕我們頸椎的壓力，練好背部肌群可以讓我們看起來更加的挺拔。'),
('背部肌群練習2', 'bodyback', 'https://www.youtube.com/watch?v=AGga884deKA', '我們的背部肌群與肱二頭肌，都是採用「拉」這個動作來做訓練，例如：訓練背肌時我們通常採用划船或下拉等動作，在肱二頭肌訓練時會採用彎舉的動作，一般來說我們為了讓訓練的成效更好，所以我們都會採用孤立訓練來針對某個部位的肌群。'),
('胸肌初階訓練', 'bodychest', 'https://www.youtube.com/watch?v=eSw7GGEuFy0', '這個影片是居家練胸肌初階訓練影片，非常適合剛接觸運動的新手，或是體重比較重的人。雖然是跪姿但是對於胸肌的刺激一樣是非常有效，只是對於身體其他部位的訓練較少而已。'),
('腿部基本鍛鍊', 'bodyleg', 'https://www.youtube.com/watch?v=y0ws24YZoA0', '大腿是健身者們容易忽略的一個部位，但是大腿卻是肌肉群最多的一個部位，腿部的鍛鍊對於健身者來說是非常重要的。'),
('女性胸肌初階訓練', 'bodychest', 'https://www.youtube.com/watch?v=BGlC_yj8OdE', '以女性為主的胸肌訓練，主要使用到輔助式引體向上、坐姿窄握划船機、機械式坐姿划船、滑輪下拉、機械式上斜胸推、蝴蝶機夾胸、反向飛鳥。'),
('完美的腿部訓練', 'bodyleg', 'https://www.youtube.com/watch?v=9OqYm6BSHxQ', '這次的內容介紹完美的腿部訓練，要先從解剖學開始了解，下肢的肌群包含哪些部分，除了針對不同肌群之外，也要包含大重量以及高次數的訓練內容，以及單邊訓練和加強運動能力的訓練動作。'),
('背肌訓練動作分享', 'bodyback', 'https://www.youtube.com/watch?v=RrV2_W2J6kM', '影片透過背肌的解剖學告訴大家一些技巧，增加大家對背肌的感受度及訓練動作可以怎麼調整。訓練上如果背肌感受度不佳，都是二頭肌酸、前臂先無力可以試著利用單邊訓練加上旋轉的技巧，提升背肌的感受度。'),
('女孩練背 初學者必學！', 'bodyback', 'https://www.youtube.com/watch?v=4apEUq0UZ-k', '健身房有效練背6個動作-初學女孩運動教學-使用較粗(初階)/較細(中階)的拉力繩做拉力繩引體向上。'),
('練胸4個最有效的動作', 'bodychest', 'https://www.youtube.com/watch?v=GbXtrvl2NAk', '為大家推薦幾個關於胸肌的訓練動作，把這些動作練習起來，它會幫助你進行非常有效的胸部增肌，讓你的整體訓練效果變得更加明顯，基本還是從伏地挺身做起。'),
('坐姿胸推訓練', 'bodychest', 'https://www.youtube.com/watch?v=B3wt0B543WA', '此訓練主要是鍛鍊我們的胸大肌，是重量訓練中必練的項目之一，它可以讓我們的身材變得更加厚實並增強我們上肢向前推的力量，進行此訓練也會連帶使用到肩部及手臂後側三頭肌的力量。'),
('3招練腿肌', 'bodyleg', 'https://www.youtube.com/watch?v=b8eoUbrqUzE', '中老年人平時可根據影片多做這3個動作，鍛鍊腿部上、中、下部位，以強健腿部肌力，增進健康。'),
('背肌4大關鍵', 'bodyback', 'https://www.youtube.com/watch?v=xdA-bmvN7Bc', '主要從解剖角度去講起，肌肉起止點以及從肌動學方向去分析，肌纖維走向、力矩、力臂等研究說明的教學影片。'),
('小腿肌肉訓練', 'bodyleg', 'https://www.youtube.com/watch?v=peyW1_C7AjA', '強化小腿肌肉訓練可防止腿肌抽筋, 避免腳踝受傷, 使肌肉線條勻稱修長。'),
('大腿後側訓練', 'bodyleg', 'https://www.youtube.com/watch?v=MVzlCDnS7L0', '訓練平常不易運動到的大腿後側，藉此讓身體完全開展，順著氣息穩定身體，大腿才能有效的收緊。'),
('7分鐘練背肌', 'bodyback', 'https://www.youtube.com/watch?v=6pY_Jn9y5rI', '隨著年紀越來越大，背部的脂肪會慢慢增厚，更容易導致駝背；擁有了背肌，就等於擁有了漂亮的倒三角形身材，穠纖合度，怡然自得。'),
('四招訓練胸部核心肌群', 'bodychest', 'https://www.youtube.com/watch?v=5UCpNGrFnMU', '利用abdolly訓練核心肌群，同時強化上肢肌力；其中，使用滑行PUSH UP來訓練胸部肌群強化與核心肌群穩定。')
GO

--  (3) 新增管理員帳號
insert into Member(memberAccount, memberPwd, memberStatus, memberName) values ('nana99156', 'Do!ng123', 2, 'nana')
insert into Member(memberAccount, memberPwd, memberStatus, memberName) values ('admintest123', 'P@ssw0rd', 2, 'admin')
insert into Member(memberAccount, memberPwd, memberStatus, memberName) values ('membertest123', 'P@ssw0rd', 1, 'member')
insert into Member(memberAccount, memberPwd, memberStatus, memberName) values ('visitortest123', 'P@ssw0rd', 1, 'visitor')
GO

-- (4) 新增課程
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('瑜珈','星期一','第一節','B200',20,10,10)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('國標舞','星期二','第二節','B205',10,5,5)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('花式有氧','星期三','第三節','B300',30,20,10)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('流行街舞','星期四','第四節','B305',20,0,20)
GO

-- (4) 新增課程
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('瑜珈','星期一','第一節','B200',20,10,10)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('國標舞','星期二','第二節','B205',10,5,5)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('花式有氧','星期三','第三節','B300',30,20,10)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('流行街舞','星期四','第四節','B305',20,0,20)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('間歇','星期五','第五節','B305',50,20,30)
insert into Courses(coursesName,coursesWeek,sectionNumber,classRoom,numberPeople,regNumber,coursesBalance)
values('拉丁有氧','星期一','第一節','B200',20,0,20)
GO
