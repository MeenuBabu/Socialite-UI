
class StoryModal{
  String storyImage;
  String userImage;
  String userName;

  StoryModal(this.storyImage,this.userImage,this.userName);

  Map toJson() => {
    'storyImage': storyImage,
    'userImage': userImage,
    'userName':userName
  };
}
