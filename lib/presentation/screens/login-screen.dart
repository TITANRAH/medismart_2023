import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medismart_2023/presentation/providers/user/user_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final passController = TextEditingController(text:'178695');
    final usernameController = TextEditingController(text:'17869526-6');
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleSmall;
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset('./assets/logos/logo.svg'),
                  Form(
                    key: myFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        _InputLogin(
                          loginController: usernameController,
                          label: 'Ingresa tu Usuario',
                          hintText: 'Usuario',
                          icon: Icons.person_2_outlined,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        _InputLogin(
                          loginController: passController,
                          label: 'Ingresa tu Password',
                          hintText: 'Password',
                          icon: Icons.remove_red_eye_outlined,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '¿Olvidaste tu password?',
                                  style: titleStyle!
                                      .copyWith(color: colors.primary),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    ref
                                        .read(isLoadingProvider.notifier)
                                        .isTrue();

                                    if (!myFormKey.currentState!.validate()) {
                                      return;
                                    }
                                    ref
                                        .read(userActiveProvider.notifier)
                                        .getUser(usernameController.value.text,
                                            passController.value.text)
                                        .whenComplete(() {
                                      usernameController.clear();
                                      passController.clear();
                                      context.push('/home-screen');
                                      ref
                                          .read(isLoadingProvider.notifier)
                                          .isFalse();
                                    });
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        if (isLoading)
                                          SizedBox(
                                            width: 15,
                                            height: 15,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: colors.onPrimary,
                                            ),
                                          ),
                                          if (isLoading)
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          isLoading ? 'Ingresando' :'Ingresar',
                                          style: titleStyle.copyWith(
                                              color: colors.onPrimary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const _Bandera(
                              bandera: './assets/img/chile.png',
                            ),
                            const _FooterLogin()
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputLogin extends StatelessWidget {
  final TextEditingController? loginController;
  final String label;
  final String hintText;
  final IconData icon;

  const _InputLogin({
    required this.loginController,
    required this.label,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );

    final inputDecoration = InputDecoration(
      hintText: hintText,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: Icon(
        icon,
        color: colors.primary,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: titleStyle!
              .copyWith(color: colors.primary, fontWeight: FontWeight.w800),
        ),
        TextFormField(
          // pulso fuera de la pantalla y pierde el foco se minimiza el teclado
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          focusNode: focusNode,
          controller: loginController,
          decoration: inputDecoration,
          validator: (value) {
            if (value == '') return 'El campo está vacío';
            return null;
          },
        ),
      ],
    );
  }
}

class _Bandera extends StatelessWidget {
  final String? bandera;
  const _Bandera({this.bandera});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            child: Image.asset(bandera!),
          ),
        ),
      ),
    );
  }
}

class _FooterLogin extends StatelessWidget {
  const _FooterLogin();

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleSmall;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Atendemos por Isapre y Fonasa',
              style: titleStyle,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 80,
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: Image.asset('./assets/logos/webpay-logo.png'),
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: Image.asset('./assets/logos/logo-fonasa.png'),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Términos y condiciones'),
            Text('Políticas de seguridad')
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('2022 © Medical')
      ],
    );
  }
}
