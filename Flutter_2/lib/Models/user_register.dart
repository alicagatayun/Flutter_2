class Register {
  Register(
      this.name, this.surname, this.gender, this.phoneNumber, this.adresler);
  final name;
  final surname;
  final gender;
  final phoneNumber;
  final List<AdresDetail> adresler;
  factory Register.fromMap(
    Map<String, dynamic> data,
    String documentId,
  ) {
    if (data == null) {
      return null;
    }
    var butun_adresler = data['adresler'].map((i) {
      var z = Map<String, dynamic>.from(i);

      return AdresDetail.fromMap(z);
    }).toList();
    var adres = List<AdresDetail>.from(butun_adresler);
    return Register(data['name'], data['surname'], data['gender'],
        data['phoneNumber'], adres);
  }
  Map<String, dynamic> toMap() {
    var theItems = adresler.map((i) => i.toMap()).toList();
    return {
      'name': name,
      'surname': surname,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'adresler': theItems
    };
  }
}

class AdresDetail {
  AdresDetail(this.acik_adres, this.is_favorite, this.mahalle, this.street);
  final acik_adres;
  bool is_favorite;
  final mahalle;
  final street;
  factory AdresDetail.fromMap(
    Map<String, dynamic> adres,
  ) {
    if (adres == null) {
      return null;
    }
    return AdresDetail(
      adres['acik_adres'],
      adres['is_favorite'],
      adres['mahalle'],
      adres['street'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'acik_adres': acik_adres,
      'is_favorite': is_favorite,
      'mahalle': mahalle,
      'street': street
    };
  }
}
