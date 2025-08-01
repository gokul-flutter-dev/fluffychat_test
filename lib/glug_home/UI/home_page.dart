import 'package:fluffychat/glug_chat/widgets/matrix.dart';
import 'package:fluffychat/glug_home/components/app_bar_components.dart' show appBarComponents;
import 'package:fluffychat/glug_home/components/home_dashboard_components.dart';
import 'package:fluffychat/glug_home/components/service_components.dart';
import 'package:fluffychat/glug_home/service/profile/user_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> avatars = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  
  void _addAvatar() {
    setState(() {
      avatars.add(Colors.primaries[avatars.length % Colors.primaries.length]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: CustomScrollView(
        
        reverse: false,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
         SliverAppBar(
          toolbarHeight: 30,
  pinned: true,
  expandedHeight: 100,
  flexibleSpace: LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final isCollapsed =
          constraints.maxHeight <= kToolbarHeight + MediaQuery.of(context).padding.top ;

        debugPrint("Is Collasped $isCollapsed");  

      return FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 10, bottom: 1),
        centerTitle: false,
        
        title: isCollapsed
            ? const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                CircleAvatar(
                  radius: 20,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person_outline_sharp,
          color: Colors.white,
          ),),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      Text("Gokul",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Text("Life is beautiful",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
                    ],
                  ),
              ],
            )
            : null,
        background: !isCollapsed? Padding(
          padding: const EdgeInsets.only(left: 16,bottom: 5),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: appBarComponents(userName: "Gokul",statusMessage: "Life is beautiful",profileUrl: "")),
        )
     :null );
    },
  ),
  actions: [
      IconButton(
      onPressed: () async{
        final matrix = Matrix.of(context);
        final client = matrix.client;
       final profile =await getUserProfile(client);
       debugPrint("Client Profile ${profile.avatarUrl}");
      },
      icon: const Icon(Icons.bookmark_outline),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.notifications_outlined),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.group_add_outlined),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.settings_outlined),
    ),
   
  ],
),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                // Search Bar
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                    child: SearchBar(
                      shadowColor: WidgetStatePropertyAll(
                        WidgetStateColor.resolveWith((states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.blueGrey;
                          } else if (states.contains(WidgetState.hovered)) {
                            return Colors.greenAccent;
                          }
                          return Colors.black;
                        }),
                      ),
                      leading: const Icon(Icons.search_outlined),
                      hintText: "Search",
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      ),
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      trailing: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.qr_code_scanner_outlined),
                        ),
                      ],
                    ),
                  ),
                ),

                // Dashboard Section
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      dashBoardComponents(iconData: Icons.cake_outlined, text: "Birthday", count: "3"),
                      dashBoardComponents(iconData: Icons.star_outline, text: "Favorite", count: "2"),
                      dashBoardComponents(iconData: Icons.group_outlined, text: "Groups", count: "4"),
                      dashBoardComponents(iconData: Icons.person_outline, text: "Friends", count: "5"),
                    ],
                  ),
                ),

                // Services header
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Services",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          minimumSize: WidgetStateProperty.all(Size.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft,
                        ),
                        child: const Text(
                          "See All",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                // Avatar Grid

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    serviceComponents(iconData: Icons.emoji_emotions_outlined,name: "Stickers"),
                     serviceComponents(iconData: Icons.format_paint_outlined,name: "Themes"),
                      serviceComponents(iconData: Icons.payments_outlined,name: "Glug Pay"),
                  ],
                ),
               
                // Expansion tiles
                const ExpansionTile(
                  title: Text('Groups'),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Expanded content goes here.'),
                    ),
                  ],
                ),
                const ExpansionTile(
                  title: Text('Friends'),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Expanded content goes here.'),
                    ),
                  ],
                ),
                const SizedBox(height: 100,),
              ],
            ),
          ),
         
        ],
         ),
    );
  }
}