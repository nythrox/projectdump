const {
  UserTypeResolver,
  FindUserResolver,
  CreateUserResolver,
  FindAllUsersResolver,
  SearchUserResolver
} = require("./resolvers/UserResolvers");
const {
  FindAllPostsResolver,
  FindPostResolver,
  PostTypeResolver,
  CreatePostResolver
} = require("./resolvers/PostResolvers");

const resolvers = {
  Query: {
    ...FindUserResolver,
    ...FindAllUsersResolver,
    ...SearchUserResolver,
    ...FindPostResolver,
    ...FindAllPostsResolver
  },
  Mutation: {
    ...CreateUserResolver,
    ...CreatePostResolver
  },
  User: {
    ...UserTypeResolver
  },
  Post: {
    ...PostTypeResolver
  }
};

const routes = {
  Query: resolvers.Query,
  Mutation: resolvers.Mutation
}
console.log("--------------- ROUTES ---------------");
console.log(routes);
console.log("--------------------------------------");
module.exports = resolvers;
