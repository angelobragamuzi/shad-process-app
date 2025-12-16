class MainParty {
  final String name;
  final String role; // Plaintiff, Defendant, Claimant, Respondent
  final String? taxId; // CPF / CNPJ

  MainParty({required this.name, required this.role, this.taxId});
}

class OpposingParty {
  final String name;
  final String? taxId;

  OpposingParty({required this.name, this.taxId});
}
