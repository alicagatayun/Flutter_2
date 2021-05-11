class Addresses {
  final String acik_adres;
  final String mahalle;
  final String street;
  bool is_favorite;

  Addresses(this.acik_adres, this.mahalle, this.street, this.is_favorite);

  get userAcikAdres {
    return acik_adres;
  }

  get userMahalle {
    return mahalle;
  }

  get userStreet {
    return street;
  }

  get userFavorite {
    return is_favorite;
  }

  set setUserFavorite(bool fav) {
    is_favorite = fav;
  }
}
