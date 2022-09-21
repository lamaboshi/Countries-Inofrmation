import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlayment/overlayment.dart';

import 'bloc/countries_bloc/countries_bloc.dart';
import 'bloc/countries_bloc/countries_event.dart';
import 'bloc/countries_bloc/countries_state.dart';
import 'data/repositories/countries_repositories.dart';
import 'seeds/country_seeds.dart';
import 'translations_screen.dart';
import 'util/map_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<NavigatorState>();
    Overlayment.navigationKey = key;
    return MaterialApp(
      navigatorKey: key,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: RepositoryProvider(
          create: (context) => CountriesRepositories(),
          child: const MyHomePage(title: 'Country')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc(
        RepositoryProvider.of<CountriesRepositories>(context),
      )..add(LoadCountriesEvent('Russia')),
      child: Container(
        child: BlocBuilder<CountriesBloc, CountriesState>(
          builder: (context, state) {
            if (state is CountriesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CountriesLoadedState) {
              return Scaffold(
                drawer: Drawer(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: list
                            .map((e) => ListTile(
                                  onTap: () {
                                    BlocProvider.of<CountriesBloc>(context)
                                        .add(LoadCountriesEvent(e));
                                  },
                                  title: Text(e),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                appBar: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          MapUtils.openMap(state.country.maps!.googleMaps!);
                        },
                        icon: const Icon(Icons.location_on)),
                  ],
                  title: Text(widget.title),
                  backgroundColor: Colors.purple,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: list
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          BlocProvider.of<CountriesBloc>(
                                                  context)
                                              .add(LoadCountriesEvent(e));
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.purple.shade300,
                                              radius: 42,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.asset(
                                                  'assets/images/angryimg.jpg',
                                                  height: 80,
                                                  width: 80,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Text(e),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  state.country.coatOfArms!.png!,
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.country.name!.common!,
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                    Text(state.country.name!.official!)
                                  ],
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: state.country.tld!
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            e,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.purple.shade400),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SvgPicture.network(
                            state.country.flags!.svg!,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Chip(
                                  label: Text(state.country.cca2!),
                                  backgroundColor: Colors.purple.shade100),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Chip(
                                  label: Text(state.country.ccn3!),
                                  backgroundColor: Colors.purple.shade200),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Chip(
                                  label: Text(state.country.cca3!),
                                  backgroundColor: Colors.purple.shade300),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Chip(
                                  label: Text(state.country.cioc!),
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.6)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Tooltip(
                                    message: 'Is unMember',
                                    child: Icon(
                                      state.country.unMember!
                                          ? Icons.card_membership
                                          : Icons.remove_done,
                                      color: Colors.purple.shade200,
                                    )),
                              ),
                              Tooltip(
                                message: 'Is independent',
                                child: Icon(
                                  !state.country.independent!
                                      ? Icons.turned_in_not_rounded
                                      : Icons.turned_in,
                                  color: Colors.purple.shade600,
                                  size: 30,
                                ),
                              ),
                              Text(
                                state.country.status!,
                                style: TextStyle(color: Colors.purple.shade500),
                              ),
                              Icon(
                                state.country.landlocked!
                                    ? Icons.lock_outline_rounded
                                    : Icons.lock_open_rounded,
                                color: Colors.purple,
                                size: 30,
                              ),
                              Column(
                                children: state.country.borders!
                                    .map((e) => Text(
                                          e,
                                          style: const TextStyle(
                                              color: Colors.purpleAccent),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: state.country.timezones!
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Chip(
                                            label: Text(e),
                                            backgroundColor:
                                                Colors.purple.shade100),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Car Side:',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    state.country.car!.side!,
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.purple.shade300),
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const Text(
                                    'Car Signs:',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: state.country.car!.signs!
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Chip(
                                                label: Text(e,
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor:
                                                    Colors.purple.shade600),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const Text(
                                'Continents :',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.country.continents!
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Chip(
                                            label: Text(e,
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                            backgroundColor:
                                                Colors.purple.shade900),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Start Of Week :',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    state.country.startOfWeek!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.purple.shade200),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Fifa :',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    state.country.fifa!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.purple.shade200),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Demonyms',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.purple),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                runAlignment: WrapAlignment.spaceBetween,
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    children: [
                                      const Text(
                                        'eng :',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        '${state.country.demonyms!.eng!.f!}/${state.country.demonyms!.eng!.m!}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.purple.shade200),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    children: [
                                      const Text(
                                        'fra :',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        '${state.country.demonyms!.fra!.f!}/${state.country.demonyms!.fra!.m!}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.purple.shade200),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(
                            child:
                                TranslationsScreen(state.country.translations!))
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is CountriesErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
