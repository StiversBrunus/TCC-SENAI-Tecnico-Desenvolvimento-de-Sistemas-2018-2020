import 'package:flutter/material.dart';

class UserFavoritesTab extends StatelessWidget {
  const UserFavoritesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'você ainda não adicionou nenhum \nfotógrafo a sua lista de favoritos',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
