class WelcomeModel {
  String imageUrl;
  String mainText;
  String subText;

  WelcomeModel(
      {required this.imageUrl, required this.mainText, required this.subText});
}

List<WelcomeModel> myModels = [
  WelcomeModel(
    imageUrl:
        'https://images.pexels.com/photos/7550886/pexels-photo-7550886.jpeg?cs=srgb&dl=pexels-anna-nekrashevich-7550886.jpg&fm=jpg',
    mainText: 'Organize Your Schedule Easily',
    subText: 'We help you organize yourself to be a better version of you',
  ),
  WelcomeModel(
    imageUrl:
        'https://images.pexels.com/photos/4240502/pexels-photo-4240502.jpeg?cs=srgb&dl=pexels-ivan-samkov-4240502.jpg&fm=jpg',
    mainText: 'Get Rid Of Procrastination',
    subText: 'We help you organize yourself to be a better version of you',
  ),
  WelcomeModel(
    imageUrl:
        'https://images.pexels.com/photos/7550886/pexels-photo-7550886.jpeg?cs=srgb&dl=pexels-anna-nekrashevich-7550886.jpg&fm=jpg',
    mainText: 'Organize Your Schedule Easily',
    subText: 'We help you organize yourself to be a better version of you',
  ),
];
