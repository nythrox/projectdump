  // src.App.js

  import React, { Component } from 'react';
  import './App.css';
  
  import Header from './components/Header';
  import Post from './components/Post';
  
import Posts from './components/Posts';

import ApolloClient from 'apollo-boost';    import { ApolloProvider } from "react-apollo";
   


    const client = new ApolloClient({
      uri: "http://localhost:4000/graphql"
    });
    
    const App = () => {
      return (
        <ApolloProvider client={client}>
          <div className="App">
            <Header />
            <section className="App-main">
              <Posts />
            </section>
          </div>
        </ApolloProvider>
      );
    };
    export default App;