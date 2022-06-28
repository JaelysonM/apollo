class ProductDto {
  final String? id;
  final String name;
  final double price;
  final List<dynamic> duration;

  ProductDto({
    this.id,
    required this.name,
    required this.price,
    required this.duration,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json['id'],
        name: json["name"],
        price: json["price"],
        duration: json["duration"],
      );
}
