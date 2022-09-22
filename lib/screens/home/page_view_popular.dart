import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';

var listMovie = [
  {
    "adult": false,
    "backdrop_path": "/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg",
    "id": 616037,
    "title": "Thor: Love and Thunder",
    "original_language": "en",
    "original_title": "Thor: Love and Thunder",
    "overview":
        "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.",
    "poster_path": "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg",
    "media_type": "movie",
    "genre_ids": [14, 28, 35],
    "popularity": 2804.415,
    "release_date": "2022-07-06",
    "video": false,
    "vote_average": 6.801,
    "vote_count": 3563
  },
  {
    "adult": false,
    "backdrop_path": "/yWRvAfZmbzk61REYod4WQACDhRj.jpg",
    "id": 762968,
    "title": "Do Revenge",
    "original_language": "en",
    "original_title": "Do Revenge",
    "overview":
        "A dethroned queen bee at a posh private high school strikes a secret deal with an unassuming new student to enact revenge on one another’s enemies.",
    "poster_path": "/akIjKJDHcVN4bzifcEarKVPNpoa.jpg",
    "media_type": "movie",
    "genre_ids": [35],
    "popularity": 341.613,
    "release_date": "2022-09-14",
    "video": false,
    "vote_average": 7.0,
    "vote_count": 145
  },
  {
    "adult": false,
    "backdrop_path": "/aCaqCvYn48b3lfGKGnUdVAE1yeB.jpg",
    "id": 814800,
    "title": "Goodnight Mommy",
    "original_language": "en",
    "original_title": "Goodnight Mommy",
    "overview":
        "When twin brothers arrive home to find their mother’s demeanor altered and face covered in surgical bandages, they begin to suspect the woman beneath the gauze might not be their mother.",
    "poster_path": "/oHhD5jD4S5ElPNNFCDKXJAzMZ5h.jpg",
    "media_type": "movie",
    "genre_ids": [27, 18, 53],
    "popularity": 251.832,
    "release_date": "2022-09-16",
    "video": false,
    "vote_average": 5.885,
    "vote_count": 61
  },
  {
    "adult": false,
    "backdrop_path": "/yo0qfH2dQGGMxkfivdkz5zxVatD.jpg",
    "id": 830788,
    "title": "The Invitation",
    "original_language": "en",
    "original_title": "The Invitation",
    "overview":
        "After the death of her mother, Evie is approached by an unknown cousin who invites her to a lavish wedding in the English countryside. Soon, she realizes a gothic conspiracy is afoot and must fight for survival as she uncovers twisted secrets in her family’s history.",
    "poster_path": "/jcTq6gIskCsHlKDvCKKouEfiU66.jpg",
    "media_type": "movie",
    "genre_ids": [27, 53],
    "popularity": 232.263,
    "release_date": "2022-08-24",
    "video": false,
    "vote_average": 6.019,
    "vote_count": 81
  },
  {
    "adult": false,
    "backdrop_path": "/odJ4hx6g6vBt4lBWKFD1tI8WS4x.jpg",
    "id": 361743,
    "title": "Top Gun: Maverick",
    "original_language": "en",
    "original_title": "Top Gun: Maverick",
    "overview":
        "After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.",
    "poster_path": "/62HCnUTziyWcpDaBO2i1DX17ljH.jpg",
    "media_type": "movie",
    "genre_ids": [28, 18],
    "popularity": 1589.101,
    "release_date": "2022-05-24",
    "video": false,
    "vote_average": 8.365,
    "vote_count": 3843
  },
];

Widget buildPageViewPopular(double sizeHeight) {
  return Container(
    height: sizeHeight * 0.18,
    padding: const EdgeInsets.symmetric(vertical: 15),
    width: double.infinity,
    child: Swiper(
        pagination: const SwiperPagination(alignment: Alignment(0, 1.9)),
        itemBuilder: (BuildContext context, int index) {
          return cardPopular(context, index);
        },
        itemCount: listMovie.length,
        viewportFraction: 0.75,
        scale: 0.85,
        fade: 0.5),
  );
}

Widget cardPopular(
  BuildContext context,
  int index,
) {
  return GestureDetector(
    onTap: () => {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MovieDetai();
      }))
    },
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(
              '${AppConfigs.baseUrlImg}${listMovie[index]['poster_path']}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Color(0xff121212)
              ]),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 26, bottom: 15, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${listMovie[index]['title']}',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.whiteS18Bold,
                ),
              ),
              Container(
                height: 14,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/imgs/imdb.png',
                      height: 5,
                    ),
                    Text(
                      '8.5',
                      style: AppTextStyle.blackS6Bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
