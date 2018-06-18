import 'package:flutter/material.dart';
import '../../components/base_scaffold.dart';
import 'match/no_matches_found.dart';
import 'match/matches_found.dart';

// Stateful widget
class MatchPage extends StatefulWidget {
  static final Widget noMatchesFoundScreen = new NoMatchesFound();
  static final Widget matchesFoundScreen = new MatchesFound();

  @override
  _MatchPageState createState() => _MatchPageState();
}

// State
class _MatchPageState extends State<MatchPage> {
  bool hasMatches;
  Widget activePage;

  // Update the active page
  void _updateActivePage()
  {
      setState((){
          this.activePage = this.hasMatches ? MatchPage.matchesFoundScreen : MatchPage.noMatchesFoundScreen;
      });
  }
  //Initial state
  @override
  void initState() {
    super.initState();
    this.hasMatches = false; //TODO: Make this check if there are actually any matches
    this._updateActivePage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text(
                "Singularity",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,//TODO : Change to theme text color
                )        
                ),
                backgroundColor: Colors.purple[700],//TODO : Change to theme color
                // actions: <Widget>[
                //      PopupMenuButton(
                //         onSelected: _onSelected,
                //         itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                //             PopupMenuItem(
                //                 value: 'navChat',
                //                 child: Text("Chats"),
                //             ),
                //             PopupMenuItem(
                //                 value: 'navCalls',
                //                 child: Text("Calls"),
                //             ),
                //             PopupMenuItem(
                //                 value: 'navSettings',
                //                 child: Text("Settings"),
                //             ),
                //         ])
                // ],
            ),
            body: this.activePage,
        )    
    );
  }

  void _onSelected(value) {
    print(value);
  }
}

    