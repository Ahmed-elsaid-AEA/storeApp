class RatingModel{
  final String rate;
  final String count;
  RatingModel({required this.rate,required this.count});
  factory RatingModel.fromJson(jsonData){
    return RatingModel(rate: jsonData['rate'].toString(), count: jsonData['count'].toString());
  }
}