import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/model/load_status.enum.dart';
import '../../common/screen/loading_screen.dart';
import '../cubit/hospitals_cubit.dart';
import 'widgets/hospital_tile.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalsCubit, HospitalsState>(
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.loaded) {
          final hospitals = state.hospitals;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(
                  'Hospitals Nearby',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final hospital = hospitals[index];
                    return HospitalTile(hospital: hospital);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: hospitals.length,
                ),
              ],
            ),
          );
        } else if (state.loadStatus == LoadStatus.loading) {
          return LoadingScreen();
        } else if (state.loadStatus == LoadStatus.error) {
          print(state.failure.exception);
          print(state.failure.stackTrace);
          return Center(
            child: Text('An Error Occured'),
          );
        } else {
          return Center(
            child: Text('Initial'),
          );
        }
      },
    );
  }
}
