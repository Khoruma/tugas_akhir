part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Text(userState.user.name)
                    : SizedBox()),
            RaisedButton(
                child: Text("Sign Out"),
                onPressed: () {
                  AuthServices.signOut();
                })
          ],
        ),
      ),
    );
  }
}
