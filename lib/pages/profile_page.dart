import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smn_v1/widgets/app_bar.dart';

// import 'package:smn_v1/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:smn_v1/widgets/provider_widget.dart';


class ProfilePage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'User Profile'
      ),
          body: Center(  
             child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FutureBuilder(
                    future: Provider.of(context).auth.getCurrentUser(),
                    builder: (context, snapshot) {
                      if ( snapshot.connectionState == ConnectionState.done) {
                        return displayUserInformation(context, snapshot);
                      } else {
                        return CircularProgressIndicator();
                      }
                    }
                  )
                ],
        ),
            ),
          ),
    );
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    
   return Column(
     children: <Widget>[
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text("Name: ${user.displayName ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
       ),

       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text("Email: ${user.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
       ),

      Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text("Created: ${DateFormat('MM/dd/yyyy').format(user.metadata.creationTime)}", style: TextStyle(fontSize: 20),),
       ),

      RaisedButton(
        child: Text("Sign Out"),
        onPressed: () async {
          try { 
            await Provider.of(context).auth.signOut();
            print("Signed Out!");
          } catch (e) {
            print(e);
          }
        },
      )
      //  showSignOut(context, user.isParent)
     ],
   );
  }

  // Widget showSignOut(context, bool isParent) {
  //   if (isParent == true) {
  //     return RaisedButton(
  //       child: Text("Sign In To Your Profile"),
  //       onPressed: () {
  //         Navigator.of(context).pushNamed('/parentPage');
  //       },
  //     );
  //   } else {
  //     return RaisedButton(
  //       child: Text("Sign Out"),
  //       onPressed: () async {
  //         try { 
  //           await Provider.of(context).auth.signOut();
  //           print("Signed Out!");
  //         } catch (e) {
  //           print(e);
  //         }
  //       },
  //     );
  //   }
  // }
}