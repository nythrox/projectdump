  // server/server.js
  let express = require("express");
    let graphqlHTTP = require("express-graphql");
    let { buildSchema } = require("graphql");
    let cors = require("cors");
    var mysql = require('mysql');

    con.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
    });
    let schema = buildSchema(`
    type User {
      id : String!
      nickname : String!
      avatar : String!
    }
    type Post {
        id: String!
        user: User!
        caption : String!
        image : String!
        likes: String!
    }
    type Query{
      user(id: String) : User!
      post(user_id: String, post_id: String) : Post!
      posts(user_id: String) : [Post]
    }
  `);
   // Maps id to User object
   let userslist = {
    a: {
      id: "a",
      nickname: "Chris",
      avatar: "https://upload.wikimedia.org/wikipedia/commons/0/01/Chris_Pine_2%2C_2013.jpg"
    },
  };

  let postslist = {
    a: {
      a: {
        id: "a",
        user: userslist["a"],
        caption: "Moving the community!",
        image: "https://pbs.twimg.com/media/DOXI0IEXkAAkokm.jpg",
        likes: "103"
      },
      b: {
        id: "b",
        user: userslist["a"],
        caption: "Angular Book :)",
        image:
          "https://cdn-images-1.medium.com/max/1000/1*ltLfTw87lE-Dqt-BKNdj1A.jpeg",
          likes: "37"
      },
      c: {
        id: "c",
        user: userslist["a"],
        caption: "Me at Frontstack.io",
        image: "https://pbs.twimg.com/media/DNNhrp6W0AAbk7Y.jpg:large",
        likes: "56"
      },
      d: {
        id: "d",
        user: userslist["a"],
        caption: "Moving the community!",
        image: "https://pbs.twimg.com/media/DOXI0IEXkAAkokm.jpg",
        likes: "61"
      }
    }
  };
  //resolver
  let root = {
    user: function({ id }) {
      return userslist[id];
    },
    post: function({ user_id , post_id }) {
      return postslist[user_id][post_id];
    },
    posts: function({ user_id }){
      return Object.values(postslist[user_id]);
    }
  };

  //express app 
  let app = express();
  app.use(cors());
  app.use(
    "/graphql",
    graphqlHTTP({
      schema: schema,
      rootValue: root,
      graphiql: true
    })
  );
  
  // set application port for server to listen to requests
  app.listen(4000);