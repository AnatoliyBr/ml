SET cartoon:1:name 'SCREAM'
SET cartoon:1:year 2022
SET cartoon:1:views 323233

SET cartoon:2:name 'Spider-Man'
SET cartoon:2:year 2002
SET cartoon:2:views 883380

KEYS *

KEYS cartoon:*

GET cartoon:1:name
GET cartoon:1:year
GET cartoon:1:views

GET cartoon:2:name
GET cartoon:2:year
GET cartoon:2:views

STRLEN cartoon:1:year
GETRANGE cartoon:2:name 7 9
APPEND cartoon:2:name ' 2'

INCR cartoon:2:views
DECR cartoon:2:views
INCRBY cartoon:2:views 10000
DECRBY cartoon:2:views 10000

HSET cartoon:3 name 'SAW'
HGET cartoon:3 name
HMSET cartoon:4 name 'SAW' year 2012 views 2323232
HVALS cartoon:4
HKEYS cartoon:4
HDEL cartoon:4 views

RPUSH user_list 'Ivan'
RPUSH user_list 'Semen'
RPUSH user_list 'Fedor'
RPUSH user_list 'Andrey'
RPUSH user_list 'Kate'

LLEN user_list
RPOP user_list

SADD friends:Anna Ivan, Semen, Fedor, Andrey, Kate
SADD friends:Andrey Ivan, Yuri, Max, Andrey, Alena

SCARD friends:Anna
SMEMBERS friends:Anna

SINTER friends:Anna friends:Andrey
SINTERSTORE common_friends friends:Anna friends:Andrey

SDIFF friends:Anna friends:Andrey
SDIFFSTORE friends:diff_friends friends:Anna friends:Andrey

SUNION friends:Anna friends:Andrey
SUNIONSTORE friends:all_friends friends:Anna friends:Andrey

ZADD friends:Arina 2 Ivan 1 Tolya 3 Sasha 4 Diana 1 Oleg
ZCOUNT friends:Arina 1 3
ZRANK friends:Arina Oleg

EXPIRE friends:Anna 20
TTL friends:Anna
PERSIST friends:Anna
EXPIREAT friends:Anna 1
SETEX user:1:name 300 "Alica"

SADD prime_number 13 3 19 17 11 7 2 5
SORT prime_number
SORT prime_number DESC
SORT prime_number LIMIT 0 5
SORT prime_number LIMIT 2 6

SADD city_set "Moscow" "Saint_Petersburg" "Paris" "Berlin" "Madrid"
SORT city_set LIMIT 2 5 ALPHA

SADD numbers 2 1 7 9 3 6 4 8
SORT numbers
SORT numbers DESC