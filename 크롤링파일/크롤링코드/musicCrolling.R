.libPaths("D:/R_jw/library")
.libPaths()
install.packages("rvest")
install.packages("RSelenium")
library(rvest)
library(RSelenium)
library(httr) #사진 저장하기 위한 라이브러리

#
#차트에서 앨범 누르고 앨범정보 가져온 뒤, 곡 정보 가져오기
#




#서버 연결
remDr <- remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")

#브라우저 열기
remDr$open()
#브라우저 이동(url조작) - 정적에서 read_html 같음
remDr$navigate("https://www.melon.com/chart/age/index.htm?chartType=YE&chartGenre=KPOP&chartDate=1964")







init <- function() {
  staff <- NULL
  title <- NULL
  lyrics <- NULL
  a<-NULL
  b<-NULL
  number <- 1
  grade <-NULL
    
  year <- NULL
  country_category <- NULL
  country_code <- NULL
  album_type <- NULL
  album_title <- NULL
  creator <- NULL
  release_date <- NULL
  genre <- NULL
  distribution <- NULL
  production <- NULL
  introduction <- NULL
  soundt <- NULL
  soundtrack <- NULL
  title_image <-NULL
  
  content_num <- NULL
  runtime <- NULL
  remake <- NULL
  cast <- NULL
  awards <- NULL
  series <- NULL
  trilogy <- NULL
  amount <- NULL
  
  video <- NULL
  ref_video <- NULL
}



#연도 가져오기
webElem <- remDr$findElements("css", "div.year_list div:nth-child(2) div.select_type05 span.sel_r")
y <- unlist(sapply(webElem, function(x){x$getElementText()}))

#국내 / 해외 가져오기
#conts > div.wrap_tabmenu01.type02 > ul > li.first_child.on > a > span
webElem <- remDr$findElements("css", "div.wrap_tabmenu01.type02 ul li.first_child.on a span")
countrycate <- unlist(sapply(webElem, function(x){ x$getElementText()}))

number <-1

for(chart in 1:36){
  if(number==51){
    webElem <- remDr$findElements("css", "div.paginate.chart_page span a")
    sapply(webElem, function(x){ x$clickElement()})
  }
  
  
  if(countrycate=='국내'){
    country_code <- c(country_code,'한국')
  }else if(countrycate!='국내'){
    country_code <- c(country_code, '-')
  }

  # 차트100에 있는 곡들 중에서 곡 상세 페이지로 이동
  webElem <- remDr$findElements("css",paste("tbody tr:nth-child(",number,") td:nth-child(4) div a span"))
  sapply(webElem, function(x){ x$clickElement() })
  a <- NULL 
  
  # 1. 곡 상세 정보페이지
  #연령 등급
  webElem <- remDr$findElements("css", "div.info div.song_name span span")
  if(length(webElem)>=1){
    grade <- c(grade, "19금")
  } else if(length(webElem)<1){
    grade <- c(grade, "전체")
  }

  #작사,작곡,편곡
  #conts > div.section_prdcr > ul > li:nth-child(for문 변수 값이 들어감) > div.entry
  #곡 정보 페이지에서 작사, 작곡, 편곡 총 인원 수
  staffNum <- remDr$findElements("css", "div.section_prdcr ul li")
  length <- length(staffNum)
  for(num in 1:length(staffNum)){
    webElem <- remDr$findElements("css", paste("div.section_prdcr ul li:nth-child(",num,") div.entry"))
    b <- sapply(webElem, function(x){ x$getElementText()})
    b <- gsub("\n","/",b)
    a <- paste(a,b,"@")
  } #스탭 for문 종료
  staff <- c(staff, a)
  Sys.sleep(1)
  
  
  #제목
  webElem <- remDr$findElements("css", "div.entry div.info div.song_name")
  title <- c(title, unlist(sapply(webElem, function(x){ x$getElementText()})))

  #가수
  #downloadfrm > div > div > div.entry > div.info > div.artist
  #downloadfrm > div > div > div.entry > div.info > div.artist > a > span:nth-child(1)
  webElem <- remDr$findElements("css", "div.info div.artist")
  length(webElem)
  c2 <- NULL
  if(length(webElem)>=2){
    for(i in 1:length(webElem)){
      webElem <- remDr$findElements("css", paste("div.info div.artist a:nth-child(",i,") span:nth-child(1)"))
      c1 <- unlist(sapply(webElem, function(x){ x$getElementText()}))
      c2 <- paste(c2,c1)
    }
    creator <- c(creator, c2)
  }else if(length(webElem)==1){
    creator <- c(creator,unlist(sapply(webElem, function(x){ x$getElementText()})))
  }
  
  
  #발매일
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(4)")
  rd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
  release_date <- c(release_date, rd)
  
  #연도
  rd <- strsplit(rd, fixed=TRUE, split = ".")
  year <- c(year,rd[[1]][1])
  
  
  
  #장르
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  genre <- c(genre,unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #가사
  webElem <- remDr$findElements("css", "#lyricArea > div")
  lyr <- unlist(sapply(webElem, function(x){ x$getElementText()}))
  lyr <- gsub('\n','@',lyr)
  lyrics <- c(lyrics,lyr) 

  
  
  
  #앨범 이미지
  titleimg <- remDr$getPageSource()[[1]]
  titleimg <- read_html(titleimg, encoding = "UTF-8")
  titleimg <- html_node(titleimg, "div.thumb a img")
  titleimg <- html_attr(titleimg, "src")
  title_image <- c(title_image, titleimg)
  

  
  Sys.sleep(1)
  
  
  #2. 앨범 상세 페이지로 이동
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(2) a")
  sapply(webElem, function(x){ x$clickElement()})
  
  #앨범명
  webElem <-remDr$findElements("css", "div.info div.song_name")
  album_title <- c(album_title, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 형태
  webElem <- remDr$findElements("css", "#conts > div.section_info > div > div.entry > div.info > span")
  albumT <- sapply(webElem, function(x){ x$getElementText()})
  albumT <- gsub('\\[', "", albumT)
  albumT <- gsub('\\]', "", albumT)
  album_type <- c(album_type, albumT)
  
  #발매사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  distribution <- c(distribution, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #기획사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(8)")
  production <- c(production, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 소개
  webElem <- remDr$findElements("css", "#d_video_summary > div")
  if(length(webElem)!=0){
    intd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
    intd <- gsub("\"" , "", intd)
    intd <- gsub(",", " / ", intd)
    intd <- gsub("\n", "@", intd)
    introduction <- c(introduction, intd)
  }else if(length(webElem)==0){
    introduction <- c(introduction, "-")
  }
  
  #수록곡
  webElem <- remDr$findElements("css", "td:nth-child(4) div div div:nth-child(1) a")
  st <- sapply(webElem, function(x){ x$getElementText()})
  length <- length(st)
  soundt <- NULL
  for (ST in 1:length) {
    soundt <- paste(soundt, st[ST], "@")
  } #수록곡 정보 for문 종료
  soundtrack <- c(soundtrack,unlist(soundt))
  
  #국내/해외
  country_category <- c(country_category, countrycate)
  
  remDr$executeScript("history.back()") #페이지 뒤로가기 (곡 상세로 이동)
  Sys.sleep(1)
  
  number <- number+1
  remDr$executeScript("history.back()") #페이지 뒤로가기 (차트로 이동)
}
webElem <- remDr$findElements("css", "#conts > div.year_list > div.calendar_prid > button.btn_year.after.next")
sapply(webElem, function(x){ x$clickElement()})



year
length(title_image)
length(year)
length(release_date)
length(genre)
length(title)
length(creator)
length(introduction)
length(country_category)
length(production)
length(distribution)
length(staff) 
length(lyrics)
length(album_title)
length(album_type)
length(soundtrack)


musicSAVE <- data.frame(year, release_date, genre, grade, title, creator,introduction, country_category, country_code, production, distribution, grade,staff,lyrics, album_title, album_type, soundtrack)
write.csv(musicSAVE,"D:\\R_jw\\musicSAVE.csv")



#
# 2020년 1~5월 차트
#
remDr$navigate("https://www.melon.com/chart/index.htm?dayTime=2020062416")

#연도 가져오기
y <- '2020'

#국내 / 해외 가져오기
countrycate <- '국내'

number <- 1

for(chart in 1:100){
  if(number==51){
    webElem <- remDr$findElements("css", "#tb_list > div > span > a")
    sapply(webElem, function(x){ x$clickElement()})
  }
  
  if(countrycate=='국내'){
    country_code <- c(country_code,'한국')
  }else if(countrycate!='국내'){
    country_code <- c(country_code, '-')
  }
  
  # 차트100에 있는 곡들 중에서 곡 상세 페이지로 이동
  #lst50 > td:nth-child(5) > div > a
  webElem <- remDr$findElements("css",paste("tbody tr:nth-child(",number,") td:nth-child(5) div a"))
  sapply(webElem, function(x){ x$clickElement() })
  a <- NULL 
  
  # 1. 곡 상세 정보페이지
  #연령 등급
  webElem <- remDr$findElements("css", "div.info div.song_name span span")
  if(length(webElem)>=1){
    grade <- c(grade, "19금")
  } else if(length(webElem)<1){
    grade <- c(grade, "전체")
  }
  
  #작사,작곡,편곡
  #곡 정보 페이지에서 작사, 작곡, 편곡 총 인원 수
  staffNum <- remDr$findElements("css", "div.section_prdcr ul li")
  length <- length(staffNum)
  for(num in 1:length(staffNum)){
    webElem <- remDr$findElements("css", paste("div.section_prdcr ul li:nth-child(",num,") div.entry"))
    b <- sapply(webElem, function(x){ x$getElementText()})
    b <- gsub("\n","/",b)
    a <- paste(a,b,"@")
  } #스탭 for문 종료
  staff <- c(staff, a)
  Sys.sleep(1)
  
  
  #제목
  webElem <- remDr$findElements("css", "div.entry div.info div.song_name")
  title <- c(title, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #가수
  webElem <- remDr$findElements("css", "div.info div.artist")
  length(webElem)
  c2 <- NULL
  if(length(webElem)>=2){
    for(i in 1:length(webElem)){
      webElem <- remDr$findElements("css", paste("div.info div.artist a:nth-child(",i,") span:nth-child(1)"))
      c1 <- unlist(sapply(webElem, function(x){ x$getElementText()}))
      c2 <- paste(c2,c1)
    }
    creator <- c(creator, c2)
  }else if(length(webElem)==1){
    creator <- c(creator,unlist(sapply(webElem, function(x){ x$getElementText()})))
  }
  
  #발매일
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(4)")
  rd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
  release_date <- c(release_date, rd)
  
  #연도
  rd <- strsplit(rd, fixed=TRUE, split = ".")
  year <- c(year,rd[[1]][1])
  
  #장르
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  genre <- c(genre,unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #가사
  webElem <- remDr$findElements("css", "#lyricArea > div")
  lyr <- unlist(sapply(webElem, function(x){ x$getElementText()}))
  lyr <- gsub('\n','@',lyr)
  lyrics <- c(lyrics,lyr) 
  
  #앨범 이미지
  titleimg <- remDr$getPageSource()[[1]]
  titleimg <- read_html(titleimg, encoding = "UTF-8")
  titleimg <- html_node(titleimg, "div.thumb a img")
  titleimg <- html_attr(titleimg, "src")
  title_image <- c(title_image, titleimg)
  
  
  
  Sys.sleep(1)
  
  
  
  #2. 앨범 상세 페이지로 이동
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(2) a")
  sapply(webElem, function(x){ x$clickElement()})
  
  #앨범명
  webElem <-remDr$findElements("css", "div.info div.song_name")
  album_title <- c(album_title, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 형태
  webElem <- remDr$findElements("css", "#conts > div.section_info > div > div.entry > div.info > span")
  albumT <- sapply(webElem, function(x){ x$getElementText()})
  albumT <- gsub('\\[', "", albumT)
  albumT <- gsub('\\]', "", albumT)
  album_type <- c(album_type, albumT)
  
  #발매사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  distribution <- c(distribution, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #기획사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(8)")
  production <- c(production, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 소개
  webElem <- remDr$findElements("css", "#d_video_summary > div")
  if(length(webElem)!=0){
    intd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
    intd <- gsub("\"" , "", intd)
    intd <- gsub(",", " / ", intd)
    intd <- gsub("\n", "@", intd)
    introduction <- c(introduction, intd)
  }else if(length(webElem)==0){
    introduction <- c(introduction, "-")
  }
  
  #수록곡
  webElem <- remDr$findElements("css", "td:nth-child(4) div div div:nth-child(1) a")
  st <- sapply(webElem, function(x){ x$getElementText()})
  length <- length(st)
  soundt <- NULL
  for (ST in 1:length) {
    soundt <- paste(soundt, st[ST], "@")
  } #수록곡 정보 for문 종료
  soundtrack <- c(soundtrack,unlist(soundt))
  
  #국내/해외
  country_category <- c(country_category, countrycate)
  
  Sys.sleep(1)
  
  remDr$executeScript("history.back()") #페이지 뒤로가기 (곡 상세로 이동)
  Sys.sleep(1)
  
  number <- number+1
  remDr$executeScript("history.back()") #페이지 뒤로가기 (차트로 이동)
  Sys.sleep(5)
  
}



length(year)
length(release_date)
length(genre)
length(grade)
length(title)
length(creator)
length(introduction)
length(country_category)
length(country_code)
length(production)
length(distribution)
length(staff) 
length(lyrics)
length(album_title)
length(album_type)
length(soundtrack)
length(title_image)



musicSAVE <- data.frame(year, release_date, genre, grade, title, creator,introduction, country_category, country_code, production, distribution,staff,lyrics, album_title, album_type, soundtrack,title_image)
write.csv(musicSAVE,"D:\\R_jw\\musicSAVE.csv")








video <- NULL
ref_video <- NULL


#
# 유튜브 비디오
#

remDr$navigate("https://www.youtube.com/?gl=KR")


for(k in 1:4878){
  
  #키워드 입력창 클릭
  
  webElem <- remDr$findElements("css", "#search")
  sapply(webElem, function(x){ x$clickElement()})
  webElem <- remDr$findElements("css", "div.sbib_b input")
  sapply(webElem, function(x){ x$clearElement()})
  
  keyword <- paste(creator[k],title[k], 'MV')
  
  sapply(webElem, function(x) {
    x$sendKeysToElement(list(keyword))
  })
  

  #검색
  webElem <- remDr$findElements("css", "#search-icon-legacy")
  sapply(webElem, function(x){ x$clickElement()})
  
  webElem <- remDr$getCurrentUrl()
  ref_video <- c(ref_video, unlist(webElem))
  
  Sys.sleep(2)
  
  #동영상 클릭
  webElem <- remDr$findElements("css", "#contents > ytd-video-renderer:nth-child(1)")
  sapply(webElem, function(x){ x$clickElement()})
  
  #동영상 url를 가져와서 링크변환
  webElem <-  remDr$getCurrentUrl()
  vd <- unlist(webElem)
  vd <- strsplit(vd, split = "=")
  video <- c(video,vd[[1]][2])
  
  Sys.sleep(5)
  
  remDr$executeScript("history.back()")
  
}


length(ref_video)
length(video)

category <-NULL
for(j in 1:4878){
  category <- c(category, '음악')  
}

length(category)



#
# 수상내역, 판매량, 리메이크 (일단 -)
#
amount <-NULL
awards <- NULL
remake <-NULL
for(op in 1:4878){
  amount <- c(amount, "-")
  awards <- c(awards, "-")
  remake <- c(remake, "-")
}
length(amount)
length(awards)
length(remake)



#csv 저장 (컬럼 23개)
musicKOR <- data.frame(year, release_date, genre, title, creator, title_image, country_category, country_code,video,
                    production, distribution, grade,remake, staff, awards, lyrics, album_title, album_type, soundtrack,
                    amount, ref_video, category,introduction)
write.csv(musicKOR,"D:\\R_jw\\musicKOR.csv")




#
# DB 연결
#
install.packages("DBI")
install.packages("RJDBC")
install.packages("xlsx")



library(DBI)

#over heap 떴을 때
options(java.parameters = "-Xmx8g")
library(RJDBC)
options(Java.parameters = c("-XX:+UseConcMarkSweepGC", "-Xmx8192m"))
library(xlsx)


#1단계 오라클 드라이버 연결
drv <- JDBC("oracle.jdbc.driver.OracleDriver", "D:/R_jw/ojdbc6.jar")

#2단계 DB 연결
conn <- dbConnect(drv, "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl", "class25", "class25")

#3단계 : 쿼리문 작성

insert <- "insert into CS_music(content_num, year, release_date, category, genre, title, creator, title_image, country_category,
country_name, video, production, distribution, grade, remake, staff, awards, album_title,
album_type, amount, ref_video,introduction, lyrics,soundtrack)
values(CS_music_seq.NEXTVAL, ?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,?,
?,?,?,?,?)"

#테이블 데이터 추가 / 수정/ 삭제
dbSendUpdate(conn, insert, musicKOR$year, musicKOR$release_date, musicKOR$category, musicKOR$genre, musicKOR$title, musicKOR$creator, musicKOR$title_image, musicKOR$country_category,
             musicKOR$country_code, musicKOR$video, musicKOR$production, musicKOR$distribution, musicKOR$grade, musicKOR$remake, musicKOR$staff, musicKOR$awards,  musicKOR$album_title,
             musicKOR$album_type, musicKOR$amount, musicKOR$ref_video, musicKOR$introduction,musicKOR$lyrics, musicKOR$soundtrack)


#4단계 : 연결 종료
dbDisconnect(conn)




























#
# 해외 음악 크롤링 (1964 ~ 2020)
#

staffEN <- NULL
titleEN <- NULL
lyricsEN <- NULL
a<-NULL
b<-NULL
number <- 1
gradeEN <-NULL

yearEN <- NULL
country_categoryEN <- NULL
country_codeEN <- NULL
album_typeEN <- NULL
album_titleEN <- NULL
creatorEN <- NULL
release_dateEN <- NULL
genreEN <- NULL
distributionEN <- NULL
productionEN <- NULL
introductionEN <- NULL
soundt <- NULL
soundtrackEN <- NULL
title_imageEN <-NULL

content_numEN <- NULL
runtimeEN <- NULL
remakeEN <- NULL
castEN <- NULL
awardsEN <- NULL
seriesEN <- NULL
trilogyEN <- NULL
amountEN <- NULL

videoEN <- NULL
ref_videoEN <- NULL




remDr$navigate("https://www.melon.com/chart/age/index.htm?chartType=YE&chartGenre=POP&chartDate=2015")



#연도 가져오기
webElem <- remDr$findElements("css", "div.year_list div:nth-child(2) div.select_type05 span.sel_r")
y <- unlist(sapply(webElem, function(x){x$getElementText()}))

#국내 / 해외 가져오기
webElem <- remDr$findElements("css", "#conts > div.wrap_tabmenu01.type02 > ul > li.last-child.on > a > span")
countrycate <- unlist(sapply(webElem, function(x){ x$getElementText()}))


chartlength <- 0
webElem <- remDr$findElements("css", "#lst50")
chartlength <- chartlength + length(webElem)
#tb_list > div > span > a
webElem <- remDr$findElements("css", "div.paginate.chart_page span a")
sapply(webElem, function(x){ x$clickElement()})
webElem <- remDr$findElements("css", "#lst50")
chartlength <- chartlength + length(webElem)
remDr$executeScript("history.back()")

number <-1
for(chart in 1:chartlength){
  if(number==51){
    webElem <- remDr$findElements("css", "div.paginate.chart_page span a")
    sapply(webElem, function(x){ x$clickElement()})
  }
  
  if(countrycate=='국내'){
    country_codeEN <- c(country_codeEN,'한국')
  }else if(countrycate!='국내'){
    country_codeEN <- c(country_codeEN, '미국')
  }
  
  # 차트100에 있는 곡들 중에서 곡 상세 페이지로 이동
  webElem <- remDr$findElements("css",paste("tbody tr:nth-child(",number,") td:nth-child(4) div a span"))
  sapply(webElem, function(x){ x$clickElement() })
  a <- NULL 
  
  # 1. 곡 상세 정보페이지
  #연령 등급
  webElem <- remDr$findElements("css", "div.info div.song_name span span")
  if(length(webElem)>=1){
    gradeEN <- c(gradeEN, "19금")
  } else if(length(webElem)<1){
    gradeEN <- c(gradeEN, "전체")
  }
  
  #작사,작곡,편곡
  staffNum <- remDr$findElements("css", "div.section_prdcr ul li")
  length <- length(staffNum)
  if(length(staffNum)==0){
    a<-c("-")
  }else if(length(staffNum)!=0){
    for(num in 1:length(staffNum)){
      webElem <- remDr$findElements("css", paste("div.section_prdcr ul li:nth-child(",num,") div.entry"))
      b <- sapply(webElem, function(x){ x$getElementText()})
      b <- gsub("\n","/",b)
      a <- paste(a,b,"@")
    } #스탭 for문 종료
  }
  staffEN <- c(staffEN, a)
  Sys.sleep(2)
  
  
  #제목
  webElem <- remDr$findElements("css", "div.entry div.info div.song_name")
  titleEN <- c(titleEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #가수
  webElem <- remDr$findElements("css", "div.info div.artist")
  length(webElem)
  c2 <- NULL
  if(length(webElem)>=2){
    for(i in 1:length(webElem)){
      webElem <- remDr$findElements("css", paste("div.info div.artist a:nth-child(",i,") span:nth-child(1)"))
      c1 <- unlist(sapply(webElem, function(x){ x$getElementText()}))
      c2 <- paste(c2,c1)
    }
    creatorEN <- c(creatorEN, c2)
  }else if(length(webElem)==1){
    creatorEN <- c(creatorEN,unlist(sapply(webElem, function(x){ x$getElementText()})))
  }
  
  
  #발매일
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(4)")
  rd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
  release_dateEN <- c(release_dateEN, rd)
  
  #연도
  rd <- strsplit(rd, fixed=TRUE, split = ".")
  yearEN <- c(yearEN,rd[[1]][1])
  
  #장르
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  genreEN <- c(genreEN,unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #가사
  webElem <- remDr$findElements("css", "#d_video_summary")
  if(length(webElem)>0){
    lyr <- unlist(sapply(webElem, function(x){ x$getElementText()}))
    lyr <- gsub('\n','@',lyr)
    lyricsEN <- c(lyricsEN,lyr)
  }else if(length(webElem)==0){
    lyricsEN <- c(lyricsEN,"[가사 준비중]")
  }
  
  #앨범 이미지
  titleimg <- remDr$getPageSource()[[1]]
  titleimg <- read_html(titleimg, encoding = "UTF-8")
  titleimg <- html_node(titleimg, "div.thumb a img")
  titleimg <- html_attr(titleimg, "src")
  title_imageEN <- c(title_imageEN, titleimg)
  
  Sys.sleep(1)
  
  
  
  #2. 앨범 상세 페이지로 이동
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(2) a")
  sapply(webElem, function(x){ x$clickElement()})
  
  #앨범명
  webElem <-remDr$findElements("css", "div.info div.song_name")
  album_titleEN <- c(album_titleEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 형태
  webElem <- remDr$findElements("css", "#conts > div.section_info > div > div.entry > div.info > span")
  albumT <- sapply(webElem, function(x){ x$getElementText()})
  albumT <- gsub('\\[', "", albumT)
  albumT <- gsub('\\]', "", albumT)
  album_typeEN <- c(album_typeEN, albumT)
  
  #발매사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  distributionEN <- c(distributionEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  Sys.sleep(1)
  
  #기획사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(8)")
  productionEN <- c(productionEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 소개
  webElem <- remDr$findElements("css", "#d_video_summary > div")
  if(length(webElem)!=0){
    intd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
    intd <- gsub("\"" , "", intd)
    intd <- gsub(",", " / ", intd)
    intd <- gsub("\n", "@", intd)
    introductionEN <- c(introductionEN, intd)
  }else if(length(webElem)==0){
    introductionEN <- c(introductionEN, "-")
  }
  
  #수록곡
  webElem <- remDr$findElements("css", "td:nth-child(4) div div div:nth-child(1) a")
  st <- sapply(webElem, function(x){ x$getElementText()})
  length <- length(st)
  soundt <- NULL
  for (ST in 1:length) {
    soundt <- paste(soundt, st[ST], "@")
  } #수록곡 정보 for문 종료
  soundtrackEN <- c(soundtrackEN,unlist(soundt))
  
  #국내/해외
  country_categoryEN <- c(country_categoryEN, countrycate)
  
  remDr$executeScript("history.back()") #페이지 뒤로가기 (곡 상세로 이동)
  Sys.sleep(1)
  
  number <- number+1
  remDr$executeScript("history.back()") #페이지 뒤로가기 (차트로 이동)
  Sys.sleep(4)
}

webElem <- remDr$findElements("css", "#conts > div.year_list > div.calendar_prid > button.btn_year.after.next")
sapply(webElem, function(x){ x$clickElement()})

musicENSAVE <- data.frame(year, release_date, genre, grade, title, creator,introduction, country_category, country_code, production, distribution,staff,lyrics, album_title, album_type, soundtrack,title_image)
write.csv(musicENSAVE,"D:\\R_jw\\musicENSAVE.csv")

yearEN
length(title_imageEN)
length(yearEN)
length(release_dateEN)
length(genreEN) #
length(gradeEN) 
length(titleEN[4])
length(creatorEN[347])
length(introductionEN)
length(country_categoryEN)
length(productionEN)
length(distributionEN)
length(staffEN) #
length(lyricsEN)
length(album_titleEN)
length(album_typeEN)
length(soundtrackEN)
length(country_codeEN) #


#2020년 해외 음악
chartlength <- 0
webElem <- remDr$findElements("css", "#lst50")
chartlength <- chartlength + length(webElem)
webElem <- remDr$findElements("css", "#tb_list > div > span > a")
sapply(webElem, function(x){ x$clickElement()})
webElem <- remDr$findElements("css", "#lst50")
chartlength <- chartlength + length(webElem)
remDr$executeScript("history.back()")

number <-1
for(chart in 1:chartlength){
  if(number==51){
    webElem <- remDr$findElements("css", "#tb_list > div > span > a")
    sapply(webElem, function(x){ x$clickElement()})
  }
  Sys.sleep(2)
  
  if(countrycate=='국내'){
    country_codeEN <- c(country_codeEN,'한국')
  }else if(countrycate!='국내'){
    country_codeEN <- c(country_codeEN, '미국')
  }
  
  # 차트100에 있는 곡들 중에서 곡 상세 페이지로 이동
  webElem <- remDr$findElements("css",paste("tbody tr:nth-child(",number,") td:nth-child(5) div a"))
  sapply(webElem, function(x){ x$clickElement() })
  a <- NULL 
  
  # 1. 곡 상세 정보페이지
  #연령 등급
  webElem <- remDr$findElements("css", "div.info div.song_name span span")
  if(length(webElem)>=1){
    gradeEN <- c(gradeEN, "19금")
  } else if(length(webElem)<1){
    gradeEN <- c(gradeEN, "전체")
  }
  
  #작사,작곡,편곡
  staffNum <- remDr$findElements("css", "div.section_prdcr ul li")
  length <- length(staffNum)
  if(length(staffNum)==0){
    a<-c("-")
  }else if(length(staffNum)!=0){
    for(num in 1:length(staffNum)){
      webElem <- remDr$findElements("css", paste("div.section_prdcr ul li:nth-child(",num,") div.entry"))
      b <- sapply(webElem, function(x){ x$getElementText()})
      b <- gsub("\n","/",b)
      a <- paste(a,b,"@")
    } #스탭 for문 종료
  }
  staffEN <- c(staffEN, a)
  Sys.sleep(2)
  
  
  #제목
  webElem <- remDr$findElements("css", "div.entry div.info div.song_name")
  titleEN <- c(titleEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #가수
  webElem <- remDr$findElements("css", "div.info div.artist")
  length(webElem)
  c2 <- NULL
  if(length(webElem)>=2){
    for(i in 1:length(webElem)){
      webElem <- remDr$findElements("css", paste("div.info div.artist a:nth-child(",i,") span:nth-child(1)"))
      c1 <- unlist(sapply(webElem, function(x){ x$getElementText()}))
      c2 <- paste(c2,c1)
    }
    creatorEN <- c(creatorEN, c2)
  }else if(length(webElem)==1){
    creatorEN <- c(creatorEN,unlist(sapply(webElem, function(x){ x$getElementText()})))
  }
  
  
  #발매일
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(4)")
  rd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
  release_dateEN <- c(release_dateEN, rd)
  
  #연도
  rd <- strsplit(rd, fixed=TRUE, split = ".")
  yearEN <- c(yearEN,rd[[1]][1])
  
  #장르
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  genreEN <- c(genreEN,unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #가사
  webElem <- remDr$findElements("css", "#d_video_summary")
  if(length(webElem)>0){
    lyr <- unlist(sapply(webElem, function(x){ x$getElementText()}))
    lyr <- gsub('\n','@',lyr)
    lyricsEN <- c(lyricsEN,lyr)
  }else if(length(webElem)==0){
    lyricsEN <- c(lyricsEN,"[가사 준비중]")
  }
  
  #앨범 이미지
  titleimg <- remDr$getPageSource()[[1]]
  titleimg <- read_html(titleimg, encoding = "UTF-8")
  titleimg <- html_node(titleimg, "div.thumb a img")
  titleimg <- html_attr(titleimg, "src")
  title_imageEN <- c(title_imageEN, titleimg)
  
  Sys.sleep(1)
  
  
  
  #2. 앨범 상세 페이지로 이동
  webElem <- remDr$findElements("css", "div.meta dd:nth-child(2) a")
  sapply(webElem, function(x){ x$clickElement()})
  
  #앨범명
  webElem <-remDr$findElements("css", "div.info div.song_name")
  album_titleEN <- c(album_titleEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 형태
  webElem <- remDr$findElements("css", "#conts > div.section_info > div > div.entry > div.info > span")
  albumT <- sapply(webElem, function(x){ x$getElementText()})
  albumT <- gsub('\\[', "", albumT)
  albumT <- gsub('\\]', "", albumT)
  album_typeEN <- c(album_typeEN, albumT)
  
  #발매사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(6)")
  distributionEN <- c(distributionEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  Sys.sleep(1)
  
  #기획사
  webElem <- remDr$findElements("css", "div.meta dl dd:nth-child(8)")
  productionEN <- c(productionEN, unlist(sapply(webElem, function(x){ x$getElementText()})))
  
  #앨범 소개
  webElem <- remDr$findElements("css", "#d_video_summary > div")
  if(length(webElem)!=0){
    intd <- unlist(sapply(webElem, function(x){ x$getElementText()}))
    intd <- gsub("\"" , "", intd)
    intd <- gsub(",", " / ", intd)
    intd <- gsub("\n", "@", intd)
    introductionEN <- c(introductionEN, intd)
  }else if(length(webElem)==0){
    introductionEN <- c(introductionEN, "-")
  }
  
  #수록곡
  webElem <- remDr$findElements("css", "td:nth-child(4) div div div:nth-child(1) a")
  st <- sapply(webElem, function(x){ x$getElementText()})
  length <- length(st)
  soundt <- NULL
  for (ST in 1:length) {
    soundt <- paste(soundt, st[ST], "@")
  } #수록곡 정보 for문 종료
  soundtrackEN <- c(soundtrackEN,unlist(soundt))
  
  #국내/해외
  country_categoryEN <- c(country_categoryEN, countrycate)
  
  remDr$executeScript("history.back()") #페이지 뒤로가기 (곡 상세로 이동)
  Sys.sleep(1)
  
  number <- number+1
  remDr$executeScript("history.back()") #페이지 뒤로가기 (차트로 이동)
  Sys.sleep(4)
}

musicENSAVE <- data.frame(yearEN, release_dateEN, genreEN, gradeEN, titleEN, creatorEN,introductionEN, country_categoryEN, country_codeEN, productionEN, distributionEN, staffEN, lyricsEN, album_titleEN, album_typeEN, soundtrackEN,title_imageEN)
write.csv(musicENSAVE,"D:\\R_jw\\musicENSAVE.csv")


#국적 검색
country_nameEN <- NULL
countryEN <- NULL
remDr$open()
remDr$navigate("https://www.melon.com")
length(creatorEN)
length <- 1
length2 <- 150

for(c in length:length2){
  
  webElem <- remDr$findElements("css", "#top_search")
  sapply(webElem, function(x){ x$clickElement()})
  webElem <- remDr$findElements("css", "#top_search")
  sapply(webElem, function(x){ x$clearElement()})
  
  
  keyword <- creatorEN[c]
  sapply(webElem, function(x) {
    x$sendKeysToElement(list(keyword))
  })
  
  Sys.sleep(1)
  webElem <- remDr$findElements("css", "fieldset > button.btn_icon.search_m")
  sapply(webElem, function(x){ x$clickElement()})
  
  webElem <- remDr$findElements("css", "div.section_atist div.atist_dtl_info dl dd:nth-child(2)")
  if(length(webElem)>0){
    countryEN <- c(countryEN,unlist(sapply(webElem, function(x){ x$getElementText()})))
  }else if(length(webElem)==0){
    countryEN <- c(countryEN, "-")
  }
  Sys.sleep(1)
  remDr$executeScript("history.back()");
}
length(countryEN)
length <- 1+c
length2 <- 150+c
country_nameEN <- c(country_nameEN, countryEN)
length(country_nameEN)
countryEN <- NULL



#
# 유튜브 비디오
#

remDr$navigate("https://www.youtube.com/?gl=KR")

for(k in 1:length(title_imageEN)){
  
  #키워드 입력창 클릭
  webElem <- remDr$findElements("css", "#search")
  sapply(webElem, function(x){ x$clickElement()})
  webElem <- remDr$findElements("css", "div.sbib_b input")
  sapply(webElem, function(x){ x$clearElement()})
  
  keyword <- paste(creatorEN[k],titleEN[k],' MV')
  
  sapply(webElem, function(x) {
    x$sendKeysToElement(list(keyword))
  })
  
  
  #검색
  webElem <- remDr$findElements("css", "#search-icon-legacy")
  sapply(webElem, function(x){ x$clickElement()})
  
  webElem <- remDr$getCurrentUrl()
  ref_videoEN <- c(ref_videoEN, unlist(webElem))
  
  Sys.sleep(2)
  
  #동영상 클릭
  webElem <- remDr$findElements("css", "#contents > ytd-video-renderer:nth-child(1)")
  sapply(webElem, function(x){ x$clickElement()})
  
  #동영상 url를 가져와서 링크변환
  webElem <-  remDr$getCurrentUrl()
  vd <- unlist(webElem)
  vd <- strsplit(vd, split = "=")
  videoEN <- c(videoEN,vd[[1]][2])
  
  Sys.sleep(5)
  
  remDr$executeScript("history.back()")
  
}
length(titleEN)
length(videoEN)

amountEN <-NULL
awardsEN <- NULL
remakeEN <-NULL
categoryEN<-NULL
for(op in 1:3734){
  amountEN <- c(amountEN, "-")
  awardsEN <- c(awardsEN, "-")
  remakeEN <- c(remakeEN, "-")
  categoryEN <- c(categoryEN, "음악")
}
length(category)

#csv 저장 (컬럼 23개)
musicEN <- data.frame(yearEN, release_dateEN, genreEN, titleEN, creatorEN, title_imageEN, country_categoryEN, country_nameEN,videoEN,
                       productionEN, distributionEN, gradeEN,remakeEN, staffEN, awardsEN, lyricsEN, album_titleEN, album_typeEN, soundtrackEN,
                       amountEN, ref_videoEN, categoryEN,introductionEN)
write.csv(musicEN,"D:\\R_jw\\musicEN.csv")


#
# DB 연결
#

library(DBI)

#over heap 떴을 때
options(java.parameters = "-Xmx8g")
library(RJDBC)
options(Java.parameters = c("-XX:+UseConcMarkSweepGC", "-Xmx8192m"))
library(xlsx)


#1단계 오라클 드라이버 연결
drv <- JDBC("oracle.jdbc.driver.OracleDriver", "D:/R_jw/ojdbc6.jar")

#2단계 DB 연결
conn <- dbConnect(drv, "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl", "class25", "class25")

#3단계 : 쿼리문 작성

insert <- "insert into CS_music(content_num, year, release_date, category, genre, title, creator, title_image, country_category,
country_name, video, production, distribution, grade, remake, staff, awards, album_title,
album_type, amount, ref_video,introduction, lyrics,soundtrack)
values(CS_music_seq.NEXTVAL, ?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,?,
?,?,?,?,?)"

#테이블 데이터 추가 / 수정/ 삭제
dbSendUpdate(conn, insert, musicEN$yearEN, musicEN$release_dateEN, musicEN$categoryEN, musicEN$genreEN, musicEN$titleEN, musicEN$creatorEN, musicEN$title_imageEN, musicEN$country_categoryEN,
             musicEN$country_nameEN, musicEN$videoEN, musicEN$productionEN, musicEN$distributionEN, musicEN$gradeEN, musicEN$remakeEN, musicEN$staffEN, musicEN$awardsEN, musicEN$album_titleEN,
             musicEN$album_typeEN, musicEN$amountEN, musicEN$ref_videoEN, musicEN$introductionEN,musicEN$lyricsEN, musicEN$soundtrackEN)


#4단계 : 연결 종료
dbDisconnect(conn)
