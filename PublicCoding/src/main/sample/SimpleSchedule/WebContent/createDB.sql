
CREATE TABLE tb_schedule (
       schedule_id          	int NOT NULL,
       schedule_date_time   	datetime NOT NULL,
       schedule_subject     	varchar(100) NULL,
       schedule_content     	text NULL,
)


insert into tb_schedule values(1,getDate(),'테스트','테스트');