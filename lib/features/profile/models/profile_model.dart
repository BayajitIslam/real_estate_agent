class ProfileModel {
  final String id;
  final String name;
  final String location;
  final String avatar;
  final bool isSuperAgent;
  final String bio;
  final double rating;
  final List<String> languages;
  final int amountOfListing;
  final int propertiesSold;
  final int storyUploaded;

  ProfileModel({
    required this.id,
    required this.name,
    required this.location,
    required this.avatar,
    this.isSuperAgent = false,
    required this.bio,
    required this.rating,
    required this.languages,
    required this.amountOfListing,
    required this.propertiesSold,
    required this.storyUploaded,
  });
}