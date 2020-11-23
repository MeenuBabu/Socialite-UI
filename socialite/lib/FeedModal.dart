import 'package:socialite/CommentModal.dart';

class FeedModal{

  String userName;
  String userImage;
  String feedTime;
  String feedImage;
  String feedText;
  List<CommentModal>comments;

  FeedModal(this.userName,this.userImage,this.feedTime,this.feedImage,this.feedText, this.comments);
}