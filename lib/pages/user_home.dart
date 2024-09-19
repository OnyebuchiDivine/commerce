import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/components/commerce_item_tile.dart';
import 'package:commerce/components/shimmer_effect.dart';
import 'package:commerce/model/cart_model.dart';
import 'package:commerce/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final List<String> imgList = [
    "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/banner1.jpeg?alt=media&token=61b3560c-eee0-4e76-aeb9-db3b603959d9",
    "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/banner1.jpeg?alt=media&token=61b3560c-eee0-4e76-aeb9-db3b603959d9",
    "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/banner1.jpeg?alt=media&token=61b3560c-eee0-4e76-aeb9-db3b603959d9",
    "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/banner1.jpeg?alt=media&token=61b3560c-eee0-4e76-aeb9-db3b603959d9",
  ];

  int _currentPage = 0;

  final _firestore = FirebaseFirestore.instance;
  late Future<List<Map<String, dynamic>>> _users;

  @override
  void initState() {
    super.initState();
    _users = _fetchUsers();
  }

  Future<List<Map<String, dynamic>>> _fetchUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error fetching hostels: $e');
      return [];
    }
  }

  final items = ['town1', 'town2', 'town3'];

  String? value;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const CartPage(),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 101, 233, 193),
        child: Icon(
          Icons.shopping_bag,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.09,
        leadingWidth: screenWidth * 0.5,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Delivery address",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.secondary),
                  elevation: 5,
                  isExpanded: false,
                  value: value,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(
                    () => this.value = value,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [GestureDetector(
          onTap: (){Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const CartPage(),
    ),
  );
          },
          child: Icon(Icons.shopping_cart)), Icon(Icons.notifications)],
      ),

      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerEffect(); //Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hostels found.'));
          } else {
            final users = snapshot.data!;
            return Column(
              children: [
                //search bar
                // GestureDetector(
                //   onTap: () {
                //     showSearch(
                //       context: context,
                //       delegate: MySearchDelegate(),
                //     );
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 25),
                //     child: Container(
                //       width: screenWidth * 0.8,
                //       height: screenWidth * 0.09,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           color: Colors.grey[300]),
                //       child: Row(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(left: 10),
                //             child: Icon(
                //               Icons.search,
                //               color: Theme.of(context).colorScheme.primary,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //end of search bar
                // CarouselSlider(
                //   items: imgList
                //       .map(
                //         (e) => Center(
                //           child: Image.network(e),
                //         ),
                //       )
                //       .toList(),
                //   options: CarouselOptions(
                //     initialPage: 0,
                //     autoPlay: true,
                //     autoPlayAnimationDuration: Duration(seconds: 2),
                //     enlargeCenterPage: true,
                //     enlargeFactor: 0.3,
                //     onPageChanged: (value, _) {
                //       setState(() {
                //         _currentPage = value;
                //       });
                //     },
                //   ),
                // ),
                // buildCarouselIndictor(),

                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return //ListTile(
                          //title: Text(user['name'] ?? 'No Name'),
                          Column(
                        children: [
                        
                          //Text('Location: ${user['location'] ?? 'Unknown'}\nPrice: ${user['price'] ?? 'Unknown'}'),
                           GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenWidth * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[300]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                            CarouselSlider(
                  items: imgList
                      .map(
                        (e) => Center(
                          child: Image.network(e),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (value, _) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                  ),
                ),
                buildCarouselIndictor(),
                          //swipe carosel

                          // CarouselSlider(
                          //   items: imgList
                          //       .map(
                          //         (e) => Center(
                          //           child: Image.network(e),
                          //         ),
                          //       )
                          //       .toList(),
                          //   options: CarouselOptions(),
                          // ),

                          // end swipe carosel

                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.symmetric(
                          //             horizontal: 25),
                          //         child: Image.network(
                          //           user['image'],
                          //           height: screenHeight * 0.2,
                          //         ),
                          //       ),
                          //       Image.network(
                          //         user['image'],
                          //         height: screenHeight * 0.2,
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // begining of category
                         
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text('Category'),
                              ),
                            ],
                          ),
                        SizedBox(height: 10,),

                          Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Image.network(
                                      user['image2'],
                                      height: screenHeight * 0.05,
                                    ),
                                  ),
                                  Text(
                                    user['name'] ?? 'No Name',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Image.network(
                                    user['school'],
                                    height: screenHeight * 0.05,
                                  ),
                                  Text(
                                    user['schooln'] ?? 'No Name',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Column(
                                children: [
                                  Image.network(
                                    user['sport'],
                                    height: screenHeight * 0.05,
                                  ),
                                  Text(
                                    user['sportn'] ?? 'No Name',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Column(
                                children: [
                                  Image.network(
                                    user['electronics'],
                                    height: screenHeight * 0.05,
                                  ),
                                  Text(
                                    user['electronicn'] ?? 'No Name',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Image.network(
                                    user['menuicon'],
                                    height: screenHeight * 0.05,
                                  ),
                                  Text(
                                    user['alln'] ?? 'No Name',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          
                          // end of category
                         
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Padding(
                          //       padding:
                          //           const EdgeInsets.symmetric(horizontal: 25),
                          //       child: Text('Recent Product '),
                          //     ),
                          //     Padding(
                          //       padding:
                          //           const EdgeInsets.symmetric(horizontal: 25),
                          //       child: Icon(Icons.filter),
                          //     )
                          //   ],
                          // ),
                          //Begining of add to cart
                          // Container(
                          //   height: screenHeight * 0.3,
                          //   width: screenWidth * 1,
                          //   child: ListView(
                          //     children: [
                          //       Column(
                          //         children: [
                          //           Row(
                          //             children: [
                          //               Column(
                          //                 children: [
                          //                   Image.network(
                          //                     user['desktop'],
                          //                     width: screenWidth * 0.5,
                          //                   ),
                          //                   SizedBox(height: 48,),
                          //                   Text(
                          //                       ' ${user['desktopn'] ?? 'Unknown'}\n ${user['desktopprice'] ?? 'Unknown'}'),
                          //                   Container(
                          //                     height: screenHeight *0.04,
                          //                     width: screenWidth * 0.4,
                          //                     decoration: BoxDecoration(
                          //                       borderRadius: BorderRadius.circular(5),
                          //                       color: Theme.of(context).colorScheme.secondary
                          //                     ),
                          //                     child: TextButton(
                          //                         onPressed: () {},
                          //                         child: Text('Add to cart',style: TextStyle(
                          //                           color: Colors.white
                          //                         ),)),
                          //                   )
                          //                 ],
                          //               ),
                          //               Column(
                          //                 children: [
                          //                   Image.network(user['earpod'],
                          //                       width: screenWidth * 0.4),

                          //                Text(
                          //                       ' ${user['earphonen'] ?? 'Unknown'}\n ${user['earphoneprice'] ?? 'Unknown'}'),
                          //                   Container(
                          //                     height: screenHeight *0.04,
                          //                     width: screenWidth * 0.4,
                          //                     decoration: BoxDecoration(
                          //                       borderRadius: BorderRadius.circular(5),
                          //                       color: Theme.of(context).colorScheme.secondary
                          //                     ),
                          //                     child: TextButton(
                          //                         onPressed: () {},
                          //                         child: Text('Add to cart',style: TextStyle(
                          //                           color: Colors.white
                          //                         ),)),
                          //                   )
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //           Row(
                          //             children: [
                          //               Padding(
                          //                 padding: const EdgeInsets.symmetric(
                          //                     horizontal: 20),
                          //                 child: Image.network(
                          //                   user['joystick'],
                          //                   width: screenWidth * 0.4,
                          //                 ),
                          //               ),
                          //               Image.network(user['earpod'],
                          //                   width: screenWidth * 0.4),
                          //             ],
                          //           ),
                          //           Row(
                          //             children: [
                          //               Image.network(
                          //                 user['desktop'],
                          //                 width: screenWidth * 0.5,
                          //               ),
                          //               Image.network(user['mug'],
                          //                   width: screenWidth * 0.4),
                          //             ],
                          //           ),

                          //         ],
                          //       )

                          //     ],

                          //   ),
                          // ),
                          //End of Add to Cart

                          //begin of mitch add to cart
                          // Consumer<CartModel>(
                          //   builder: (context, value, child) {
                          //     return GridView.builder(
                          //       itemCount:value.shopItems.length,
                          //       gridDelegate:
                          //           SliverGridDelegateWithFixedCrossAxisCount(
                          //               crossAxisCount: 2),
                          //       itemBuilder: (context, index) {
                          //         return CommerceItemTile(
                          //           itemName: value.shopItems[index][0],
                          //           itemPrice: value.shopItems[index][1],
                          //           imagePath: value.shopItems[index][2],
                          //           color: value.shopItems[index][3],

                          //         );
                          //       },
                          //     );
                          //   },
                          // ),
                          //end of mitch add to cart
                        ],
                      );
                      //); ListTile
                    },
                  ),
                ),
               
                Expanded(
                  child: Consumer<CartModel>(
                    builder: (context, value, child) {
                      return GridView.builder(
                        itemCount: value.shopItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return CommerceItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            imagePath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),

// ],

//         ),
//       ),
    );
  }

  buildCarouselIndictor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            height: i == _currentPage ?7 : 5,
            width:  i == _currentPage ?7 : 5,
            margin: EdgeInsets.all(5),
            decoration:
                BoxDecoration(color:  i == _currentPage ? Colors.black: Colors.grey, 
                shape: BoxShape.circle),
          )
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'School',
    'sports',
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.close))
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
              title: Text(suggestion),
              onTap: () {
                query = suggestion;
                showResults(context);
              });
        });
  }
}
