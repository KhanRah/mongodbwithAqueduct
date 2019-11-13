import 'package:mongodbdartconnections/mongodbdartconnections.dart';
import 'package:mongo_dart/mongo_dart.dart';
Future main() async {
  Db db=Db('mongodb://khan:khan123@ds237196.mlab.com:37196/flutterproject'); //Mlab link that hosts Mongodb
  await db.open();
  print('Connected to Data Base');

  //Access the Collection to check the documents
  DbCollection Collection=db.collection('OrderDetails');

  //get data from Collections
  var details= await Collection.find().toList();
  print(details);


  // Save document to the DataBase
  await Collection.save(
    {
      "src": "https://cdn.pixabay.com/photo/2014/01/24/04/05/fried-chicken-250863_1280.jpg",
      "name": "King Srk Chicken",
      "price": "229",
      "description": "Marinated with Olives and Juices from the Chicken",
      "size": "Bechamel Sauce",
      "crust": "Electric Grill",
      "mobile": "9963394267",
      "user_name": "KhanSRK",
      "date": {
        "date": "2019-05-02T12:40:08.996Z"
      },
    }
  );
  print('Saved to OrderDetails Collection');

  //Update the document
  await Collection.update(await Collection.findOne(where.eq('mobile', '9963394267')),
      {
        r'$set':{'name':'jhon Wick'}
      });

  print('Updated Person ${await Collection.findOne(where.eq('mobile', '9963394267'))}');

  // To delete a Document
  await Collection.remove(await Collection.findOne(where.eq('mobile', '9963394267')));
  print('Collection Deleted ${await Collection.findOne(where.eq('mobile', '9963394267'))}');
}