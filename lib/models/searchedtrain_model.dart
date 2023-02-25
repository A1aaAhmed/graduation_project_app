class SearchedTrain {
  int fromindex;
  int toindex;
  Map<String,dynamic> train;

  SearchedTrain(
    this.fromindex,
    this.toindex,
    this.train,
  );

  Map<String, dynamic> toMap() {
    return {
      'fromindex': fromindex,
      'toindex': toindex,
      'train': train,
    };
  }
}
