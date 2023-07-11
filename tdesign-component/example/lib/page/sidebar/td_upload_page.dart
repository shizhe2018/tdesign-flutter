import 'package:flutter/material.dart';
import 'package:tdesign_flutter/td_export.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class TDUploadPage extends StatefulWidget {
  const TDUploadPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TDUploadState();
}

class TDUploadState extends State<TDUploadPage> {
  final List<TDUploadFile> files1 = [];
  final List<TDUploadFile> files2 = [
    TDUploadFile(
        key: 1,
        remotePath:
            'https://tdesign.gtimg.com/miniprogram/images/example4.png'),
    TDUploadFile(
        key: 2,
        remotePath:
            'https://tdesign.gtimg.com/miniprogram/images/example6.png'),
    TDUploadFile(
        key: 3,
        remotePath:
            'https://tdesign.gtimg.com/miniprogram/images/example5.png'),
  ];

  void onVaueChanged(List<TDUploadFile> fileList, List<TDUploadFile> value,
      TDUploadType event) {
    switch (event) {
      case TDUploadType.add:
        setState(() {
          fileList.addAll(value);
        });
        break;
      case TDUploadType.remove:
        setState(() {
          fileList.removeWhere((element) => element.key == value[0].key);
        });
        break;
    }
  }

  void onClick(int key) {
    print('点击 $key');
  }

  void onCancel() {
    print('取消');
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        exampleCodeGroup: 'upload',
        desc: '上传组件',
        children: [
          ExampleModule(
            title: '组件类型',
            children: [
              ExampleItem(desc: '单选上传图片', builder: _uploadSingle),
              ExampleItem(desc: '多选上传图片', builder: _uploadMultiple),
            ],
          ),
        ]);
  }

  @Demo(group: 'upload')
  Widget _uploadSingle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TDUpload(
        files: files1,
        onClick: onClick,
        onChange: ((files, type) => onVaueChanged(files1, files, type)),
      ),
    );
  }

  @Demo(group: 'upload')
  Widget _uploadMultiple(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TDUpload(
        files: files2,
        multiple: true,
        max: 5,
        onClick: onClick,
        onCancel: onCancel,
        onError: print,
        onValidate: print,
        onChange: ((files, type) => onVaueChanged(files2, files, type)),
      ),
    );
  }
}