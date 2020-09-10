import 'package:dogbin_mobile/models/document.dart';
import 'package:dogbin_mobile/models/user.dart';
import 'package:dogbin_mobile/providers/dogbin_documents_provider.dart';
import 'package:dogbin_mobile/providers/dogbin_login_provider.dart';
import 'package:dogbin_mobile/service_locator.dart';
import 'package:dogbin_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final docsProviders =
    FutureProvider.family<List<Document>, String>((ref, apiKey) {
  return locator<DogbinDocuments>().getDocuments(apiKey);
});

class DocumentsView extends ConsumerWidget {
  static const String id = '/documents';

  DocumentsView();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Documents',
          style: TextStyle(color: customColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await locator<DogbinLogin>().logout(user.apiKey);
            },
          )
        ],
      ),
      body: watch(docsProviders(user.apiKey)).when(
        data: (documents) => ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Document doc = documents[index];
              //DateTime cDate = doc.created;
              return Card(
                child: ListTile(
                  trailing: Icon(
                    doc.type == 'url' ? Icons.link : Icons.paste,
                    color: customColor,
                  ),
                  title: Text(doc.slug),
                  subtitle: Text(doc.link),
                ),
              );
            }),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (obj, stackTrace) => Center(
          child: Text('Sin elementos.'),
        ),
      ),
    );
  }
}
