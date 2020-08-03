class Demande {
  int numero_tel;
  int user_id;
  double budget_max;
  String commentaire;

  Demande({numero_tel, this.budget_max, this.commentaire, this.user_id});

  factory Demande.fromJson(Map<String, dynamic> json) {
    return Demande(
      budget_max: json['budget_max'].toDouble(),
      commentaire: json['commentaire'] as String,
      numero_tel: json['numero_tel'] as int,
      user_id: json['user_id'] as int,
    );
  }
}
