import 'package:flutter/material.dart';
import 'package:search_image1/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: '내용을 입력하세요',
              fillColor: Colors.white70,
              suffixIcon: IconButton(
                  onPressed: () async {
                    viewModel.fetchImages(textController.text);
                  },
                  icon: const Icon(Icons.search)),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: viewModel.photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                final data = viewModel.photos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(data: data)),
                    );
                  },
                  child: Hero(
                    tag: '${data.id}',
                    child: Image.network(
                      data.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
