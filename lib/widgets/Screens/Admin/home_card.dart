import 'package:flutter/material.dart';
import 'UsersDetails.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UsersDetails()));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffDDDDDD),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '02382323883823',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'fida@gmail.com',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        child: Image.asset(
                                          'assets/image/car.png',
                                        )),
                                    Text('Sajid')
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: Image.asset(
                                          'assets/image/debit_card.png'),
                                    ),
                                    Text('Jawad')
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        child: Image.asset(
                                            'assets/image/map.png')),
                                    Text('Ali')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
