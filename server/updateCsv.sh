#!/bin/sh
reformat_database="ALTER DATABASE trendwave CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;"
reformat_table="ALTER TABLE FB_Sentiments CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# Steps one and two remove the contents of the FB_Sentiments table in the trendwave database
stepone="use trendwave;"
steptwo="truncate table FB_Sentiments;"

# The CSV files (which contain the scraped news data from Facebook) are loaded into MySQL
load1="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/cnn_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load2="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/huffingtonpost_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load3="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/FoxNews_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load4="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/bbcnews_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load5="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/NPR_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load6="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/EntertainmentTonight_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load7="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/enews_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load8="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/nytimes_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load9="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/PopSci_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load10="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/time_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load11="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/TMZ_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load12="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/usatoday_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load13="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/UsWeekly_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load14="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/wsj_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load15="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/yahoonews_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load16="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/ABCNews_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load17="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/NBCNews_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load18="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/washingtonpost_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load19="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/theguardian_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load20="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/PopSugar_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load21="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/EntertainmentTonight_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load22="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/InTouchWeekly_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load23="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/entertainmentweekly_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load24="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/Cosmopolitan_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load25="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/peoplemag_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load26="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/BuzzFeed_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load27="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/Gawker_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"
load28="LOAD DATA LOCAL INFILE '/home/ec2-user/Project-T2/server/facebookScraper/Esquire_facebook_statuses.csv' INTO TABLE FB_Sentiments FIELDS TERMINATED BY ','  ENCLOSED BY '\"' IGNORE 1 ROWS;"

# The following code runs the actual bash scripts seen above
mysql -u root -pcake << eof
$stepone
$steptwo
$load1
$load2
$load3
$load4
$load5
$load6
$load7
$load8
$load9
$load10
$load11
$load12
$load13
$load15
$load16
$load17
$load18
$load19
$load20
$load21
$load22
$load23
$load24
$load25
$load26
$load27
$load28
eof