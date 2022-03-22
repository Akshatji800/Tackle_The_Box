import 'package:tackle_the_box/models/music.dart';

class MusicOperations{
  MusicOperations._(){}
  static List<Music> getMusic() {
    return <Music>[
      Music('Punjabi Beats', 'https://apprecs.org/ios/images/app-icons/256/3b/657442107.jpg', 'Latest Pubjabi Beats'),
      Music('Kerala Hits', 'https://c-cl.cdn.smule.com/rs-s-sf-2/sing_google/performance/cover/cc/da/d652b238-78ad-4fee-a394-5d203aeefc51.jpg', 'Malayalam Movie Songs'),
      Music('Amfoss Podcast', 'https://media.redcircle.com/images/2022/2/1/2/1b6a548c-4fbe-4f47-b57a-bae29d139404_amfoss-podcast-image.jpg', 'amFOSS Talks and Chats'),
      Music('Cocomelon', 'https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/97/45/be/9745be2c-3d52-f91b-17cb-6c2755ef7459/source/256x256bb.jpg', "Kid's Nursery Songs"),

    ];
  }
}