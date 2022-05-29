class Account {
  String id;
  String name;
  String email;

  double? evaluation;
  double? lastEvaluation;

  double punctuality;
  bool? isActive;
  bool? isAdmin;

  Account({
    required this.id,
    required this.name,
    required this.email,
    this.evaluation = 5.0,
    this.lastEvaluation = 5.0,
    this.punctuality = 100,
    this.isActive = false,
    this.isAdmin = false,
  });

  String getFirstName() {
    return name.split(' ')[0];
  }
}
