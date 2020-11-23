
import 'package:socialite/CommentModal.dart';
import 'package:socialite/FeedModal.dart';
import 'package:socialite/StoryModal.dart';

class DataList{

  static List<StoryModal>getStoryList(){
    List<StoryModal> storyList = new List();
    StoryModal storyModal = StoryModal('http://demo.foxthemes.net/socialitehtml/assets/images/avatars/avatar-lg-1.jpg', 'http://demo.foxthemes.net/socialitehtml/assets/images/avatars/avatar-lg-3.jpg',
        'Jonathan');
    storyList.add(storyModal);
    StoryModal storyModal1 = StoryModal('http://demo.foxthemes.net/socialitehtml/assets/images/events/listing-5.jpg','https://www.somagnews.com/wp-content/uploads/2020/09/v_bts_kim_taehyun_club_de_fans_china_record.png_793492074-e1601399938658.png',
        'Stella');
    storyList.add(storyModal1);
    StoryModal storyModal2 = StoryModal('https://media4.s-nbcnews.com/j/newscms/2019_45/3082841/191104-jungkook-bts-cs-1022a_07aaee52b9a979bada7386d8b5934c84.nbcnews-fp-1024-512.jpg','http://demo.foxthemes.net/socialitehtml/assets/images/avatars/avatar-lg-3.jpg',
        'Alex');
    storyList.add(storyModal2);
    StoryModal storyModal3 = StoryModal('https://www.somagnews.com/wp-content/uploads/2020/09/v_bts_kim_taehyun_club_de_fans_china_record.png_793492074-e1601399938658.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSl5f39w5XmL3WIn0_OTU6Si87Kcyopf-AwqA&usqp=CAU', 'Park Jimin');
    storyList.add(storyModal3);
    return(
        storyList
    );
  }

  static List<FeedModal>getFeedList(){
    List<FeedModal> feedList = new List();
    FeedModal feedModal1 = FeedModal('Mariah Ali','https://media4.s-nbcnews.com/j/newscms/2019_45/3082841/191104-jungkook-bts-cs-1022a_07aaee52b9a979bada7386d8b5934c84.nbcnews-fp-1024-512.jpg',
        '5 hrs', 'http://demo.foxthemes.net/socialitehtml/assets/images/avatars/avatar-lg-3.jpg','', getCommentList());
    feedList.add(feedModal1);
    FeedModal feedModal2 = FeedModal('Jessica Alba','https://www.gstatic.com/tv/thumb/persons/165531/165531_v9_bb.jpg',
        '8 hrs', 'https://www.gstatic.com/tv/thumb/persons/165531/165531_v9_bb.jpg','',getCommentList());
    feedList.add(feedModal2);
    FeedModal feedModal3 = FeedModal('Ali Gony','https://www.irishtimes.com/polopoly_fs/1.3170107.1501253408!/image/image.jpg_gen/derivatives/ratio_1x1_w1200/image.jpg',
        '8 hrs', 'https://64.media.tumblr.com/6159b77c24bac840e382874b1042da7c/eb795f16bbf839b5-fd/s640x960/ec7c54764d101fbdf6b9c3db9327cffc9d14c9a6.jpg','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim laoreet dolore magna aliquam erat volutpat'
        ,getCommentList());
    feedList.add(feedModal3);
    FeedModal feedModal4 = FeedModal('Kim Taehyung','https://i.pinimg.com/564x/00/c5/49/00c54972c10795cadb9c255733acaa55.jpg',
        '15 hrs', 'https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/05/15/c436a58e-73e5-11e9-b91a-87f62b76a5ee_image_hires_115320.jpg?itok=3c74LGuO&v=1557892405','',getCommentList());
    feedList.add(feedModal4);
    return(
          feedList
    );
  }
  static List<CommentModal>getCommentList(){
    List<CommentModal> commentList = new List();
    CommentModal commentModal = CommentModal("Alex Dolgove",'https://media4.s-nbcnews.com/j/newscms/2019_45/3082841/191104-jungkook-bts-cs-1022a_07aaee52b9a979bada7386d8b5934c84.nbcnews-fp-1024-512.jpg',
        "1d", "Ut wisi enim ad minim laoreet dolore magna aliquam erat",true);
    commentList.add(commentModal);
    CommentModal commentModal1 = CommentModal("Stella Johnson",'https://i.pinimg.com/originals/c2/7d/9b/c27d9b0123d688cc43bd78472a1bbe3b.jpg',
        "2d",   "Ut wisi enim ad minim laoreet dolore magna aliquam erat", false);
    commentList.add(commentModal1);
    CommentModal commentModal2 = CommentModal('Jonathan Mudano','https://static.wikia.nocookie.net/friends/images/f/f5/JoeyTribbiani.jpg/revision/latest/top-crop/width/360/height/360?cb=20180424154245',
        '3d', 'Ut wisi enim ad minim laoreet dolore magna aliquam erat gdfdrteerdffgf', false);
    commentList.add(commentModal2);
    return(
        commentList
    );
  }
}