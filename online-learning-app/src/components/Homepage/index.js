// src/components/Homepage/index.js  
import React from "react";
import Hero from "../Hero";
import Slider from "../Slider";
class Homepage extends React.Component{
  
  render(){
  return (
    <div>
      <Hero />
      <Slider title="This is a prop" />
      <Slider title="slider especial" />
    </div>
  );
}
} 
export default Homepage;
