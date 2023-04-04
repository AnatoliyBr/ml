show dbs
use globalStudent
db
db.stats()
show collections
db.CARTOON.insert(
{
"CartoonName": "The Lion King",
"Year": 1994,
"Country": "USA",
"Duration": 88,
"FilmDirector": ["Roger Allers", "Rob Minkoff"]
})

db.student.find()
db.student.find().pretty()

db.student.find({age:19})
db.student.find({age:19, name:"Simon"})

db.student.find({age:19},{name:1})
db.student.find({age:19},{name:1,_id:0})
db.student.find({age:19},{name:1,_id:false})

db.student.find({name:/S/})
db.student.find({name:/s/i})
db.student.find({name:/se/i})
db.student.find({surname:/a$/})

db.student.find({name:"Anna"})
db.student.find({name:"Anna", age:25})
db.student.find({surname:/ova/})

db.student.find({age: {$lt:20}})
db.student.find({age: {$eq:20}})
db.student.find({age: {$gt:20, $lt:23}})

db.student.find({$or:[{name:"Simon"},{name:"Anna"}]})
db.student.find({$and:[{name:"Simon"}, {age:{$gt:20}}]})

db.student.find().sort({name:1})
db.student.find().sort({name:-1})
db.student.find().sort({name:-1}).limit(3)
db.student.find().sort({surname:1}).limit(10)
db.student.find().sort({surname:1}).skip(10).limit(5)
db.student.count()
db.student.find({name: "Anna"}).count()
db.student.distinct("name")

db.student.find({surname: "Ivanova"}).count()
db.student.count({surname: "Ivanova"})
db.student.find().sort({name:1})
db.student.find().sort({name:-1}).limit(10)

db.student.update({name: "Eugene", age: 29}, {$set: {age: 30}}, {multi: true})
db.student.update({name: "Tom"}, {$unset: {"left": 1}}, {multi: true})
db.student.update({name: "Tom"}, {$unset: {"salary": 1, "left": 1}}, {multi: true})

db.student.drop()

db.student.createIndex({"name": 1})
db.student.createIndex({"name": 1}, {"unique": true})

db.student.createIndex({"name": 1, "age": 1})
db.system.indexes.find()
db.student.getIndexes()
db.student.dropIndex("name_1")

