import 'package:image_picker/image_picker.dart';

Future<PickedFile> pick(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: source);

  return PickedFile(pickedFile!.path);
}