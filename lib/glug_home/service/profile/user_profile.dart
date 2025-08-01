
import 'package:matrix/matrix.dart';

Future<Profile> getUserProfile(Client client)async{

final profile =  await client.fetchOwnProfile();

return profile;
}