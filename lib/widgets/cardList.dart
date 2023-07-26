import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/widgets/individualCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class cardList extends StatefulWidget {
  const cardList({
    super.key,
    required this.heading,
    required this.collectionRef,
  });

  final String heading;
  final CollectionReference collectionRef;

  @override
  State<cardList> createState() => _cardListState();
}

class _cardListState extends State<cardList> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Object?>> getCollectionData() async {
    QuerySnapshot querySnapshot = await widget.collectionRef.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
    // var collectionData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //allData = collectionData;
  }

  @override
  Widget build(BuildContext context) {
    // print('all data: ' + allData);
    var _allData = getCollectionData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.heading,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(color: colorConstants.biziGreen),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: height * 0.32,
          child: FutureBuilder<List<Object?>>(
              future: _allData,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Object?>> snapshot) {
                if (snapshot.hasError) {
                } else if (snapshot.hasData) {
                  var _collectionData = snapshot.data;
                  return ListView.builder(
                    itemCount: _collectionData?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return individualCard();
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ],
    );
  }
}
