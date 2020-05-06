import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/ui/shared/widgets/auth/authenticated-card.widget.dart';
import 'package:shopping/ui/shared/widgets/auth/unauthenticated-card.widget.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);
    return Scaffold(
      body: bloc.user == null ? UnauthenticatedCard() : AuthenticatedCard(),
    );
  }
}
