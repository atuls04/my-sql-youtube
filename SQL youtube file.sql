use atul;
select * from youtube;
#;ets clean the data 

#remove the column vidoe_id

alter table youtube
drop column video_id; 

alter table youtube
drop column comments_disabled; 

alter table youtube 
drop column ratings_disabled;

# check the most view youtube video 

select title, channelTitle, max(view_count)as maximum_view from youtube
group by title, channelTitle
order by maximum_view desc
limit 5;  

#check the most liked vidoe
select title,channelTitle, max(likes) as maximum_likes from youtube
group by title,channelTitle
order by maximum_likes desc
limit 5; 

#check most commented video 
select title, channelTitle, max(comment_count) as maximum_comments from youtube
group by title, channelTitle
order by maximum_comments desc
limit 5; 

#check most dislike video

select title, channelTitle, max(dislikes) as maximum_dislikes from youtube
group by title, channelTitle
order by maximum_dislikes desc
limit 5; 

describe youtube;
 # change the publishedAt from text to int
 
 select * from youtube


SELECT STR_TO_DATE(publishedAt, "%Y-%m-%dT%H:%i:%sZ") AS converted_date
FROM youtube;

alter table youtube
add column publishedAt_datetime DATETIME; 
 
 UPDATE youtube 
SET publishedAt_datetime = STR_TO_DATE(publishedAt, '%Y-%m-%dT%H:%i:%sZ');

#change the trending column format

select str_to_date(trending_date, "%Y-%m-%dT%H:%i:%sZ") as converted_date from youtube 
alter table youtube
add column Trending_datetime DATETIME; 

update youtube
set Trending_datetime = str_to_date(trending_date, "%Y-%m-%dT%H:%i:%sZ");

#change column names 

alter table youtube
rename column title to Title; 

alter table youtube
rename column channelId to channel_ID; 

alter table youtube
rename column channelTitle to channel_Title; 

alter table youtube
rename column categoryId to category_Id; 

#Top 5 youtube channels on the basis of most view count and likes and comments 

select channel_Title, max(view_count) as maximumview, max(likes) as maximumlikes, max(comment_count) as maximumcomments from youtube
group by channel_Title
order by maximumview desc, maximumlikes desc, maximumcomments desc
limit 5;

select * from youtube; 

#remove the old tables trending_date and publishedAt

alter table youtube
drop column trending_date; 
 
 alter table youtube
 drop column publishedAt;
 
describe youtube; 