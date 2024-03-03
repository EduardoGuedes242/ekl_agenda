class ProdutoModel {
  int? proId;
  int? inqId;
  int? empId;
  String? proAtivo;
  String? proDescricao;
  int? proPrecoVenda;
  String? proTempoMedio;

  ProdutoModel(
      {this.proId,
      this.inqId,
      this.empId,
      this.proAtivo,
      this.proDescricao,
      this.proPrecoVenda,
      this.proTempoMedio});

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    proId = json['proId'];
    inqId = json['inqId'];
    empId = json['empId'];
    proAtivo = json['proAtivo'];
    proDescricao = json['proDescricao'];
    proPrecoVenda = json['proPrecoVenda'];
    proTempoMedio = json['proTempoMedio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proId'] = this.proId;
    data['inqId'] = this.inqId;
    data['empId'] = this.empId;
    data['proAtivo'] = this.proAtivo;
    data['proDescricao'] = this.proDescricao;
    data['proPrecoVenda'] = this.proPrecoVenda;
    data['proTempoMedio'] = this.proTempoMedio;
    return data;
  }
}
