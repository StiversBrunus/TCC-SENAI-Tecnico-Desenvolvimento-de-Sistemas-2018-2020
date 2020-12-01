import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fypp/app/controllers/category_controller.dart';
import 'package:fypp/app/model/category.dart';
import 'package:fypp/app/model/event.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/book/event.screen.dart';
import 'package:fypp/app/screens/book/pickphot.screen.dart';
import 'package:fypp/app/stores/category/category.store.dart';
import 'package:get/get.dart';

class PickCategoryScreen extends StatefulWidget {
  final Event event;
  PickCategoryScreen({Key key, this.event}) : super(key: key);

  @override
  _PickCategoryScreenState createState() => _PickCategoryScreenState();
}

class _PickCategoryScreenState extends State<PickCategoryScreen> {
  CategoryStore categoryStore = CategoryStore();
  CategoryController categoryController = CategoryController();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      categoryStore.getCategories().then((value) => categories = value);
    });
  }

  Future<Event> createEvent(int categoryId) async {
    Event event = Event(
      id: null,
      date: widget.event.date,
      initialTime: widget.event.initialTime,
      finalTime: widget.event.finalTime,
      address: widget.event.address,
      categoryId: categoryId
    );
    print(event.toJson());
    return event;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha a categoria'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Observer(builder: (_) {
          if (categoryStore.loadingData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepPurple,
              ),
            );
          } else {
            return FutureBuilder(
              future: categoryStore.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: categoryStore.categories.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            Event event = await createEvent(snapshot.data[index].id);
                            List<Photographer> phots = await categoryController
                                .getPhotographersByCategory(
                                    snapshot.data[index].id);
                            Get.to(PickPhotScreen(
                              photographers: phots,
                              event: event,
                            ));
                          },
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                  Colors.deepPurple.withOpacity(0.4),
                                  BlendMode.darken,
                                ),
                                fit: BoxFit.cover,
                                image: NetworkImage(snapshot.data[index].image),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                              child: Text(
                                snapshot.data[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }
        }),
      ),
    );
  }
}
