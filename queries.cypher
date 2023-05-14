# 1
MATCH (u:User)-[:Posted]->(t:Tweets)
WHERE toInteger(substring(t.posted, 0, 4)) = 2016
RETURN t.retweet_count AS retweet_count, t.textbody AS text_body, u.screen_name AS screen_name, u.category AS category, u.sub_category AS sub_category
ORDER BY retweet_count DESC
LIMIT 10;


# 2
MATCH (u:User)-[:Posted]->(t:Tweets),(t)<-[:has_tag]-(h:Hashtag)
WHERE toInteger(substring(t.posted, 0, 4)) = 2016 AND u.ofstate <> 'na'
return count(distinct u.ofstate), COLLECT(distinct u.ofstate), toLower(h.hastagname)
order by count(distinct u.ofstate) desc
limit 10;

# 3
MATCH (u:User)-[:Posted]->(t:Tweets), (t) <- [:has_tag]-(h:Hashtag) 
WHERE toLower(h.hastagname) = "iowacaucus" OR  toLower(h.hastagname) = "iacaucus"
WITH DISTINCT u.screen_name AS screen_name, u.ofstate AS state, toInteger(u.numFollowers) AS numFollowers
RETURN screen_name, state
ORDER BY numFollowers DESC;



# 4
MATCH (u:User)
WHERE u.sub_category = 'GOP'
RETURN u.screen_name AS screen_name, u.sub_category AS sub_category, u.numFollowers AS numFollowers
ORDER BY numFollowers DESC
LIMIT 5;

MATCH (u:User)
WHERE u.sub_category = 'democrat'
RETURN u.screen_name AS screen_name, u.sub_category AS sub_category, u.numFollowers AS numFollowers
ORDER BY numFollowers DESC
LIMIT 5;



# 5
MATCH (u:User)-[:Posted]->(t:Tweets),(h:Hashtag)-[:has_tag]->(t:Tweets)
WHERE toLower(u.ofstate) = 'iowa' AND (substring(t.posted,0,7))= '2016-01'
WITH toLower(h.hastagname) AS hashtag_name, COUNT(DISTINCT t.tid) AS num_tweets
ORDER BY num_tweets DESC, hashtag_name
RETURN hashtag_name, num_tweets;


# 6

MATCH (u:User)-[:Posted]->(t:Tweets), (t) <- [:has_tag]-(h:Hashtag) 
WHERE toLower(h.hastagname) = "iowa"
AND (toUpper(u.sub_category) = "GOP" OR toUpper(u.sub_category) = "DEMOCRAT")
AND substring(t.posted, 0, 7) = '2016-02'
RETURN t.textbody, h.hastagname, u.screen_name, u.sub_category
order by t.textbody;

# 7

MATCH (u:User) - [:Posted] -> (t:Tweets), (u) - [:Posted] -> (t2: Tweets), (t2) <- [:has_url] - (url:url) where u.sub_category = "GOP" and substring(t2.posted, 0, 7) = '2016-01' with u.screen_name as screen_name, count(DISTINCT t) as num_tweets, COLLECT(DISTINCT url.url) as urls     order by num_tweets desc                 return screen_name, num_tweets, urls

# 8
MATCH (u:User)<-[:Mentioned]-(t:Tweets)
WITH u.screen_name AS user_screen_name, u.numFollowers AS user_followers, count(distinct t.posting_user) AS num_mentions, count(t.tid) as countid
ORDER BY countid DESC
RETURN user_screen_name, user_followers, num_mentions;


# 9
MATCH (u:User )-[:Posted]->(t:Tweets),(t:Tweets)<-[:has_url]-(url:url)
WHERE u.sub_category = 'GOP' AND (substring(t.posted, 0, 7) = '2016-01' or substring(t.posted, 0, 7) = '2016-02' or  substring(t.posted, 0, 7) = '2016-03')
WITH toLower(url.url) AS url, COUNT(DISTINCT t.tid) AS tweetCnt
ORDER BY tweetCnt DESC
RETURN url, tweetCnt
LIMIT 10;