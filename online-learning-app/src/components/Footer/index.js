// src/components/Footer/index.js  
import React from "react";

class Footer extends React.Component{
    render(){
        return (
          
        <footer className="footer">
            <div className="footer-row">
            <div className="f-left"><h1 className="menu-logo">C A M P U S</h1> Copyright © 2019 Campus</div>	 
            <div className="f-right">
                  Terms
                  Pivacy Policy and Cookie Policy
                  Intellectual Property
            </div> 
            </div>
        </footer>

       );
    }   
}
export default Footer;