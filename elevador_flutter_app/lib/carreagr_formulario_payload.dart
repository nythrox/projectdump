class CarregarFormularioPayload {
  List<ListaPrincipais> listaPrincipais;

  CarregarFormularioPayload({this.listaPrincipais});

  CarregarFormularioPayload.fromJson(Map<String, dynamic> json) {
    if (json['listaPrincipais'] != null) {
      listaPrincipais = new List<ListaPrincipais>();
      json['listaPrincipais'].forEach((v) {
        listaPrincipais.add(new ListaPrincipais.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listaPrincipais != null) {
      data['listaPrincipais'] =
          this.listaPrincipais.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListaPrincipais {
  int id;
  String descricao;
  List<SubItens> subItens;

  ListaPrincipais({this.id, this.descricao, this.subItens});

  ListaPrincipais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    if (json['subItens'] != null) {
      subItens = new List<SubItens>();
      json['subItens'].forEach((v) {
        subItens.add(new SubItens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    if (this.subItens != null) {
      data['subItens'] = this.subItens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubItens {
  int id;
  String descricao;
  List<Grupos> grupos;

  SubItens({this.id, this.descricao, this.grupos});

  SubItens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    if (json['grupos'] != null) {
      grupos = new List<Grupos>();
      json['grupos'].forEach((v) {
        grupos.add(new Grupos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    if (this.grupos != null) {
      data['grupos'] = this.grupos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Grupos {
  int id;
  String descricao;
  List<Opcoes> opcoes;

  Grupos({this.id, this.descricao, this.opcoes});

  Grupos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    if (json['opcoes'] != null) {
      opcoes = new List<Opcoes>();
      json['opcoes'].forEach((v) {
        opcoes.add(new Opcoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    if (this.opcoes != null) {
      data['opcoes'] = this.opcoes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Opcoes {
  int id;
  String descricao;

  Opcoes({this.id, this.descricao});

  Opcoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    return data;
  }
}
