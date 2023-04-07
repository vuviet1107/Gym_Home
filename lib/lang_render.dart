import 'dart:io';

void main(List<String> args) {
  CreateLang createLang = CreateLang();
  createLang.appendFile(
    keyConstName: "start",
    viContent: "Bắt đầu",
    enContent: "Start",
  );

  /// render
  createLang.writeKeyConstFile();
  createLang.writeFileEN();
  createLang.writeFileVi();
}

File getFile(String path) {
  return File(path);
}

class CreateLang {
  List<String> keyConstFileList = [];
  List<String> viList = [];
  List<String> enList = [];

  appendFile({
    required String keyConstName,
    required String viContent,
    required String enContent,
  }) {
    final keyConstFile =
        'static const $keyConstName = "${enContent.replaceAll(" ", "_")}";\n';
    keyConstFileList.add(keyConstFile);
    viList.add("KeyConst.$keyConstName:'$viContent',\n");
    enList.add('KeyConst.$keyConstName:"$enContent",\n');
  }

  writeKeyConstFile() async {
    String content = '';
    keyConstFileList.forEach((element) {
      content += element;
    });
    File constKeyFile = getFile("lib/util/key_const.dart");
    constKeyFile.writeAsString(fileKeyConstContent(content));
    print(await constKeyFile.readAsLines());
  }

  writeFileVi() {
    String content = '';
    viList.forEach((element) {
      content += element;
    });
    File constKeyFile = getFile("lib/util/lang/vi_VN.dart");
    constKeyFile.writeAsString(fileViContent(content));
  }

  writeFileEN() {
    String content = '';
    enList.forEach((element) {
      content += element;
    });
    File constKeyFile = getFile("lib/util/lang/en_US.dart");
    constKeyFile.writeAsString(fileEnContent(content));
  }

  String fileKeyConstContent(String content) {
    return '''
abstract class KeyConst {
  $content
}
''';
  }

  String fileViContent(String content) {
    return '''
import '../key_const.dart';

const Map<String, String> vi_VN = {
  $content
};
''';
  }

  String fileEnContent(String content) {
    return '''
import '../key_const.dart';

const Map<String, String> en_US = {
  $content
};
''';
  }

  String getFileContent(String path) {
    final file = getFile(path);
    return file.readAsStringSync();
  }
}
