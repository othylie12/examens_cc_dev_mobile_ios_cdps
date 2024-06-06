import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firebase_storage_sync_services.dart';
import '../services/shared_preferences_service.dart';
import 'information_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<SharedPreferencesService> _prefsService;
  late FirebaseSyncService _syncService;

  @override
  void initState() {
    super.initState();
    _prefsService = SharedPreferencesService.getInstance();
    setupSyncService();
  }

  Future<void> setupSyncService() async {
    final prefsService = await SharedPreferencesService.getInstance();
    _syncService = FirebaseSyncService(FirebaseFirestore.instance, prefsService);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<SharedPreferencesService>(
      future: _prefsService,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          SharedPreferencesService prefsService = snapshot.data!;
          return Scaffold(
              appBar: AppBar(
                title: const Text('Profile Page',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body : Padding(
                padding:  const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    Container(
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow[700] ?? Colors.yellow,
                        child: Text(
                          (prefsService.getName()?.length ?? 0) >= 2
                              ? prefsService.getName()?.substring(0, 2)?.toUpperCase() ?? ''
                              : prefsService.getName()?.toUpperCase() ?? '',
                          style: const TextStyle(fontSize: 50.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20.0),
                        Text('Nom et prenom ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text("${prefsService.getName()}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      children: [
                        const SizedBox(height: 20.0),
                        const Text('Nom et prenom ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(prefsService.getName() ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      children: [
                        Text('Numero de carte d\'identité ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(prefsService.getIdentityCardNumber() ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      children: [
                        Text('Niveau d\'etude ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),

                        Text(prefsService.getEducation() ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    //const SizedBox(height: 20.0),
                    Column(
                      children: [
                        Text('Profession ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(prefsService.getProfession() ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //const SizedBox(height: 20.0),
                    const SizedBox(height: 20.0),
                    Column(
                      children: [
                        Text('Statut marital ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(prefsService.getMaritalStatus() ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width * 0.4 ,
                          height: size.height * 0.06,
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InformationPage(prefsService: prefsService)),
                              );
                            },
                            style: ButtonStyle(

                              backgroundColor: WidgetStateProperty.all<Color>(const Color(0xff145a32 )),
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.transparent)
                                  )
                              ),
                            ),

                            child: const Text('Modifier',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                        Container(
                          width: size.width *0.4 ,
                          height: size.height * 0.06,
                          child: ElevatedButton(
                            onPressed: () async {
                              await _syncService.uploadData();
                              //await _syncService.downloadData();

                              setState(() {});
                            },
                            style: ButtonStyle(

                              backgroundColor: WidgetStateProperty.all<Color>( Colors.yellow[900] ?? Colors.yellow),
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.transparent)
                                  )
                              ),
                            ),

                            child: const Text('synchroniser',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              )
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}