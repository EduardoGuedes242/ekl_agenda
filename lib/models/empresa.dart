class EmpresaModel {
  int? empId;
  String? empNome;

  EmpresaModel({this.empId, this.empNome});

  EmpresaModel.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    empNome = json['empNome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empId'] = this.empId;
    data['empNome'] = this.empNome;
    return data;
  }
}
