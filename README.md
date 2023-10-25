# 마이데이터 기반 간편결제 플랫폼 하나원페이
![hanaOnePayMain.png](/readme_src/hanaOnePayMain.png)

## 프로젝트 정보
- **실습 과제명**: 하나원페이
- **수행 기간**: 2023.09.01 - 2023.10.20
- **참가 인원**: 1명
- **담당 업무**: 프로젝트 기획, 디자인, 설계, 구현 및 인프라 구축

## 사용 기술 및 환경

- **개발 환경**
  ```
    - OS: Window11, Ubuntu Linux 20.04
    - Framework: SpringBoot 2.7.1, Mybatis 2.3.1
    - Cloud: AWS EC2 Cloud
   ```

- **Language/Tool/DB**
  ```
    - Language: Java(11), HTML / CSS / JavaScript
    - Tool: Intellij IDEA 2023.2, SQL Developer
    - Database: Oracle Database 19c
    - VCS: Github
  ```

## 개요 및 목표
### 개요
![outline.png](/readme_src/outline.png)
- 코로나19 이후 비대면 문화가 확산된 가운데 간편결제 서비스 이용은 더 활발해지며 국내 간편 결제 시장이 급성장하는 추세
- 또한 불과 2년 뒤인 2025년에는 간편결제 이용 규모가 카드 이용액의 절반에 달할 것으로 전망
- 이러한 상황에서 손님의 결제 경험에 혁신이 필요하다는 생각을 하게 되며 마이데이터 기반 결제 수단을 연동할 수 있는 간편결제 시스템을 기획
### 목표
- 하나원페이에서는 기존의 카드정보를 직접 입력하는 형식과 카드 이미지를 스캔하는 카드 등록 방식에서 나아가 마이데이터를 활용한 간편한 카드 등록 방법 제시
- 모든 결제 수단에 대한 통합적 관리 서비스를 제공
## 개발 일정
![serviceSchedule.png](/readme_src/serviceSchedule.png)
## 기존 서비스와 차이점
![systemDifference.png](/readme_src/systemDifference.png)

## 특화 기술
### 가상의 OPENAPI 개발 
![mydata.png](/readme_src/mydata.png)
![payment.png](/readme_src/payment.png)
![api.png](/readme_src/api.png)
### 거래수단별 결제 프로세스 개발
![payLogic1.png](/readme_src/payLogic1.png)
![payLogic2.png](/readme_src/payLogic2.png)
### 그 외에 다양한 기술
![etcSkill.png](/readme_src/etcSkill.png)
- Zxing을 활용한 QR 코드 스캔 기술
- Naver CLOVA OCR을 활용한 지류인식
- Simple & Easy Notification Service를 통한 SMS 본인인증
- Spring Scheduler를 활용한 출금 알림 및 자동이체 
- Java Mail Sender를 활용한 메일 송부
- jsPDF를 이용한 pdf 다운로드 

## 주요 기능
![mainSkill.png](/readme_src/mainSkill.png)
- 마이데이터연동: 마이데이터 연동을 통해 결제 수단 간편 등록 

- 간편결제: 카드/계좌를 통한 간편결제 

- 결제수단관리: 내 보유 모든 결제 수단과 거래내역 한 번에 조회 

- 소비패턴분석: 결제내역 기반 소비 패턴 분석 및 소비태그 확인 

- 카드추천: 소비태그와 소비성향 테스트를 통한 카드 추천 

## 서비스 아키텍처
![serviceArchitecture.png](/readme_src/serviceArchitecture.png)

## 시스템 아키텍처
![systemArchitecture.png](/readme_src/systemArchitecture.png)

## ERD
![ERD.png](/readme_src/ERD.png)
## 기대 효과 및 보완점
### 기대효과
- 마이데이터를 활용한 간편한 카드 등록 
- 모든 결제 수단에 대한 정보와 거래내역, 결제 이력 등 확인 가능 

## 발표 자료
[발표자료](./하나원페이.pdf)

## 시연 영상
[시연영상](https://youtu.be/1b35nn0ecFE)


## 자기 소개

| 구분 | 내용 | 비고 |
|------|------|------|
| **이름** | 정주연 | <img src="/readme_src/profile.jpg" width="150"> |
| **연락처** | yeonju_62@naver.com |  |
| **학력 사항** | 한양대학교(ERICA) ICT융합학부 미디어테크놀로지전공 졸업 | 2022. 08 |
| **Frontend skill** | HTML, CSS, Javascript |  |
| **Backend skill** | Java, Python, C, Spring, SpringBoot, Oracle, MySQL, MyBatis |  |
| **ETC** | GIT, AWS | |
| **자격증** | 정보처리기사 | 2022. 11. 25 |
| | SQLD(SQL개발자) | 2022. 04. 08 |
| **어학 능력** | OPIc(IH) | 2022. 12. 04 |
| **교육 활동** | 하나금융티아이 채용전환형 교육 1200시간(한국폴리텍대학교 광명융합기술교육원 - 데이터분석과) |  |
| **경력 사항** | 카카오엔터프라이즈 | 2022. 05 - 2022. 08 (인턴, 4개월) |
| | (주)비디 | 2021. 07 ~ 2021. 08 (인턴, 2개월) |
| **대외/내 활동** | KB국민은행 청년 디지털 서포터즈 | 2021. 12 - 2022. 02 |
