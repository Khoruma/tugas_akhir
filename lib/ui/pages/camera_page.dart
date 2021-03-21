part of 'pages.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: MyImagePicker(),
          ),
        ));
  }
}

class MyImagePicker extends StatefulWidget {
  @override
  ImagePickerState createState() => ImagePickerState();
}

class ImagePickerState extends State {
  File img;
  String txt = "";

  void compressImg(File file) async {
    final filePath = file.absolute.path;

    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    // final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    // final splitted = filePath.substring(0, (lastIndex));
    // final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    final compressedImage = await FlutterImageCompress.compressWithFile(
        filePath,
        minWidth: 1000,
        minHeight: 1000,
        quality: 70);
  }

  void upload(File imageURI) async {
    final filePath = imageURI.absolute.path;

    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    var compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath, outPath,
        minWidth: 1000, minHeight: 1000, quality: 80);

    print("Sebelum Compress = ${imageURI.lengthSync()}");
    print("Sesudah Compress = ${compressedImage.lengthSync()}");

    File image = compressedImage;

    var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();

    String base = "https://korostar.tech/mobile";

    var uri = Uri.parse(base);
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(image.path));

    request.files.add(multipartFile);

    var response = await request.send();
    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      txt = value;
      setState(() {});
    });
  }

  void image_picker(int a) async {
    setState(() {});

    if (a == 0) {
      img = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      img = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    // imgPath = img.path;

    txt = "Menganalisa...";
    // compressImg(img);
    upload(img);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.brown,
                      ),
                    ),
                    img == null
                        ? Container(
                            width: 250,
                            height: 300,
                            child: Image.asset(
                              "assets/data.png",
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  // spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 10), // changes position of shadow
                                ),
                              ],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  // spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 10), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Image.file(img,
                                width: 250, height: 300, fit: BoxFit.cover),
                          ),
                    Container(
                      width: 30,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            img != null
                                ? Text(
                                    "${(txt)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17),
                                  )
                                : Text(
                                    'Tidak ada gambar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        child: RaisedButton(
                          onPressed: () => image_picker(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Feather.camera, size: 25, color: mainColor),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          // textColor: Colors.white,
                          color: Colors.white,
                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
