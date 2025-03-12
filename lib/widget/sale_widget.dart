import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  final int i;
  const SaleWidget({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
            colors: [
              Color(0xFF7A60A5),
              Color(0xFF82C3DF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF9689CE),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Get the special discount",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "50 %\nOFF",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.network(
                width: double.infinity,
                saleItems[i],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List saleItems = [
  "https://i.ibb.co/vwB46Yq/shoes.png",
  "https://th.bing.com/th/id/R.9a06a9d5fb3daddd463ae7f84b82904f?rik=rmzjFSmnzPFs%2fA&riu=http%3a%2f%2fclipart-library.com%2fimage_gallery2%2fShoes-Transparent.png&ehk=HcjBGNR%2fOAi53Ivk5xUrsK1j17ceBgSxZQbgmr50TCc%3d&risl=1&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/R.835982fe6182dbd7980712c4fad623a4?rik=qCrfBSybJHVJOg&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fshoes-transparent-background%2fshoes-transparent-background-24.png&ehk=yEiMyBARwCE3K7FYfaDNAqcD%2bIOeDgw4Uia%2fNlY17ME%3d&risl=&pid=ImgRaw&r=0"
];
