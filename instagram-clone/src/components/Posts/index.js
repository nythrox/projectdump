    // src/components/Posts/index.js
    
  import React from "react";
    import "./Posts.css";
    import { Query } from "react-apollo";
    import gql from "graphql-tag";
    import Post from "../Post";
  
    const get_info = gql`
    {
        posts(user_id: "a")
        {
        id
        user{
            nickname
            avatar
        }
        image
        caption
        likes
        }
    }
    `;
    
    const Posts = () => {
        return (
        <Query query={get_info}> 
        {({loading, error, data}) => 
        {
            if (loading) return <p>Loading Posts...</p>;
            if (error) return <p>Error Fetching Posts...</p>;
            let posts = data.posts;
            return (
                <div className="Posts">
                {
                posts.map(
                post => <Post nickname={post.user.nickname} avatar={post.user.avatar} image={post.image} caption={post.caption} key={post.id} likes={post.likes}/>
                )           //when it creates the post, it sets all the props (nickname, avatar, image, caption)
                
                }
            </div>
            );
        }
        }
        </Query>
    );
    }
    
    export default Posts;