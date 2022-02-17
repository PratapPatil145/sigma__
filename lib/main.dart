import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma/providers/homeScreenProvider.dart';
import 'package:sigma/uibase.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Pratap',
        theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Mont'),
        debugShowCheckedModeBanner: false,
        home: const UiBase(),
      ),
    ),
  );
}
