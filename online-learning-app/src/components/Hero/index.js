// src/components/Hero/index.js  
import "./Hero.css";
import React from "react";

class Hero extends React.Component{
    render(){
        return (
          
      <div className="container-fluid hero">
      <div className="container hero-content">
         <div className="hero-title">
            <h1>Valentine Day Salem Hunt</h1>
         </div>
         <div className="hero-subtitle">
            <p>Hunt them to the ground! Offers until friday the first.</p>
         </div>
      </div>
   </div>
       );
    }   
}
export default Hero;