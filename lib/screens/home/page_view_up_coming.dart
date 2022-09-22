import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';

var listUpComing = [
  {
    "adult": false,
    "backdrop_path": "/2RSirqZG949GuRwN38MYCIGG4Od.jpg",
    "genre_ids": [53],
    "id": 985939,
    "original_language": "en",
    "original_title": "Fall",
    "overview":
        "For best friends Becky and Hunter, life is all about conquering fears and pushing limits. But after they climb 2,000 feet to the top of a remote, abandoned radio tower, they find themselves stranded with no way down. Now Becky and Hunter’s expert climbing skills will be put to the ultimate test as they desperately fight to survive the elements, a lack of supplies, and vertigo-inducing heights",
    "popularity": 6824.053,
    "poster_path": "/spCAxD99U1A6jsiePFoqdEcY0dG.jpg",
    "release_date": "2022-08-11",
    "title": "Fall",
    "video": false,
    "vote_average": 7.4,
    "vote_count": 753
  },
  {
    "adult": false,
    "backdrop_path": "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg",
    "genre_ids": [16, 878, 28],
    "id": 610150,
    "original_language": "ja",
    "original_title": "ドラゴンボール超 スーパーヒーロー",
    "overview":
        "The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family.",
    "popularity": 2976.814,
    "poster_path": "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg",
    "release_date": "2022-06-11",
    "title": "Dragon Ball Super: Super Hero",
    "video": false,
    "vote_average": 8,
    "vote_count": 1667
  },
  {
    "adult": false,
    "backdrop_path": "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg",
    "genre_ids": [27, 53],
    "id": 760161,
    "original_language": "en",
    "original_title": "Orphan: First Kill",
    "overview":
        "After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.",
    "popularity": 1573.405,
    "poster_path": "/wSqAXL1EHVJ3MOnJzMhUngc8gFs.jpg",
    "release_date": "2022-07-27",
    "title": "Orphan: First Kill",
    "video": false,
    "vote_average": 7.1,
    "vote_count": 622
  },
  {
    "adult": false,
    "backdrop_path": "/14QbnygCuTO0vl7CAFmPf1fgZfV.jpg",
    "genre_ids": [28, 12, 878],
    "id": 634649,
    "original_language": "en",
    "original_title": "Spider-Man: No Way Home",
    "overview":
        "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
    "popularity": 1098.544,
    "poster_path": "/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg",
    "release_date": "2021-12-15",
    "title": "Spider-Man: No Way Home",
    "video": false,
    "vote_average": 8,
    "vote_count": 15158
  },
  {
    "adult": false,
    "backdrop_path": "/rwgmDkIEv8VjAsWx25ottJrFvpO.jpg",
    "genre_ids": [10749, 18],
    "id": 744276,
    "original_language": "en",
    "original_title": "After Ever Happy",
    "overview":
        "As a shocking truth about a couple's families emerges, the two lovers discover they are not so different from each other. Tessa is no longer the sweet, simple, good girl she was when she met Hardin — any more than he is the cruel, moody boy she fell so hard for.",
    "popularity": 913.358,
    "poster_path": "/6b7swg6DLqXCO3XUsMnv6RwDMW2.jpg",
    "release_date": "2022-08-24",
    "title": "After Ever Happy",
    "video": false,
    "vote_average": 6.4,
    "vote_count": 65
  },
  {
    "adult": false,
    "backdrop_path": "/fQ5sZ6frXiAZuufgkVJnDwFFUQ4.jpg",
    "genre_ids": [53],
    "id": 948333,
    "original_language": "en",
    "original_title": "Into the Deep",
    "overview":
        "Follows a woman desperate to escape her town, she meets a stranger who promises a romantic escape, but it results in deceit, mistrust, and violence.",
    "popularity": 522.007,
    "poster_path": "/bPyBqGBYjGzyLVHJEIsCwlZejk.jpg",
    "release_date": "2022-08-26",
    "title": "Into the Deep",
    "video": false,
    "vote_average": 7,
    "vote_count": 14
  }
];

class BuildPageViewUpComing extends StatelessWidget {
  const BuildPageViewUpComing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: Swiper(
          pagination: const SwiperPagination(alignment: Alignment(0, 1.5)),
          itemBuilder: (BuildContext context, int index) {
            return buildCardUpComing(context, index);
          },
          itemCount: listUpComing.length,
          viewportFraction: 0.38,
          scale: 1,
          fade: 0.2),
    );
  }

  Widget buildCardUpComing(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // do something
          return const MovieDetai();
        }))
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
              '${AppConfigs.baseUrlImg}${listUpComing[index]['poster_path']}',
              fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
