import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Basket extends StatefulWidget {
  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Text(
                      'Sepetim',
                      style: TextStyle(fontSize: 17, color: Colors.green),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Divider(
                  color: Colors.grey,
                  height: 2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                //color: Colors.white,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Colors.red,
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images.png',
                              height: 75,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text('Kategori 1'),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Colors.red,
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images.png',
                              height: 75,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text('Kategori 1'),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Colors.red,
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images.png',
                              height: 75,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text('Kategori 1'),
                            )
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () => print('Alışverişe devam edeceğim'),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, left: 10, bottom: 5),
                      child: Row(
                        children: [
                          Text(
                            '< Alışverişe Devam et',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                //color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Sepetinizdekilerle İlgili Ürünler',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, bottom: 3, top: 2),
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                //color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Bunlar ilginizi çekebilir',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, bottom: 3, top: 2),
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                width: 120,
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'assets/rsz_photo.png',
                                        width: 80,
                                        height: 150,
                                      ),
                                    ),
                                    Text('Ürün Adı'),
                                    Text('Fiyat'),
                                    RaisedButton(
                                      onPressed: () => null,
                                      child: Text('Sepete Ekle'),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(0.0, 0.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: _selected ? true : false,
                      onChanged: (value) {
                        _selected = true;
                      },
                    ),
                    Text('Hediye paketi yaptırmak istiyorum.'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(0.0, 0.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ürünlerin toplamı (KDV Dahil)'),
                          Text('\₺15'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kargo Tutarı'),
                          Text('\₺7'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Genel Toplam'),
                          Text(
                            '\₺22',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {},
        color: Colors.green,
        textColor: Colors.white,
        child: Text('Ödemeyi Tamamla'),
      ),
    );
  }
}
