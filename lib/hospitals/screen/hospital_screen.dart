import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/common/model/load_status.enum.dart';
import 'package:prega_diet/common/screen/loading_screen.dart';
import 'package:prega_diet/hospitals/cubit/hospitals_cubit.dart';
import 'package:prega_diet/hospitals/screen/widgets/hospital_tile.dart';

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
