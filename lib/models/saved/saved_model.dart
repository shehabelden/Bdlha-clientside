class SavedModel {
  final String name;
  final String image;
  final String EXCHANGE;
  final int rate;
  final String pio;
  const SavedModel(
      {
        required this.name,
        required this.image,
        required this.EXCHANGE,
        required this.rate,
        required this.pio,
      }
      );
  Map<String, dynamic> toMap() {
    return{
      'name' : name,
      "EXCHANGE" : EXCHANGE,
      "image" : image,
      "pio" : pio,
      "rate":rate,
    };
  }
  @override
  String toString() {
    return 'Cart {name: $name, image:$image, EXCHANGE:$EXCHANGE, pio:$pio, rate:$rate}';
  }
}
