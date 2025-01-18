class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome To MealMosaic",
    image: "assets/images/image1.png",
    desc:
        "Seamlessly manage your meal tokens and dining experience at your Hall!",
  ),
  OnboardingContents(
    title: "Stay organized with us",
    image: "assets/images/image2.png",
    desc:
        "Effortlessly purchase meal tokens for lunch and dinner, right from your fingertips.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/images/image3.png",
    desc:
        "Track your transactions, recharge your wallet, and stay on top of your dining budget with ease.",
  ),
];
