import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moving_app/Order/blocs/address_form_bloc/address_form_bloc.dart';
import 'package:moving_app/Order/blocs/address_form_cubit/address_form_cubit.dart';
import 'package:moving_app/Order/data/models/order_address.dart';
import 'package:moving_app/Shared/Location/bloc/location_bloc.dart';
import 'package:moving_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:moving_app/Utils/constants.dart';
import 'package:moving_app/Utils/services/service_locator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../widgets/address/addresses_panel.dart';
import 'vehicle_select_screen.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  late final GoogleMapController googleMapController;
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final SuggestionsBoxController suggestionController1 =
      SuggestionsBoxController();
  final SuggestionsBoxController suggestionController2 =
      SuggestionsBoxController();
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final LocationBloc pickupBloc = LocationBloc()..add(DetectCurrentLocation());
  final LocationBloc dropoffBloc = LocationBloc();
  final LatLng initPos = LatLng(30.0504132, 31.2073222);
  late LatLng mapCenterPostion;
  bool isOnPickup = true;
  bool requestOnMove = true;
  double _fabHeight = 0;
  final double _initFabHeight = 105.0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 95.0;
  final PanelController panelController = PanelController();
  final PageController pageController = PageController();
  bool resizeToAvoid = true;
  OrderAddress? pickupAddress;
  OrderAddress? dropoffAddress;
  final GlobalKey<FormState> pickupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dropoffFormKey = GlobalKey<FormState>();

  final AddressFormBloc formBloc = AddressFormBloc();

  @override
  void initState() {
    mapCenterPostion = initPos;
    _fabHeight = _initFabHeight;
    super.initState();
    _focus1.addListener(() {
      print("Focus Node 1: ${_focus1.hasFocus.toString()}");
      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .67;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoid, //false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
          //title: Text('Select Addresses'),
          toolbarHeight: 142,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<LocationBloc, LocationState>(
                bloc: pickupBloc,
                listener: (context, state) {
                  if (state is LocationDetected) {
                    mapCenterPostion = state.currentLocation.location!;
                    googleMapController.animateCamera(CameraUpdate.newLatLng(
                      LatLng(state.currentLocation.location!.latitude,
                          state.currentLocation.location!.longitude),
                    ));
                    setState(() => textController1.text =
                        state.currentLocation.displayName);
                    formBloc.add(FetchAddress(
                        area: state.currentLocation.suburb,
                        street: state.currentLocation.road,
                        isPickup: true));
                    suggestionController1.close();
                  } else if (state is LocationFetched) {
                    setState(() => textController1.text =
                        state.currentLocation.displayName);
                    formBloc.add(FetchAddress(
                        area: state.currentLocation.suburb,
                        street: state.currentLocation.road,
                        isPickup: true));
                    suggestionController1.close();
                  }
                },
                builder: (context, state) {
                  return TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textInputAction: TextInputAction.next,
                      // autofocus: true,
                      controller: textController1,
                      focusNode: _focus1,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                          gapPadding: 0,
                        ),
                        icon: Icon(
                          Icons.location_on_rounded,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        hintText: 'Pick up',
                        fillColor: Colors.grey[350],
                        filled: true,
                        suffixIcon: _focus1.hasFocus || state is LocationLoading
                            ? state is LocationLoading
                                ? Transform.scale(
                                    scale: .6,
                                    child: CircularProgressIndicator.adaptive(
                                        strokeWidth: 5),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      pickupBloc
                                        ..add(CancelLocationEvent())
                                        ..add(DetectCurrentLocation());
                                    },
                                    icon: Icon(Icons.gps_fixed),
                                  )
                            : null,
                      ),
                      maxLines: 1,
                      onChanged: (value) {
                        if (state is LocationLoading) {
                          pickupBloc.add(CancelLocationEvent());
                        }
                      },
                      onSubmitted: (value) {
                        _focus2.requestFocus();
                      },
                      onTap: () {
                        setState(() {
                          isOnPickup = true;
                        });
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInCubic);
                      },
                    ),
                    suggestionsCallback: (pattern) async {
                      print(pattern);
                      //if (pattern.isEmpty) return Future.value();
                      return await locator
                          .get<LocationRepository>()
                          .getLoactionSearchResult(pattern);
                      //await BackendService.getSuggestions(pattern);
                    },
                    autoFlipDirection: true,
                    suggestionsBoxController: suggestionController1,
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.location_on_rounded),
                        title: Text(suggestion.displayPlace),
                        subtitle: Text(
                            '${suggestion.address.road} ${suggestion.address.state} ${suggestion.address.country}'),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      googleMapController.animateCamera(CameraUpdate.newLatLng(
                        LatLng(suggestion.position.latitude,
                            suggestion.position.longitude),
                      ));
                      textController1.text = suggestion.displayPlace;
                    },
                    keepSuggestionsOnLoading: false,
                    hideOnEmpty: true,
                    hideOnError: true,
                    hideOnLoading: true,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Dash(
                  direction: Axis.vertical,
                  length: 36,
                  dashLength: 8,
                  dashColor: AppColors.PRIMARY_COLOR,
                  dashGap: 4,
                  dashBorderRadius: 4,
                  dashThickness: 2,
                ),
              ),
              BlocConsumer<LocationBloc, LocationState>(
                bloc: dropoffBloc,
                listener: (context, state) {
                  if (state is LocationDetected) {
                    mapCenterPostion = state.currentLocation.location!;
                    googleMapController.animateCamera(CameraUpdate.newLatLng(
                      LatLng(state.currentLocation.location!.latitude,
                          state.currentLocation.location!.longitude),
                    ));
                    setState(() => textController2.text =
                        state.currentLocation.displayName);
                    formBloc.add(FetchAddress(
                        area: state.currentLocation.suburb,
                        street: state.currentLocation.road,
                        isPickup: false));
                    suggestionController2.close();
                    if (panelController.isPanelClosed) panelController.open();
                  } else if (state is LocationFetched) {
                    setState(() => textController2.text =
                        state.currentLocation.displayName);
                    formBloc.add(FetchAddress(
                        area: state.currentLocation.suburb,
                        street: state.currentLocation.road,
                        isPickup: false));
                    suggestionController2.close();
                  }
                },
                builder: (context, state) {
                  return TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      onTap: () {
                        setState(() {
                          isOnPickup = false;
                        });

                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInCubic);
                      },
                      enabled: pickupAddress != null,
                      controller: textController2,
                      focusNode: _focus2,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        // constraints: ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                          gapPadding: 0,
                        ),
                        icon: Icon(
                          Icons.location_on_rounded,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        hintText: 'Drop Off',
                        fillColor: Colors.grey[350],
                        filled: true,
                        suffixIcon: _focus2.hasFocus
                            ? state is LocationLoading
                                ? Transform.scale(
                                    scale: .6,
                                    child: CircularProgressIndicator.adaptive(
                                        strokeWidth: 5),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      dropoffBloc
                                        ..add(CancelLocationEvent())
                                        ..add(DetectCurrentLocation());
                                    },
                                    icon: Icon(Icons.gps_fixed),
                                  )
                            : null,
                      ),
                      onChanged: (value) {
                        if (state is LocationLoading) {
                          dropoffBloc.add(CancelLocationEvent());
                        }
                      },
                    ),
                    suggestionsCallback: (pattern) async {
                      print(pattern);
                      //if (pattern.isEmpty) return Future.value();
                      return await locator
                          .get<LocationRepository>()
                          .getLoactionSearchResult(pattern);
                      //await BackendService.getSuggestions(pattern);
                    },
                    autoFlipDirection: true,
                    suggestionsBoxController: suggestionController2,
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.location_on_rounded),
                        title: Text(suggestion.displayPlace),
                        subtitle: Text(
                            '${suggestion.address.road} ${suggestion.address.state} ${suggestion.address.country}'),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      googleMapController.animateCamera(CameraUpdate.newLatLng(
                        LatLng(suggestion.position.latitude,
                            suggestion.position.longitude),
                      ));
                      textController2.text = suggestion.displayPlace;
                    },
                    keepSuggestionsOnLoading: false,
                    hideOnEmpty: true,
                    hideOnError: true,
                    hideOnLoading: true,
                  );
                },
              ),
            ],
          ),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SlidingUpPanel(
              body: Stack(
                children: [
                  GoogleMap(
                    mapToolbarEnabled: false,
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: initPos,
                      zoom: 16,
                    ),
                    onMapCreated: (controller) {
                      googleMapController = controller;
                    },
                    onTap: (pos) {
                      googleMapController.animateCamera(CameraUpdate.newLatLng(
                        pos,
                      ));
                    },
                    onCameraMove: (cameraPos) {
                      mapCenterPostion = cameraPos.target;
                      //print("Map Moved $cameraPos");
                    },
                    onCameraIdle: () {
                      if (!requestOnMove) {
                        if (isOnPickup) {
                          pickupBloc.add(
                              FetchLocationAddress(location: mapCenterPostion));
                        } else {
                          dropoffBloc.add(
                              FetchLocationAddress(location: mapCenterPostion));
                        }
                      } else {
                        requestOnMove = false;
                      }
                      print("Map Idle $mapCenterPostion");
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Icon(
                        Icons.location_pin,
                        size: 40,
                        color: AppColors.BG_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
              // panel: Center(
              //   child: Text("This is the sliding Widget"),
              // ),
              panelBuilder: (sc) => BlocProvider<AddressFormBloc>(
                create: (context) => formBloc,
                child: AddressesPanel(
                  onResize: (value) {
                    setState(() {
                      resizeToAvoid = value;
                    });
                  },
                  scrollController: sc,
                  pageController: pageController,
                  pickupFormKey: pickupFormKey,
                  dropoffFormKey: dropoffFormKey,
                  pickupAddress: pickupAddress,
                ),
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              }),
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              controller: panelController,
            ),

            ///Back Button
            Positioned(
              left: 8,
              bottom: _fabHeight,
              child: FloatingActionButton.extended(
                icon: Icon(Icons.arrow_back_rounded),
                label: Text('Back'),
                onPressed: () {
                  if (pageController.page?.toInt() == 0) {
                    Navigator.of(context).pop();
                  } else {
                    pageController.animateToPage(0,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInCubic);
                  }
                },
                backgroundColor: Colors.white,
              ),
            ),

            ///Next Button
            Positioned(
              right: 8,
              bottom: _fabHeight,
              child: FloatingActionButton.extended(
                heroTag: Object,
                label: Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.PRIMARY_COLOR,
                ),
                icon: Text(
                  ' Next',
                  style: TextStyle(
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                onPressed: () {
                  if (pageController.page?.toInt() == 0) {
                    if (pickupFormKey.currentState!.validate()) {
                      setState(() {
                        pickupAddress = OrderAddress(
                          position: mapCenterPostion,
                          name: formBloc.pickupFormAddress.name,
                          area: formBloc.pickupFormAddress.area,
                          building: formBloc.pickupFormAddress.building,
                          floor: formBloc.pickupFormAddress.floor,
                          street: formBloc.pickupFormAddress.street,
                          phoneNumber: formBloc.pickupFormAddress.phoneNumber,
                          otherDetails: formBloc.pickupFormAddress.otherDetails,
                        );
                        isOnPickup = false;
                      });
                      pageController
                          .animateToPage(1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInCubic)
                          .then((value) => _focus2.requestFocus());
                      if (panelController.isPanelOpen) panelController.close();
                    } else {
                      if (panelController.isPanelClosed) panelController.open();
                    }
                  } else {
                    if (dropoffFormKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => VehicleSelectScreen()));
                    } else {
                      if (panelController.isPanelClosed) panelController.open();
                    }
                  }
                },
                backgroundColor: AppColors.BG_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    googleMapController.dispose();
    pickupBloc.close();
    dropoffBloc.close();
    formBloc.close();
    super.dispose();
  }
}
