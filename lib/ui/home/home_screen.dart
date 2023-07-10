import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data/api_provider.dart';
import 'package:online_shop/models/product/product_model.dart';
import '../../data/api_repository.dart';
import '../../models/universal_responce.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RepositoryProductALL currencyRepository =
  RepositoryProductALL(apiProvider: ProductApi());

  List<ProductModel> currencies = [];

  bool isLoading = false;
  String searchText = "";

  getData() async {
    UniversalResponse universalResponse =
    await ProductApi().getAllProducts("", "asc", 50);
    print(universalResponse.error);
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    currencies = (await currencyRepository.fetchProductAll("", "desc", 50));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.orange,
        title: const Text(
          "Product",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(
          color: Colors.indigo,
        ),
      )
          : currencies.isEmpty
          ? const Center(child: Text("Not Found"))
          : ListView(children: [
        ...List.generate(currencies.length, (index) {
          ProductModel currency = currencies[index];
          return ListTile(
            onTap: () {},
            title: Text(
              currency.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.black),
            ),
            leading: SizedBox(
              width: 50,
                child: Image.network(currency.image,fit: BoxFit.fill,)),
            trailing: const Icon(Icons.arrow_right),
          );
        })
      ]),
    );
  }
}
