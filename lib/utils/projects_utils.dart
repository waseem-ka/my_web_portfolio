class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

//Hobby Projects:

List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/p1.png',
    title: "WayGo App",
    subtitle:
        "WayGo is an innovative app designed to simplify traveling between Syrian governorates with ease and convenience. It allows you to effortlessly book a bus seat to any destination within Syria with just a few taps.",
    androidLink: "",
  ),
];

//Hobby Projects:

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/p1.png',
    title: "WayGo App",
    subtitle:
        "WayGo is an innovative app designed to simplify traveling between Syrian governorates with ease and convenience. It allows you to effortlessly book a bus seat to any destination within Syria with just a few taps.",
    androidLink: "",
  ),
];
