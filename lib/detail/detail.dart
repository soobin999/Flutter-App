import 'dart:typed_data';
import 'dart:wasm';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

List<Uint8List> images = [];

void getPhoto(String photoReference) async {
  var googlePlace;
  var result = await googlePlace.photos.get(photoReference, null, 400);
  print(result);
  if (result != null) {
    images.add(result);
  }
}

class detail extends StatelessWidget {
  final SearchResult resultss;

  const detail({Key key, this.resultss, Future<List<Uint8List>> photoList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결과창'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('식당 이름 : ' + resultss.name),
                  Text(resultss.rating == null
                      ? '평 점 : 리뷰 없음'
                      : '평 점 : ' + resultss.rating.toString()),
                  Text(resultss.businessStatus == null
                      ? '폐점 여부 : 정보 없음'
                      : '폐점 여부 : ' + resultss.businessStatus),
                  Text(resultss.openingHours == null
                      ? '오픈 여부 : 정보 없음'
                      : resultss.openingHours.openNow == true
                          ? '오픈 여부 : OPEN'
                          : '오픈 여부 : CLOSE'),
                  Text(resultss.userRatingsTotal == null
                      ? '총 평가 인원 : 리뷰없음'
                      : '총 평가 인원: ' + resultss.userRatingsTotal.toString()),
                  Text('타입 : ' + resultss.types[0]),
                  Text(resultss.openingHours == null
                      ? '주중 : 정보없음'
                      : '주중 : ' + resultss.openingHours.weekdayText.toString()),
                  Text('주소 : ' + resultss.formattedAddress.toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
