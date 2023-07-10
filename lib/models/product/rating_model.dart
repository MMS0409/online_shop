class Rating {
  final double rate;
  final int count;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'].toDouble(), count: json['count']);
  }

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};

  Rating({
    required this.rate,
    required this.count,
  });
}