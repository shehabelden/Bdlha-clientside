class TicketModel {
  final String name;
  final String image;
  final String gender;
  const TicketModel(
      {
        required this.name,
        required this.image,
        required this.gender,
  }
  );
  Map<String, dynamic> toMap() {
    return{
      'name' : name,
      "gender" : gender,
      "image" : image,
    };
  }
  @override
  String toString() {
    return 'Tiket{name: $name, image:$image, gender:$gender,}';
  }
}
