
//app.js with react-router
import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import { Switch } from "react-router-dom";
import Homepage from "./components/Homepage";
import Navbar from "./components/Navbar";
import Post from "./components/Post";
import Footer from "./components/Footer";


class BasicExample extends React.Component {


  
  render() {
    return (
      <BrowserRouter>
        <div>
          <Navbar/>
          
          <Switch>
          <Route exact path="/" component={Homepage} />
          <Route path="/post/:post_name" component={SinglePost} />
          </Switch>
          <Footer/>
        </div>
      </BrowserRouter>
    );
  }
}
function SinglePost({ match }) {
  return (
    <div>
      <Post post_name={match.params.post_name} />
      {/*<Sidebar />*/}
    </div>
  );
}


export default BasicExample;
