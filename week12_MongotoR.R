install.packages("rmongodb")
library(rmongodb)
library(devtools)
install_github(repo = "mongosoup/rmongodb")

mongo <- mongo.create()
mongo

mongo.is.connected(mongo)

#Get all databases of your MongoDB connection:
  
  if(mongo.is.connected(mongo) == TRUE) {
    mongo.get.databases(mongo)
  }

#Get all collections in a specific database of your MongoDB (in this case, the "rmongodb" database)

if(mongo.is.connected(mongo) == TRUE) {
  db <- "data"
  mongo.get.database.collections(mongo, db)
}

coll <- "data.cs"

if(mongo.is.connected(mongo) == TRUE) {
  help("mongo.count")
  mongo.count(mongo, coll)
}

#mongo.find.one to get one document from your collection.

if(mongo.is.connected(mongo) == TRUE) {
  mongo.find.one(mongo, coll)
}

#The command mongo.distinct is going to provide a list of all values for a specific key.

if(mongo.is.connected(mongo) == TRUE) {
  res <- mongo.distinct(mongo, coll, "city")
  head(res, 2)
}

if(mongo.is.connected(mongo) == TRUE) {
  cityone <- mongo.find.one(mongo, coll, '{"city":"COLORADO CITY"}')
  print( cityone )
  mongo.bson.to.list(cityone)
}