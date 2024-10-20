/**
    ch03  : 기본 함수 (SQLite 버전)
**/

-- 문자열 길이 세기 
SELECT LENGTH('HELLO') AS length_hello
      ,LENGTH('HELLO') AS char_length_hello  -- SQLite에서는 LENGTH()로 대체
      ,LENGTH('안녕') AS length_annyung
      ,LENGTH('안녕') AS char_length_annyung;

-- 문자열 붙이기 
SELECT 'DREAMS' || 'COME' || 'TRUE' AS concatenated  -- CONCAT 대신 || 연산자로 문자열 연결
      ,'2023' || '-' || '01' || '-' || '29' AS date_with_dash;  -- CONCAT_WS 대체

-- 문자열 자르기 
SELECT SUBSTR('SQL 수업', 1, 3) AS left_string  -- LEFT는 SUBSTR로 대체
      ,SUBSTR('SQL 수업', -4) AS right_string  -- RIGHT는 음수 인덱스로 대체
      ,SUBSTR('SQL 수업', 2, 5) AS substr_2_5
      ,SUBSTR('SQL 수업', 2) AS substr_2;

-- 문자열 패딩하기 
SELECT printf('%10s', 'SQL') AS lpad_string  -- SQLite에서는 LPAD 직접 지원 없음, printf로 대체 가능
      ,printf('%-5s', 'SQL') || '*' AS rpad_string;  -- RPAD는 직접 지원하지 않으므로 조합으로 구현

-- 문자열 트림하기 
SELECT LENGTH(LTRIM(' SQL ')) AS length_trim_leading
      ,LENGTH(RTRIM(' SQL ')) AS length_trim_trailing
      ,LENGTH(TRIM(' SQL ')) AS length_trim_both;

-- 문자열 트림하기 
SELECT TRIM('abc' FROM 'abcSQLabcabc') AS trim_both
      ,LTRIM('abcSQLabcabc', 'abc') AS trim_leading
      ,RTRIM('abcSQLabcabc', 'abc') AS trim_trailing;

-- 문자열 위치 찾기 
SELECT INSTR('SQL JAVA RUST', 'RUST') AS field_position
      ,INSTR('SQL,JAVA,RUST', 'RUST') AS find_in_set
      ,INSTR('너의 인생을 살아라', '인생') AS instr_position;

-- 문자열 반복 
SELECT REPLACE(HEX(ZEROBLOB(5)), '00', '*') AS repeated_string;  -- REPEAT 대체

-- 문자열 대체  
SELECT REPLACE('010.1234.5678', '.', '-') AS replaced_string;

-- 문자열 역순 정렬 
SELECT REVERSE('OLLEH') AS reversed_string;

-- 숫자 올림, 내림, 반올림, 자르기 
SELECT CEIL(123.56) AS ceiling_value
      ,FLOOR(123.56) AS floor_value
      ,ROUND(123.56) AS rounded_value
      ,ROUND(123.56, 1) AS rounded_value_1
      ,ROUND(123.56, 1) AS truncated_value;  -- SQLite에서는 TRUNC가 없으므로 ROUND로 대체

-- 숫자 절대값 부호화 
SELECT ABS(-120) AS abs_negative
      ,ABS(120) AS abs_positive;

-- 몫과 나머지 
SELECT 103 % 4 AS remainder_mod;

-- 제곱근, 랜덤, 라운드
SELECT 2 * 2 * 2 AS power_result  -- POWER 대신 직접 계산
      ,SQRT(16) AS square_root
      ,RANDOM() AS random_value
      ,ROUND(RANDOM() % 100) AS rounded_random_value;  -- RANDOM 함수는 0에서 RAND_MAX까지의 숫자

-- 현재날짜, 현재 시간
SELECT DATETIME('now') AS current_datetime
      ,DATE('now') AS current_date
      ,TIME('now') AS current_time;

-- 현재날짜에서 년, 월, 일, 시, 분, 초 추출
SELECT DATETIME('now') AS current_datetime
      ,STRFTIME('%Y', 'now') AS year
      ,(CAST(STRFTIME('%m', 'now') AS INTEGER) - 1) / 3 + 1 AS quarter  -- 분기는 직접 계산
      ,STRFTIME('%m', 'now') AS month
      ,STRFTIME('%d', 'now') AS day
      ,STRFTIME('%H', 'now') AS hour
      ,STRFTIME('%M', 'now') AS minute
      ,STRFTIME('%S', 'now') AS second;

-- 날짜 차이 계산 
SELECT DATE('now') AS current_datetime
      ,JULIANDAY('2025-11-20') - JULIANDAY('now') AS date_diff
      ,JULIANDAY('now') - JULIANDAY('2025-11-20') AS reverse_date_diff;

-- 현재 날짜에서 이후 날짜 계산 
SELECT DATETIME('now', '+20 days') AS date_plus_20_days
      ,DATETIME('now', '+20 months') AS date_plus_20_months
      ,DATETIME('now', '-20 hours') AS date_minus_20_hours;

-- 월 말일 계산
SELECT DATE(DATETIME('now', 'start of month', '+1 month', '-1 day')) AS last_day_of_month;

-- CASE WHEN 
SELECT CASE WHEN 12500 * 450 > 5000000 THEN '초과달성' ELSE '미달성' END AS achievement_status;

-- NULLIF, COALESCE
SELECT COALESCE(1, 0) AS ifnull_1
      ,COALESCE(NULL, 0) AS ifnull_null;

-- [문제 1]
SELECT company_name
      ,SUBSTR(company_name, 3) AS cust_company2
      ,phone
      ,REPLACE(SUBSTR(phone, 2), ')', '-') AS phone_number2
FROM customer;

-- [문제 2]
SELECT order_id
      ,unit_price * quantity AS order_amount
      ,ROUND((unit_price * quantity * discount), 0) AS discount_amount
      ,(unit_price * quantity) - ROUND((unit_price * quantity * discount), 0) AS final_order_amount
FROM order_details;

-- [문제 3]
SELECT name
      ,birth_date
      ,STRFTIME('%Y', 'now') - STRFTIME('%Y', birth_date) AS age
      ,hire_date
      ,JULIANDAY('now') - JULIANDAY(hire_date) AS days_since_hired
      ,DATE(hire_date, '+500 days') AS days_after_500
FROM employee;

-- [문제 4]
SELECT contact_name
      ,company_name 
      ,city
      ,CASE WHEN city LIKE '%특별시' OR city LIKE '%광역시' THEN '대도시' ELSE '도시' END AS city_type
      ,mileage
      ,CASE WHEN mileage >= 200 THEN 'VVIP 고객'
            WHEN mileage >= 100 THEN 'VIP 고객'
            ELSE '일반 고객'
       END AS mileage_category
FROM customer;

-- [문제 5]
SELECT order_id
      ,cust_id
      ,order_date
      ,STRFTIME('%Y', order_date) AS order_year
      ,(CAST(STRFTIME('%m', order_date) AS INTEGER) - 1) / 3 + 1 AS order_quarter
      ,STRFTIME('%m', order_date) AS order_month
      ,STRFTIME('%d', order_date) AS order_day
      ,STRFTIME('%w', order_date) AS order_weekday
      ,CASE STRFTIME('%w', order_date) WHEN '0' THEN 'Sunday'
                                        WHEN '1' THEN 'Monday'
                                        WHEN '2' THEN 'Tuesday'
                                        WHEN '3' THEN 'Wednesday'
                                        WHEN '4' THEN 'Thursday'
                                        WHEN '5' THEN 'Friday'
                                        ELSE 'Saturday' END AS order_week
FROM orders;
