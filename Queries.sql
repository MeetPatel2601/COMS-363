USE `Proj_3`;

#1 
select t.retweet_count, t.text_body, t.posting_user, u.category, u.sub_category from tweets t, TwitterUser u where 
	t.posting_user = u.screen_name 
	and t.year_posted = 2016 and t.month_posted = 1
	order by t.retweet_count desc limit 10;
    
#2 
select distinct h.tag_name, count(distinct u.state) as num_states, group_concat(distinct u.state) as states
	from tweets t, hashtag_used h, TwitterUser u where 
	h.tweet_id = t.tweet_id and t.posting_user= u.screen_name and u.state != "na" and SUBSTRING(t.year_posted, 1, 4) = 2016
	group by h.tag_name order by num_states desc limit 10;
#3
select x.screen_name, x.state from (select distinct u.screen_name, u.state, u.followers from TwitterUser u, hashtag_used h, tweets t where 
	h.tweet_id = t.tweet_id and t.posting_user= u.screen_name and h.tag_name in ("iowacaucus","iacaucus")) x
	order by x.followers desc limit 10;
    
#4
SELECT *
FROM(
SELECT tu.screen_name, tu.sub_category, tu.followers
FROM TwitterUser tu
WHERE tu.sub_category = 'GOP'
ORDER BY tu.followers DESC LIMIT 5) as GOP
 UNION(
 SELECT tu.screen_name, tu.sub_category, tu.followers
FROM TwitterUser tu
WHERE tu.sub_category = 'democrat'
ORDER BY tu.followers DESC LIMIT 5
 ); 

#5
SELECT h.tag_name, COUNT(*) AS num_tweets
FROM hashtag_used hu
Join hashtags h ON h.tag_name = hu.tag_name
Join tweets t ON t.tweet_id = hu.tweet_id
Join TwitterUser u ON u.screen_name = t.posting_user
WHERE u.state = 'Iowa' AND t.year_posted = 2016 and t.month_posted = 1
GROUP BY h.tag_name
ORDER BY num_tweets DESC;

#6
SELECT tweets.text_body, hashtag_used.tag_name, TwitterUser.screen_name, TwitterUser.sub_category from tweets
Join TwitterUser on posting_user = screen_name
Join hashtag_used on hashtag_used.tweet_id = tweets.tweet_id
where tag_name = "Iowa" and sub_category in ("democrat", "GOP")and month_posted = 2 and year_posted = 2016
order by text_body; 

#7
WITH tweet_counts AS(
SELECT posting_user, COUNT(tweet_id) AS tweet_count
FROM tweets
GROUP BY posting_user
)
SELECT TwitterUser.screen_name, tweet_counts.tweet_count, GROUP_CONCAT(url_used.url) AS urls_used
FROM TwitterUser
JOIN tweet_counts ON TwitterUser.screen_name = tweet_counts.posting_user
JOIN tweets ON tweet_counts.posting_user = tweets.posting_user
JOIN url_used ON tweets.tweet_id= url_used.tweet_id
WHERE TwitterUser.sub_category = 'GOP' AND month_posted= 1 AND year_posted= 2016
GROUP BY TwitterUser.screen_name, tweet_counts.tweet_count
ORDER BY tweet_counts.tweet_count DESC;

#8
SELECT u.screen_name, u.followers, COUNT(DISTINCT tm.tweet_id) AS num_posting_users
FROM TwitterUser u
JOIN tweet_mentions tm ON u.screen_name = tm.screen_name
GROUP BY u.screen_name, u.followers
ORDER BY COUNT(DISTINCT tm.tweet_id) DESC
LIMIT 10;



#9

SELECT url_used.url, COUNT(url_used.tweet_id) AS url_count
FROM url_used
JOIN tweets ON url_used.tweet_id = tweets.tweet_id
JOIN TwitterUser ON tweets.posting_user=TwitterUser.screen_name
WHERE TwitterUser.sub_category='GOP' AND tweets.year_posted =2016 AND tweets.month_posted IN (1, 2, 3)
GROUP BY url_used.url
ORDER BY url_count DESC
LIMIT 10;

