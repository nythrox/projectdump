import 'package:chat/models/user_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppService {
  HasuraConnect connection =
      HasuraConnect('https://test-learning.herokuapp.com/v1/graphql');

  Future<UserModel> getUserFromName(String user) async {
    String query = """
    getUserByName(\$name:String!){
      user(where: {name: {_eq: \$name}}){
        name
        id
      }
    }
                  """;
    var data = await connection.query(query, variables: {"name": user});
    if (data["data"]["user"].isEmpty) {
      createUser(user);
    } else {
      return UserModel.fromJson(data["data"]["user"][0]);
    }
  }

  Future<List<UserModel>> getUsers() async {
    String query = """
      getUsers{
        user
        {
          id
          name
        }
      }
    """;

    var data = await connection.query(query);
    if (data["data"]["user"].isEmpty) {
      print("No users at all.");
    } else {
      List<UserModel> users = [];
      data["data"]["user"]
          .toList()
          .forEach((i) => {users.add(UserModel.fromJson(i))});
      return users;
    }
  }

  getChatsFromUserId(int userId) {}

  Future<UserModel> createUser(String name) async {
    var query = """
    createUser(\$name:String!){
      mutation {
        insert_user(objects: {name: \$name}) {
          returning {
            id
          }
        }
      }
    }
    """;

    var data = await connection.mutation(query, variables: {"name": name});
    var id = data["data"]["insert_users"]["returning"][0]["id"];
    return UserModel(name: name, id: id);
  }

  getMessagesFromChatId(int chatId) {}
}
