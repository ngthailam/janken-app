part of '../login_register_page.dart';

class _RegisterTab extends StatelessWidget {
  _RegisterTab({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Register'),
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Username'),
        ),
        MaterialButton(
          onPressed: () {
            context.read<LoginRegisterBloc>().register(_controller.text);
          },
          child: Text('Register'),
        ),
      ],
    );
  }
}
