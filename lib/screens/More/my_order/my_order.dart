import 'package:meals/Network/export.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key?key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: order.isEmpty
          ? Center(
        child: Text(yourOrderIsEmpty),
      )
          : ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(
            order[index]['name'],
          ),
          direction: DismissDirection.endToStart,
          background: slideLeftBackground(),
          onDismissed: (direction) {
            order.removeAt(index);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(itemDelete),
              ),
            );
          },
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        order[index]['image'],
                      ),fit: BoxFit.cover,

                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order[index]['name'],
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        order[index]['rate'].toString(),
                      ),
                      Text(
                        order
                        [index]['description'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


List<Map> order = [];