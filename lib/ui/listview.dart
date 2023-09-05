import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/listview_bloc/listview_bloc_Screen.dart';
import '../bloc/listview_bloc/listview_event.dart';
import '../bloc/listview_bloc/listview_state.dart';
import '../model/listview_api_model.dart';

//stf
class ListViewSTF extends StatefulWidget {
  const ListViewSTF({super.key});

  @override
  State<ListViewSTF> createState() => _ListViewSTFState();
}

class _ListViewSTFState extends State<ListViewSTF> {

  // search bar controller
  final TextEditingController searchController = TextEditingController();

  //  1st Blank List
  List<FacilitiesList> filterList =[];
  // 2nd Blank List
  List<FacilitiesList> facilityList =[];




  void filterNames(String searchTerm) {
    filterList = [];
    filterList = facilityList.where((facility) =>
        facility.facilityName.toLowerCase().contains(searchTerm.toLowerCase())).toList();
      setState(() {
      filterList;
    });
  }






  // cal api on init method in flutter
  @override
  void initState() {
    BlocProvider.of<ListsBloc>(context).add(SetDataToListsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text(
          'Facilities List',
          style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<ListsBloc,ListState>(
        builder: (context,state){
          if(state is ListInProgressState){
            return  const Center(
              child: CircularProgressIndicator(

              ),
            );
          }
          else if(state is ListDataisLoadedState){


            ListApiModel listApiModel = state.listApiModel;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  //Search Bar
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: searchController,
                      onChanged: (text) => filterNames(text),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Search Patient',
                      hintStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.all(16.0),
                    ),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: filterList.length,
                        itemBuilder: (BuildContext context, int index){
                          // final user = _filteredUsers[index];
                          // print(user);
                        return ListTile(
                          title:  Column(
                            children: [
                              Container(
                                width: width*1.0,
                                height: height*0.07,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20),
                                ),

                                child: ListTile(
                                  subtitle: Text(filterList[index].facilityName),
                                  leading: const Icon(Icons.list,size: 40,color: Colors.purple,),
                                  title:  Text(listApiModel.data.facilitiesList[index].facilityName,style: const TextStyle(fontSize: 18),),
                                  trailing:  Text('${listApiModel.data.facilitiesList[index].facilityId}',style: const TextStyle(fontSize: 18),),
                                ),

                              ),




                            ],
                          ),


                          );


                      }
                    ),
                  ),
                ],
              ),
            );

          }
          return Container();

        },
        listener: (context,state){

          if(state is ListDataisLoadedState){

            ListApiModel listApiModel = state.listApiModel;
            print(listApiModel.data.facilitiesList);


             //   assign the facilities list into filter list
             filterList = listApiModel.data.facilitiesList;
          //  assign the 2nd list
            facilityList = listApiModel.data.facilitiesList;

            // filterNames("");







          }

          else if(state is ListsErrorState){


          }

        }
      ),

    );
  }
}

