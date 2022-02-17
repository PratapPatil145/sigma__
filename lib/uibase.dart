import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma/providers/homeScreenProvider.dart';

class UiBase extends StatefulWidget {
  const UiBase({Key? key}) : super(key: key);

  @override
  _UiBaseState createState() => _UiBaseState();
}

class _UiBaseState extends State<UiBase> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenProvider>().getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Consumer<HomeScreenProvider>(builder: (context, provider, child) {
        return provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: ListView.builder(
                    itemCount: provider.apiData['tags'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        child: Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              provider.apiData['tags'][index]
                                                  ['displayName'],
                                              style: const TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 16.0),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, left: 8.0),
                                      child: (provider.apiData['tags'][index]
                                                  ['meta'] !=
                                              null)
                                          ? Text(
                                              provider.apiData['tags'][index]
                                                  ['meta'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold))
                                          : Container(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, left: 8.0),
                                      child: Text(
                                        provider.apiData['tags'][index]
                                            ['description'],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, left: 12.0),
                                          child: Text(
                                            "Spaces",
                                            style:
                                                TextStyle(color: Colors.pink),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }));
      }),
    );
  }
}
