import 'package:flutter/material.dart';
import 'package:flutter_weather/core/constants/prconst.dart';
import 'package:flutter_weather/screen/home/mainpage/viewmodel/main_page_viewmodel.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final String _appBarTitle = "WeatherForecast";

  final PrConst _constant = PrConst();
  late final MainViewModal mainViewModal;

  String dropdownValue = dropList.first;

  @override
  void initState() {
    mainViewModal = MainViewModal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          _appBarTitle,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      backgroundColor: _constant.bg,
      body: FutureBuilder(
        future: mainViewModal.getWeather(dropdownValue),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "${snapshot.data?.location?.country}",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Center(
                  child: Text(
                    "${snapshot.data?.current?.condition?.text}",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Center(
                  child: Text(
                    "${snapshot.data?.current?.tempC}°C",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: _constant.dtxt),
                  ),
                ),
                SizedBox(
                  height: _constant.bSpacing,
                ),
                DropdownButton(
                  style: Theme.of(context).textTheme.bodyLarge,
                  value: dropdownValue,
                  items: dropList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

List<String> dropList = <String>["Izmir", "Frankfurt", "Paris"];
