part of '../login_register_page.dart';

class _LoginTab extends StatelessWidget {
  _LoginTab({Key? key}) : super(key: key);

  final TextEditingController _controller =
      TextEditingController(text: 'Lam xx 1');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Login'),
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Username'),
        ),
        MaterialButton(
          onPressed: () {
            context.read<LoginRegisterBloc>().login(_controller.text);
          },
          child: Text('Login'),
        ),
        MaterialButton(
          onPressed: () {
            context.read<LoginRegisterBloc>().login('Lam xx 664');
          },
          child: Text('Login Lam xx 664'),
        ),
        MaterialButton(
          onPressed: () {
            context.read<LoginRegisterBloc>().login('Lam xx 15');
          },
          child: Text('Login Lam xx 15'),
        ),
      ],
    );
  }
}
