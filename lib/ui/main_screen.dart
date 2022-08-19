import 'package:flutter/material.dart';
import 'package:mvvm_guide/domain/model/photo.dart';
import 'package:mvvm_guide/ui/main_action.dart';
import 'package:provider/provider.dart';

import '../di/di_setup.dart';
import 'main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          getIt<MainViewModel>()..onAction(const MainAction.fetchImages('')),
      builder: (context, _) {
        final viewModel = context.watch<MainViewModel>();
        final orientation = MediaQuery.of(context).orientation;
        final state = viewModel.state;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              '이미지 검색 앱',
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        viewModel
                            .onAction(MainAction.fetchImages(_controller.text));
                      },
                      child: const Icon(Icons.search),
                    ),
                    hintText: '검색어를 입력하세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('결과 : ',
                    style: Theme.of(context).textTheme.titleSmall),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                orientation == Orientation.portrait ? 2 : 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          children: state.images.map((Photo image) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                image.previewURL,
                                fit: BoxFit.cover,
                              ),
                            );
                          }).toList(),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
