import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){},
          child: const Icon(
            Icons.insert_comment_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text('About us', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Who you are .',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: const [
                  Text(
                    'Ullamcorper errors sensctus urna sit element um aliq uet.Nibh maruris trist ique elit pellen'
                        'tesque sapien malesuada eleifend. Lorem ipsum  dolor sit amet, Consectetur adipiscing elit.Libero, '
                        'condimentum dolor tempor aenean lacina.Volutpat faucibus eumassa et volutpat at cras in . '
                        'lectus send et,send tristique semper.Lectus nec,nunc maecenas egestas eges tas sit facilisis ullamcoper'
                        '.Nunc,irsus con sequat in ornare mauris.Hac ullamc orper orci commodo,mauris risus '
                        'felis.Nisl a trist ique donec eu.Purus molllis mollis senectus rhoncus nec ante interdum'
                        '. urna,tellus,a commodo tortor augue ut malesuada odio iaculis proin. Habitasse quis tincidunt'
                        'elem entum eleifend felis eleifend eget. ullamcoper eros sensectus urna sit element um '
                        'aliq uet.Nibh maruis trist ique elit pellen tesque sapien malesada eleifend',

                    // textAlign: TextAlign.center,
                    // style: TextStyle(letterSpacing: 0.7),

                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'How you do it!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: const [
                      Text(
                        'Ullamcorper errors sensctus urna sit element um aliq uet.Nibh maruris trist ique elit pellen'
                            'tesque sapien malesuada eleifend. Lorem ipsum  dolor sit amet, Consectetur adipiscing elit.Libero, '
                            'condimentum dolor tempor aenean lacina.Volutpat faucibus eumassa et volutpat at cras in . '
                            'lectus send et,send tristique semper.Lectus nec,nunc maecenas egestas eges tas sit facilisis ullamcoper'
                            '.Nunc,irsus con sequat in ornare mauris.Hac ullamc orper orci commodo,mauris risus '
                            'felis.Nisl a trist ique donec eu.Purus molllis mollis senectus rhoncus nec ante interdum'
                            '. urna,tellus,a commodo tortor augue ut malesuada odio iaculis proin. Habitasse quis tincidunt'
                            'elem entum eleifend felis eleifend eget. ullamcoper eros sensectus urna sit element um ',

                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
