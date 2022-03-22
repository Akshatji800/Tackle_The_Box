import 'package:tackle_the_box/models/rick.dart';

class RickOperations{
  RickOperations._(){}
  static List<Rick> getRick() {
    return <Rick>[
      Rick('Bass Boosts', 'https://wcs.smartdraw.com/chart/img/basic-bar-graph.png', 'Likes : 30M'),
      Rick('Americanos', 'https://i2.wp.com/www.youthesource.com/wp-content/uploads/2019/06/ministering-to-young-people-in-times-of-transition.jpg', 'Likes : 18M'),
      Rick('Tratamiento Beats', 'https://i0.wp.com/revistachilenadeanestesia.cl/wp-content/uploads/2019/09/revchilanestv48n04.08.xml_image4-2.jpeg', 'Likes : 27M'),
      Rick('Stock Song', 'https://4.bp.blogspot.com/-vRuPy_SGLPA/TxL4987oz1I/AAAAAAAAE8w/98jUzZFjRx4/s1600/liv2699-fig-0004.png', 'Likes : 25M'),

    ];
  }
}