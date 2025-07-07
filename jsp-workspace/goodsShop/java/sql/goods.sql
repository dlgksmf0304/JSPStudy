
-- member 테이블

USE goodsDB;

create table member  ( 
    m_id varchar(10) not null,       
    m_password varchar(10) not null,
    m_name varchar(10) not null,     
    m_gender varchar(4),            
    m_birth  varchar(10),            
    m_mail  varchar(30),             
    m_phone varchar(20),           
    m_address varchar(90),            
    m_regist_day varchar(50),         
    primary key(m_id) 
) default CHARSET=utf8;

INSERT INTO member VALUES('lhn', '1234', '이하늘','여', '030304', 'dlgksmf0304@naver.com', '01039192334', '인계동', NOW());
--               (기본키)아이디  비밀번호 이름    성별  생년월일    이메일                   전화번호        주소  가입날짜

desc member;
drop table member; -- board테이블 삭제 
select * from member;

-- 게시판 테이블 -------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS board (
   num int not null auto_increment,
   b_id varchar(10) not null, 
   b_name varchar(10) not null, 
   b_subject varchar(100) not null,
   b_content text not null,
   b_regist_day varchar(30),
   b_hit int,
   b_ip varchar(20),
   PRIMARY KEY(num)
)default CHARSET=utf8;

desc board;
drop table board; -- board테이블 삭제 

-- 상품테이블 ---------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS items ( 

   i_id VARCHAR(10) NOT NULL, 
   i_name VARCHAR(20),   
   i_unitPrice  INTEGER,   
   i_description TEXT,         
   i_size   VARCHAR(10),  
   i_category  VARCHAR(10),   
   i_unitsInStock LONG,   
   i_fileName  VARCHAR(20),    
   PRIMARY KEY (i_id)
)default CHARSET=utf8;

desc items;


INSERT INTO items VALUES ('25HOME', '25홈유니폼', '109000', '2025년 홈그라운드 유니폼입니다', 'M', 'Home', '10', '25HOME.jpg');
INSERT INTO items VALUES ('25AWAYS', '25원정유니폼', '109000', '2025년 원정 유니폼입니다', 'M', 'Aways', '10', '25AWAYS.jpg');
INSERT INTO items VALUES ('25Ball', '25싸인볼', '20000', '2025년 싸인볼입니다', 'FREE', 'Acc', '10', '25Ball.jpg');
INSERT INTO items VALUES ('25Keyring', '25마스코트키링', '15000', '2025년 수원블루윙즈 마스코트 키링입니다', 'FREE', 'Acc', '10', '25Keyring.jpg');
INSERT INTO items VALUES ('25Muffler', '25머플러', '20000', '2025년 수원블루윙즈 니트 머플러입니다', 'FREE', 'Acc', '10', '25Muffler.jpg');

select * from items;

drop table items; -- items테이블 삭제 

-- 장바구니 테이블--------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS cart ( -- 장바구니 테이블
    cart_id         INT AUTO_INCREMENT PRIMARY KEY,   -- 장바구니 고유 ID
    m_id            VARCHAR(10) NOT NULL,             -- 회원 ID (member.m_id와 동일)
    m_name          VARCHAR(20),                      -- 회원 이름 (member.m_name과 동일)
    i_id            VARCHAR(10) NOT NULL,             -- 상품 ID (items의 i_id와 동일)
    i_name          VARCHAR(20),                      -- 상품 이름
    i_unitPrice     INTEGER NOT NULL,                 -- 단가
    i_category      VARCHAR(10),                      -- 카테고리 (Home, Aways, Acc)
    i_size          VARCHAR(10),                      -- 사이즈 (M, FREE 등)
    i_quantity      INT NOT NULL,                     -- 수량
    c_total         INT                               -- 총합계 (단가 × 수량)
) DEFAULT CHARSET=utf8;

INSERT INTO cart (m_id, m_name, i_id, i_name, i_unitPrice, i_category, i_size, i_quantity, c_total) VALUES
('user01', '전민기', '25HOME', '25홈유니폼', 109000, 'Home', 'M', 1, 109000),
('user02', '김샛별', '25AWAYS', '25원정유니폼', 109000, 'Aways', 'M', 1, 109000),
('user03', '이하늘', '25Ball', '25싸인볼', 20000, 'Acc', 'FREE', 2, 40000),
('user04', '배혜민', '25Keyring', '25마스코트키링', 15000, 'Acc', 'FREE', 1, 15000);

SELECT * FROM cart;

drop table cart;


 -- 주문 요약 테이블 

CREATE TABLE IF NOT EXISTS orders ( 
    order_id        INT AUTO_INCREMENT PRIMARY KEY,  -- 주문 고유 번호
    m_id            VARCHAR(10) NOT NULL,            -- 회원 ID
    m_name          VARCHAR(20),                     -- 회원 이름
    order_total     INT NOT NULL,                    -- 전체 결제 금액
    order_date      DATETIME DEFAULT CURRENT_TIMESTAMP  -- 결제 일시
) DEFAULT CHARSET=utf8;

INSERT INTO orders (m_id, m_name, order_total, order_date) VALUES
('user01', '전민기', 218000, '2025-07-03 10:30:00'),
('user02', '김샛별', 109000, '2025-07-03 11:15:00'),
('user03', '이하늘', 40000,  '2025-07-03 12:00:00'),
('user04', '배혜민', 15000,  '2025-07-03 12:45:00');


SELECT * FROM orders;


-- 주문 상세 테이블

CREATE TABLE IF NOT EXISTS order_items ( 
    order_item_id   INT AUTO_INCREMENT PRIMARY KEY,  -- 주문 상세 고유 번호
    order_id        INT NOT NULL,                    -- 연결된 주문 ID
    i_id            VARCHAR(10) NOT NULL,            -- 상품 ID
    i_name          VARCHAR(20),                     -- 상품 이름
    i_unitPrice     INT NOT NULL,                    -- 단가
    i_size          VARCHAR(10),                     -- 사이즈
    i_quantity      INT NOT NULL,                    -- 수량
    item_total      INT                              -- 소계 (단가 × 수량)
) DEFAULT CHARSET=utf8;


-- 주문 ID 1번 (전민기: 홈유니폼 + 원정유니폼)
INSERT INTO order_items (order_id, i_id, i_name, i_unitPrice, i_size, i_quantity, item_total) VALUES
(1, '25HOME', '25홈유니폼', 109000, 'M', 1, 109000),
(1, '25AWAYS', '25원정유니폼', 109000, 'M', 1, 109000);

-- 주문 ID 2번 (김샛별: 원정유니폼 1개)
INSERT INTO order_items (order_id, i_id, i_name, i_unitPrice, i_size, i_quantity, item_total) VALUES
(2, '25AWAYS', '25원정유니폼', 109000, 'M', 1, 109000);

-- 주문 ID 3번 (이하늘: 싸인볼 2개)
INSERT INTO order_items (order_id, i_id, i_name, i_unitPrice, i_size, i_quantity, item_total) VALUES
(3, '25Ball', '25싸인볼', 20000, 'FREE', 2, 40000);

-- 주문 ID 4번 (배혜민: 키링 1개)
INSERT INTO order_items (order_id, i_id, i_name, i_unitPrice, i_size, i_quantity, item_total) VALUES
(4, '25Keyring', '25마스코트키링', 15000, 'FREE', 1, 15000);

SELECT * FROM order_items;


