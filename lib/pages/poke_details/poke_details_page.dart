import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailsPage extends StatefulWidget {
  final int index;

  PokeDetailsPage({Key key, this.index}) : super(key: key);

  @override
  _PokeDetailsPageState createState() => _PokeDetailsPageState();
}

class _PokeDetailsPageState extends State<PokeDetailsPage> {
  PageController _pageController;
  Pokemon _pokemon;
  PokeApiStore _pokemonStore;
  MultiTrackTween _animation;
  double _progress;
  double _multiple;
  double _opacity;
  double _opacityTitleAppBar;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pokemon = _pokemonStore.currentPokemon;

    _animation = MultiTrackTween([
      Track("rotation").add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.0),
          curve: Curves.linear)
    ]);

    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitleAppBar = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Observer(
          builder: (BuildContext context) {
            return AppBar(
              title: Opacity(
                child: Text(
                  _pokemon.name,
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
                opacity: _opacityTitleAppBar,
              ),
              elevation: 0,
              backgroundColor: _pokemonStore.colorPokemon,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ControlledAnimation(
                            playback: Playback.LOOP,
                            duration: _animation.duration,
                            tween: _animation,
                            builder: (context, animation) {
                              return Transform.rotate(
                                child: Opacity(
                                  child: Image.asset(
                                    ConstsApp.whitePokeball,
                                    height: 50,
                                    width: 50,
                                  ),
                                  opacity: _opacityTitleAppBar >= 0.2 ? 0.2 : 0,
                                ),
                                angle: animation['rotation'],
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (context) {
              return Container(color: _pokemonStore.colorPokemon);
            },
          ),
          Container(height: MediaQuery.of(context).size.height / 3),
          SlidingSheet(
            listener: (state) {
              setState(() {
                _progress = state.progress;
                _multiple = 1 - interval(0.0, 0.7, _progress);
                _opacity = _multiple;
                _opacityTitleAppBar =
                    _multiple = interval(0.55, 0.8, _progress);
              });
            },
            elevation: 0,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
              );
            },
          ),
          Opacity(
            opacity: _opacity,
            child: Padding(
              child: SizedBox(
                  height: 240,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      _pokemonStore.setCurrentPokemon(index: index);
                    },
                    itemCount: _pokemonStore.pokeAPI.pokemon.length,
                    itemBuilder: (BuildContext context, int index) {
                      Pokemon _pokeitem =
                          _pokemonStore.getPokemon(index: index);
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ControlledAnimation(
                            playback: Playback.LOOP,
                            duration: _animation.duration,
                            tween: _animation,
                            builder: (context, animation) {
                              return Transform.rotate(
                                child: Hero(
                                  child: Opacity(
                                    child: Image.asset(
                                      ConstsApp.whitePokeball,
                                      height: 240,
                                      width: 240,
                                    ),
                                    opacity: 0.2,
                                  ),
                                  tag: '', //_pokeitem.name + 'rotation',
                                ),
                                angle: animation['rotation'],
                              );
                            },
                          ),
                          Observer(builder: (context) {
                            return AnimatedPadding(
                              child: Hero(
                                tag: _pokeitem.name,
                                child: CachedNetworkImage(
                                  height: 200,
                                  width: 200,
                                  placeholder: (context, url) => new Container(
                                    color: Colors.transparent,
                                  ),
                                  color: index == _pokemonStore.currentPosition
                                      ? null
                                      : Colors.black.withOpacity(0.5),
                                  imageUrl:
                                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokeitem.num}.png',
                                ),
                              ),
                              duration: Duration(milliseconds: 400),
                              curve: Curves.bounceInOut,
                              padding: EdgeInsets.all(
                                  index == _pokemonStore.currentPosition
                                      ? 0
                                      : 60),
                            );
                          }),
                        ],
                      );
                    },
                  )),
              padding: EdgeInsets.only(
                  top: _opacityTitleAppBar == 1 ? 10000 : 60 - _progress * 50),
            ),
          )
        ],
      ),
    );
  }
}
