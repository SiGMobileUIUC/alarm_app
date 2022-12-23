import 'package:flutter/material.dart';
import 'package:alarm_app/src/models/alarm_info.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  TextEditingController? _searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<AlarmInfo> _alarms = [];

  @override
  void initState() {
    super.initState();
    _alarms = [
      AlarmInfo(
          title: 'new years :)',
          alarmDateTime: DateTime.parse('2023-01-01 00:01:00Z')),
      AlarmInfo(
          title: 'yeah', alarmDateTime: DateTime.parse('2023-01-05 18:00:00Z')),
    ];
    _searchFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _searchFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title:
            Text('Alarms', style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x430F1113),
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                    child: TextFormField(
                      controller: _searchFieldController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Search for an alarm here...",
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Color(0xFF95A1AC),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: null,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: _alarms.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                      child: Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          _alarms[index].title ??
                                              "Alarm $index",
                                          style: const TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        // clean up
                                        _alarms[index].id != null
                                            ? _alarms[index].id.toString()
                                            : "No set time",
                                        style: const TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF39D2C0),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 4, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () async {},
                                        style: ButtonStyle(
                                          textStyle: MaterialStateProperty.all(
                                              const TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF39D2C0),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xFF39D2C0)),
                                          fixedSize: MaterialStateProperty.all(
                                              const Size(120, 40)),
                                          elevation:
                                              MaterialStateProperty.all(3),
                                        ),
                                        child: Text('Edit'),
                                        // options: FFButtonOptions(
                                        //   width: 120,
                                        //   height: 40,
                                        //   color: Color(0xFF39D2C0),
                                        //   textStyle: GoogleFonts.getFont(
                                        //     'Lexend Deca',
                                        //     color: Colors.white,
                                        //     fontSize: 14,
                                        //   ),
                                        //   elevation: 3,
                                        //   borderSide: BorderSide(
                                        //     color: Colors.transparent,
                                        //     width: 1,
                                        //   ),
                                        // ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                              child: InkWell(
                                                onTap: () async {},
                                                child: const Text(
                                                  '6:00am',
                                                  style: TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'Thursday June 22',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xB4FFFFFF),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })))
        ],
      ),
    );
    // return ListView.builder(
    //   itemCount: _alarms.length,
    //   itemBuilder: ((context, index) {
    //     return ListTile(
    //       title: Text(_alarms[index].alarmDateTime.toString()),
    //     );
    //   }),
    // );
  }
}
